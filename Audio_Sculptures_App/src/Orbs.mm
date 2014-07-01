
#include "Orbs.h"

Orbs::Orbs() {
    
}

Orbs::~Orbs() {
    
}

//--------------------------------------------------------------
void Orbs::setup(int posX, int posY, float orbSize){
    
    ofDisableArbTex(); // we need GL_TEXTURE_2D for our models coords.
    pos.set(posX, posY, 0);
    model.loadModel("orb2.dae");
    //model.setPosition(pos.x, pos.y, pos.z);
    rotate = 0;
    
    c = ofColor::teal;
    c.a = 50;
    size = orbSize;
    
    ofxAccelerometer.setup();
    ofxAccelerometer.setForceSmoothing(200);
    
    int fileAmt = 5;
    
    for (int i = 0; i < fileAmt; i++) {
        sounds.resize(i);
    }
    
    for (int i = 0; i < sounds.size(); i++) {
        sounds[i].loadSound("sounds/orb" + ofToString(i) + ".caf");
        sounds[i].setVolume(1.0);
    }
    
    
}

//--------------------------------------------------------------
void Orbs::update(float noiseSpeed, float rotationSpeed){
    
    model.update();
    rotate += 0.33f;
    noise += noiseSpeed;
    sendNoise = 300 * ofNoise(noise);
    
    
    total -= total;
    total += ofMap(ofxAccelerometer.getForce().x, 0.0, 1.0, -10, 600);
    pos.y = total + sendNoise;
    
    
    triggerSounds = ofMap(sendNoise, 0, 300, 0.0, 1.0);
    triggerSounds = round(triggerSounds);
    //cout << "Accel: " << total << endl;
    
    
    if (triggerSounds == 1 && !sounds[sampleCycle].getIsPlaying()) {
        
        sampleCycle = ofRandom(sounds.size());
        sounds[sampleCycle].play();
        c = ofColor::whiteSmoke;
    } else {
        c = ofColor::teal;
    }
    
    for (int i = 0; i < sounds.size(); i++) {
        sounds[i].setVolume(ofMap(ofxAccelerometer.getForce().x, 0.0, 1.0, 1.0, 0.10, true));
        sounds[i].setSpeed(ofMap(ofxAccelerometer.getForce().x, 0.0, 1.0, 1.0, 0.60, true));
    }
    
    // cout << "Orb Pos Y: " << sampleCycle << endl;
    
    
}

//--------------------------------------------------------------
void Orbs::draw(){
    
    ofPushStyle(); {
        
        ofEnableDepthTest();
        //Outside Orb
        ofSetColor(c, 75);
        
        ofPushMatrix(); {
            
            ofTranslate(pos);
            //ofScale(size, size);
            model.setScale(size, size, size);
            ofRotateX(rotate);
            ofRotateY(rotate);
            model.drawWireframe();
            
        } ofPopMatrix();
        
        //Inside Orb
        ofSetColor(0, 0, 0, sendNoise);
        ofPushMatrix(); {
            
            ofTranslate(pos);
            model.setScale(size, size, size);
            //ofScale(size, size);
            ofRotateX(rotate);
            ofRotateY(rotate);
            model.drawFaces();
            
        } ofPopMatrix();
        
        ofDisableDepthTest();
        
    } ofPopStyle();
    
    
}

void Orbs::randomizePosition(int posX, int posY) {
    
    pos.set(posX, posY, 0);
    
}

void Orbs::randomizeColor() {
    
    randomColor = ofRandom(4);
    
    switch (randomColor) {
        case 0:
            c = ofColor::crimson;
            break;
        case 1:
            c = ofColor::aquamarine;
            break;
        case 2:
            c = ofColor::whiteSmoke;
        case 3:
            c = ofColor::teal;
        default:
            c = ofColor::black;
            break;
    }
    
}

//--------------------------------------------------------------
void Orbs::exit(){
    
}

//--------------------------------------------------------------
void Orbs::touchDown(ofTouchEventArgs & touch){
    
}


//--------------------------------------------------------------
void Orbs::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void Orbs::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void Orbs::touchCancelled(ofTouchEventArgs & touch){
    
}

