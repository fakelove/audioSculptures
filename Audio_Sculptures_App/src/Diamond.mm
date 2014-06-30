
#include "Diamond.h"

Diamond::Diamond() {
    
}

Diamond::~Diamond() {
    
}

//--------------------------------------------------------------
void Diamond::setup(){
    
    
    soundFiles.push_back("sounds/shapeBass1.caf");
    soundFiles.push_back("sounds/shapeBass2.caf");
    soundFiles.push_back("sounds/shapeBass3.caf");
    
    sound.loadSound(soundFiles[0]);
    sizeTrigger = 60;
    pos.set(ofGetWidth() / 2 + 250, ofGetHeight() / 2 + 100);
    
    randomFill.set(ofColor::black);
    outerDiaColor.set(ofColor::black);
    
    movementOn = false;
    
}

//--------------------------------------------------------------
void Diamond::update(){
    
    rotate += 0.33f;
    speed += 0.20f;
    noise = 50 * ofNoise(speed);
    noise = noise / 2;
    sine = 4.0 * sin(speed);
    
    if (trigger == true) {
        sendNoise = noise;
        
    }
    
    if (!sound.getIsPlaying()) {
        trigger = false;
        sendNoise = 20;
    }
    
    
    
}
//--------------------------------------------------------------
void Diamond::draw(){
    
    ofPushMatrix(); {
        
        ofSetColor(0,0,0,0);
        ofCircle(pos.x, pos.y, sizeTrigger);
        
    }
    
    ofPopMatrix();
    
    sphere();
    
}

//--------------------------------------------------------------
void Diamond::exit(){
    
}

//--------------------------------------------------------------
void Diamond::sphere(){
    
    ofPushStyle(); {
        
        ofPushMatrix(); {
            
            ofSetSphereResolution(3);
            ofTranslate(pos.x, pos.y + sine);
            ofScale(2.75, 2.75);
            ofRotateX(rotate);
            ofRotateY(rotate);
            //small shape
            ofSetColor(randomFill, 100);
            ofFill();
            ofDrawSphere(sendNoise);
            //big shape
            ofSetColor(outerDiaColor, 100);
            ofNoFill();
            ofDrawSphere(50);
            
        } ofPopMatrix();
        
    } ofPopStyle();
}


//--------------------------------------------------------------
void Diamond::touchTrigger(int x, int y){
    
    int dist1 = ofDist(pos.x, pos.y, x, y);
    
    if ( dist1 < sizeTrigger ) {
        
        trigger = true;
        
        int randomFile = ofRandom(3);
        sound.loadSound(soundFiles[randomFile]);
        sound.play();
        sound.setLoop(true);
        
    }
    
}

void Diamond::upTouch(int x, int y){
    
    int dist1 = ofDist(pos.x, pos.y, x, y);
    
    if ( dist1 < sizeTrigger ) {
        
        trigger = false;
        sound.stop();
        sound.setLoop(false);
        
    }
    
}

void Diamond::moveDiamond(int x, int y) {
    
    int dist1 = ofDist(pos.x, pos.y, x, y);
    
    if ( dist1 < sizeTrigger ) {
        pos.x = x;
        pos.y = y;
        
        movementOn = true;
        
    } else {
        
        movementOn = false;
    }
    
}

void Diamond::randomizeColor() {
    
    randomColor = ofRandom(4);
    
    switch (randomColor) {
        case 0:
            randomFill = ofColor::teal;
            break;
        case 1:
            randomFill = ofColor::lightYellow;
            break;
        case 2:
            randomFill = ofColor::magenta;
            break;
        default:
            randomFill = ofColor::black;
            break;
    }
    
    
}


