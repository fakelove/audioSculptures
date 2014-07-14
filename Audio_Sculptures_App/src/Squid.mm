
#include "Squid.h"

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
    sound.loadSound("sounds/squidSound.caf");
    sound.play();
    sound.setLoop(true);
    sound.setVolume(trackVolume);
    squidPos.set(0, 0);
    squidSize = 2.0;
    
}

//--------------------------------------------------------------
void Squid::update(){
    
    rotate += 0.33f;
    speedNoise += 0.10f;
    
    noise = 1000 * ofNoise(speedNoise);
    sound.setVolume(trackVolume);

    
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
                ofRotateZ( rotate  + PI * i );
                ofScale(.50, .50);
                ofCurve(point1.x + i + noise * 10, point1.y + i + noise * 10, point2.x + i, point2.y + i, point3.x + i, point3.y + i, point4.x * 10, point4.y * 10);
                
            } ofPopMatrix();
            
        } ofPopStyle();
        
    }
    
    
    
}

//--------------------------------------------------------------
void Squid::slide(int x, int y){
    
    sound.setPan(ofMap(y, 0, ofGetWidth(), -1.0, 1.0, true));
    squidPos.x = x;
    squidPos.y = y;
    squidSize = ofMap(x, 0, ofGetHeight(), .25, 3.0, true);
    
    
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


