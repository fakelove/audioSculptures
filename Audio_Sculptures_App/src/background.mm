
#include "background.h"


background::background() {
    
}

background::~background() {
    
}
void background::loadBackground() {
    
    totalFiles = 3;
    
    texture.resize(totalFiles);
    
    for (int i = 0; i < texture.size(); i++) {
        ofLoadImage( texture[i], "bg" + ofToString(i) + "/bg" + ofToString(i) + "back.png" );
    }
    
    counter = 0;
    pos.set(0, 0, 0);
}

//--------------------------------------------------------------
void background::draw(){
    
    ofPushMatrix();
    ofSetColor(255);
    ofTranslate(ofGetWidth() / 2 + pos.x, ofGetHeight() / 2, pos.z);
    ofScale(0.75, 0.75);
    texture[counter].draw(0, 0);
    ofPopMatrix();
}

void background::changeBackground(int imageNumber) {
    
    counter = imageNumber;
    
}


//--------------------------------------------------------------
void background::exit(){
    
}
