
#include "lineShape.h"

const float myPI = 3.14159265358979;

lineShape::lineShape() {

}

lineShape::~lineShape() {
    
}

//--------------------------------------------------------------
void lineShape::setup(){
    
    volumeLevel = 0.50;
    pad.loadSound("sounds/linePad.caf");
    pad.play();
    pad.setLoop(true);
    pad.setVolume(volumeLevel);
    pos.set(0, 0);
    sineSpeed = 0.25f;
}

//--------------------------------------------------------------
void lineShape::update(){
    
    rotateShape += 0.90f;
    
    if (pad.getPositionMS() >= 17000) {
        pad.play();
    }
    pad.setVolume(volumeLevel);
    
    
    counter += sineSpeed;
    sinePan = 1.0 * sin(counter);
    pad.setPan(sinePan);
    
}

//--------------------------------------------------------------
void lineShape::draw(){
    
    pad.setVolume(volumeLevel);
    cam.setDistance(0.0);
    
    cam.begin();
    for (int i = 0; i < 250; i ++ ) {
        drawLine(i, 0, rotateShape + i, ofMap(i, 0, 200, 75, 175));
    }
    cam.end();
}

void lineShape::drawLine(float x, float y, float rotate, int opacity){
    
    ofPushStyle(); {
    
        ofPushMatrix(); {
        
    ofSetColor(randomFill, opacity);
    ofRotateX(rotate * sin(myPI / 2));
    ofRotateY(x + rotate);
    ofScale(.10, .10);
    ofTranslate(ofGetWidth() / 2, ofGetHeight() / 2);
    ofLine(0, 50, x + rotate + 150, y + 150);
    
        } ofPopMatrix();
    
    } ofPopStyle();
    
    //ofDrawBitmapString("Track ms: " + ofToString(pad.getPositionMS()), 100, 100);
    
}

void lineShape::moveLine(int x, int y) {
    
    x = ofMap(pos.x, 0, ofGetWidth(), 0.0, 1.0);
    y = ofMap(pos.y, 0, ofGetHeight(), 0.0, 1.0);
    
}

//--------------------------------------------------------------
void lineShape::exit(){
    
}

void lineShape::randomizeColor() {
    
    randomColor = ofRandom(4);
    
    switch (randomColor) {
        case 0:
            randomFill = ofColor::lightGrey;
            break;
        case 1:
            randomFill = ofColor::lightYellow;
            break;
        case 2:
            randomFill = ofColor::lightGreen;
        case 3:
            randomFill = ofColor::lightSkyBlue;
        default:
            randomFill = ofColor::black;
            break;
    }
    
}

