
#include "foreground.h"


foreground::foreground() {
    
}

foreground::~foreground() {
    
}
void foreground::loadForeground() {
    
    ofLoadImage( texture, "bg1/bg1front.png" );
}

//--------------------------------------------------------------
void foreground::draw(){
    
    ofPushMatrix();
    ofSetColor(255);
    ofTranslate(ofGetWidth() / 2, ofGetHeight() / 2);
    ofScale(0.75, 0.75);
    texture.draw(0, 0);
    ofPopMatrix();
}


//--------------------------------------------------------------
void foreground::exit(){
    
}

