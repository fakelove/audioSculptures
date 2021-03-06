
#include "Chip.h"

Chip::Chip() {
    
    
}

Chip::~Chip() {
    
    
}

//--------------------------------------------------------------
void Chip::setup(){
    
    clicks.loadSound("sounds/circleClicks.caf");
    trigger = false;
    size = 75;
    pos.set(ofGetWidth() / 2, ofGetHeight() / 2); //actual translation of object
    randomCircleRes = 100;
    shapeSize = 0;
    
    
}

//--------------------------------------------------------------
void Chip::update(){
    
    
    rotate += 0.05f;
    
    sine = 3.0 + .25 * sin(rotate);
    
    
    speed1 += 0.15f;
    speed2 += 0.10f;
    speed3 += 0.20f;
    speed4 += 0.20f;
    
    if (trigger == true) {
        noise1 = 255 * ofNoise(speed1);
        noise2 = 200 * ofNoise(speed2);
        noise3 = 240 * ofNoise(speed3);
        noise4 = 250 * ofNoise(speed4);
    }
    
    if (!clicks.getIsPlaying()) {
        trigger = false;
        noise1 = 30;
        noise2 = 30;
        noise3 = 30;
        noise4 = 30;
    }
    
    clicks.setVolume(volumeLevel);
}

//--------------------------------------------------------------
void Chip::draw(){
    
    ofSetCircleResolution(randomCircleRes);
  
    button(size + shapeSize, noise4);
    button(50 + shapeSize, noise1);
    button(25 + shapeSize, noise2);
    button(10 + shapeSize, noise3);

}

void Chip::randomRes() {
    
    int randomNumber = ofRandom(3);
    
    if (randomNumber == 0) {
        randomCircleRes = 100;
        shapeSize = 15;
    } else if (randomNumber == 1) {
        randomCircleRes = 6;
        shapeSize = 20;
    } else if (randomNumber == 2) {
        randomCircleRes = 3;
        shapeSize = 40;
    }
    
    //cout << "Random Circle Resolution: " << randomNumber << endl;
}

void Chip::randomizeColor() {
    
    randomColor = ofRandom(4);
    
    switch (randomColor) {
        case 0:
            randomFill = ofColor::whiteSmoke;
            break;
        case 1:
            randomFill = ofColor::lightYellow;
            break;
        case 2:
            randomFill = ofColor::black;
        case 3:
            randomFill = ofColor::teal;
            break;
        default:
            randomFill = ofColor::lightYellow;
            break;
    }
    
    // cout << "Chip Color: " << randomColor << endl;
    
}

//--------------------------------------------------------------
void Chip::button(int size, int color){
    
    ofPushStyle(); {
        
        ofPushMatrix(); {
            
            ofTranslate(pos.x, pos.y);
            //ofRotateX(rotate);
            //ofRotateY(rotate);
            ofScale(sine * 2.25, sine * 2.25);
            ofSetColor(randomFill, color);
            ofFill();
            ofCircle(0, 0, size);
            
        } ofPopMatrix();
        
    } ofPopStyle();
    
    
}

void Chip::receivedTouch(int x, int y) {
    
    int dist1 = ofDist(pos.x, pos.y, x, y);
    
    if ( dist1 < size + 350) {
        trigger = true;
        clicks.setPositionMS(0);
        clicks.play();
        clicks.setLoop(true);
    }
    
}
void Chip::upTouch(int x, int y){
    
    int dist1 = ofDist(pos.x, pos.y, x, y);
    
    if ( dist1 < size + 350) {
        trigger = false;
        clicks.stop();
        clicks.setLoop(false);
    }
    
}

//--------------------------------------------------------------
void Chip::exit(){
    
}

