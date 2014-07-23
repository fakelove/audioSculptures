
#include "Squid.h"

const float myPI = 3.14159265358979;

Squid::Squid() {
    
}

Squid::~Squid() {
    
}


//--------------------------------------------------------------
void Squid::setup(){
    
    point1.set(0, 0);
    point2.set(0, 500);
    point3.set(200, 0);
    point4.set(200, 200);
    
    trackVolume = 0.0;
    //sound.loadSound("sounds/squidSound.caf");
    //sound.play();
    //sound.setLoop(true);
    //sound.setVolume(trackVolume);
    squidPos.set(0, 0);
    squidSize = 2.0;
    
    //STK
    stk::Stk::setSampleRate(44100.0);
    soundCyl.openFile(ofFilePath::getAbsolutePath("sounds/squidSoundAlt.aif"));
    chorus.setEffectMix(1.0);
    reverb.setRoomSize(1.0);
    soundCyl.normalize(0.30);

    audioOn = false;

}

//--------------------------------------------------------------
void Squid::update(){
    
    rotate += 0.33f;
    speedNoise += 0.10f;
    
    noise = 1000 * ofNoise(speedNoise);

    //sound.setVolume(trackVolume);
    //sound.setSpeed(trackPitch);
}


//--------------------------------------------------------------
void Squid::draw(){
    
    
    for ( int i = 0; i < 250; i++ ) {
        
        ofPushStyle(); {
            
            ofPushMatrix(); {
                ofSetLineWidth(.75);
                ofSetColor(randomFill, ofMap(i, 0, 250, 150, 75));
                ofNoFill();
                ofTranslate(ofGetWidth() / 2, ofGetHeight() / 2);
                ofScale(squidSize, squidSize);
                ofRotateX( i + squidPos.y );
                ofRotateY( rotate + i );
                ofRotateZ( rotate  + myPI * i );
                ofScale(1.50, 1.50);
                ofCurve(point1.x + i + noise * 10, point1.y + i + noise * 10, point2.x + i, point2.y + i, point3.x + i, point3.y + i, point4.x * 10, point4.y * 10);
                
            } ofPopMatrix();
            
        } ofPopStyle();
        
    }
    
    
    
}

//--------------------------------------------------------------
void Squid::slide(int x, int y){
    
    //trackVolume = (ofMap(x, 0, ofGetHeight(), .05f, 2.0f, true));
    //trackPitch = (ofMap(x, 0, ofGetHeight(), .05f, 2.0f, true));

    squidPos.x = x;
    squidPos.y = y;
    squidSize = ofMap(x, 0, ofGetHeight(), .25, 3.0, true);
    
    //soundCyl.setFrequency(ofMap(x, 0, ofGetHeight(), 0.03, 0.05, true));
   
    chorus.setModDepth(ofMap(y, ofGetWidth(), 0, 0.25, 1.0, true));
    chorus.setModFrequency(ofMap(x, ofGetHeight(), 0, 0.0, 1.0, true));
    
}

void Squid::upTouch(int x, int y) {
    
}
void Squid::downTouch(int x, int y) {

    soundCyl.reset();
    audioOn = true;

}


//--------------------------------------------------------------
void Squid::exit(){
    
}

void Squid::randomizeColor() {
    
    randomColor = ofRandom(4);
    
    switch (randomColor) {
        case 0:
            randomFill = ofColor::crimson;
            break;
        case 1:
            randomFill = ofColor::aquamarine;
            break;
        case 2:
            randomFill = ofColor::whiteSmoke;
        case 3:
            randomFill = ofColor::crimson;
            break;
        default:
            randomFill = ofColor::black;
            break;
    }
    
    
}

void Squid::audioOut(float *output,int bufferSize,int nChannels) {
    
    if (audioOn) {
        stk::StkFrames frames(bufferSize, 2);
        soundCyl.tick(frames);
        
        // the beat is a 2 channel file , however most effects only work on on channel
        // so we will just use the left channel. If you want to apply effects on the second channel you need to
        //create two sets of effects one for the left channel and one for the right channel
        stk::StkFrames leftChannel(bufferSize,1);
        for (int i = 0; i < bufferSize; i++) {
            leftChannel[i] = frames(i,0);
        }
        //REVERB
        stk::StkFrames reverbOut(bufferSize,2);
        reverb.tick(leftChannel,reverbOut,0,0);
        for (int i = 0; i < bufferSize; i++) {
            leftChannel[i] = reverbOut(i,0);
        }
        //CHORUS
        stk::StkFrames chorusOut(bufferSize,2);
        chorus.tick(leftChannel,chorusOut,0,0);
        for (int i = 0; i < bufferSize; i++) {
            leftChannel[i] = chorusOut(i,0);
        }
       
        
        for (int i = 0; i < bufferSize ; i++) {
            output[ 2 * i ] = leftChannel[i];
            output[ 2 * i + 1 ] = leftChannel[i];
        }
    }
    
    
}


