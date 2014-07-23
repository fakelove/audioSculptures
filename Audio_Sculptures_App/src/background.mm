
#include "background.h"


background::background() {
    
}

background::~background() {
    
}
void background::loadBackground(string layerType) {
    
    totalFiles = 4;
    
    texture.resize(totalFiles);
    
    for (int i = 0; i < texture.size(); i++) {
        ofLoadImage( texture[i], "bg" + ofToString(i) + "/bg" + ofToString(i) + layerType + ".png" );
    }
    
    counter = 0;
    pos.set(0, 0, 0);
}

//--------------------------------------------------------------
void background::draw(){
    
    ofPushStyle(); {
        
        ofPushMatrix(); {
        
    ofSetColor(255);
    ofTranslate(ofGetWidth() / 2 + pos.x, ofGetHeight() / 2 + pos.y, pos.z);
    ofScale(1.50, 1.50);
    texture[counter].draw(0, 0, ofGetWidth(), ofGetHeight());
            
        } ofPopMatrix();
        
    } ofPopStyle();
}

void background::changeBackground(int imageNumber) {
    
    counter = imageNumber;
    
}


//--------------------------------------------------------------
void background::exit(){
    
}
