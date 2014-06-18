
#include "background.h"


background::background() {
    
}

background::~background() {
    
}
void background::loadBackground() {
    
    ofLoadImage( texture, "bg1/bg1back.png");
}

//--------------------------------------------------------------
void background::draw(){
    
    ofPushMatrix();
    ofSetColor(255);
    ofTranslate(ofGetWidth() / 2, ofGetHeight() / 2);
    ofScale(.75, .75);
    texture.draw(0, 0);
    ofPopMatrix();
}


//--------------------------------------------------------------
void background::exit(){
    
}
