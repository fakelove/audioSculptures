
#include "foreground.h"


foreground::foreground() {
    
}

foreground::~foreground() {
    
}
void foreground::loadForeground() {
    
    totalFiles = 3;

    texture.resize(totalFiles);
    
    for (int i = 0; i < texture.size(); i++) {
    ofLoadImage( texture[i], "bg" + ofToString(i) + "/bg" + ofToString(i) + "front.png" );
    }
    
    pos.set(0, 0, 0);
    counter = 0;
    
}

//--------------------------------------------------------------
void foreground::draw(){
   
    ofPushMatrix();
    ofSetColor(255);
    ofTranslate(ofGetWidth() / 2 + pos.x, ofGetHeight() / 2);
    ofScale(0.75, 0.75);
    texture[counter].draw(0, 0);
    ofPopMatrix();
}

void foreground::changeForeground(int imageNumber) {
    
    counter = imageNumber;
    
}

//--------------------------------------------------------------
void foreground::exit(){
    
}



