
#include "drawOrbs.h"

drawOrbs::drawOrbs() {
    ofDisableArbTex(); // we need GL_TEXTURE_2D for our models coords.
    ofEnableDepthTest();
}

drawOrbs::~drawOrbs() {
    
}

//--------------------------------------------------------------
void drawOrbs::setup(int posX, int posY, float orbSize){
    
    pos.set(posX, posY, 0);
    model.loadModel("orb2.dae");
    //model.setPosition(pos.x, pos.y, pos.z);
    rotate = 0;
    c = ofColor::teal;
    c.a = 100;
    
    size = orbSize;
}

//--------------------------------------------------------------
void drawOrbs::update(float noiseSpeed, float rotationSpeed){
    
    model.update();
    rotate += 0.33f;
    noise += noiseSpeed;
    sendNoise = 200 * ofNoise(noise);
    pos.y = sendNoise;
}

//--------------------------------------------------------------
void drawOrbs::draw(){
    
    //Outside Orb
    ofSetColor(c);
    ofPushMatrix();
    ofTranslate(pos);
    //ofScale(size, size);
    model.setScale(size, size, size);
    ofRotateX(rotate);
    ofRotateY(rotate);
    model.drawWireframe();
    ofPopMatrix();
    //Inside Orb
    ofSetColor(0, 0, 0, sendNoise);
    ofPushMatrix();
    ofTranslate(pos);
    model.setScale(size, size, size);
    //ofScale(size, size);
    ofRotateX(rotate);
    ofRotateY(rotate);
    model.drawFaces();
    ofPopMatrix();
   
}

//--------------------------------------------------------------
void drawOrbs::shape(){
    
    
    
}

//--------------------------------------------------------------
void drawOrbs::exit(){
    
}

//--------------------------------------------------------------
void drawOrbs::touchDown(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void drawOrbs::touchMoved(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void drawOrbs::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void drawOrbs::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void drawOrbs::touchCancelled(ofTouchEventArgs & touch){
    
}

