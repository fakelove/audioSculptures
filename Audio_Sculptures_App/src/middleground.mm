
#include "middleground.h"


middleground::middleground() {
    
}

middleground::~middleground() {
    
}
void middleground::loadmiddleground() {
    
    totalFiles = 3;
    
    texture.resize(totalFiles);
    
    for (int i = 0; i < texture.size(); i++) {
        ofLoadImage( texture[i], "bg" + ofToString(i) + "/bg" + ofToString(i) + "middle.png" );
    }
    
    counter = 0;
    pos.set(0, 0, 0);
}

//--------------------------------------------------------------
void middleground::draw(){
    
    ofPushMatrix();
    ofSetColor(255);
    ofTranslate(ofGetWidth() / 2 + pos.x, ofGetHeight() / 2);
    ofScale(0.75, 0.75);
    texture[counter].draw(0, 0);
    ofPopMatrix();
}

void middleground::changemiddleground(int imageNumber) {
    
    counter = imageNumber;
    
}

//--------------------------------------------------------------
void middleground::exit(){
    
}



