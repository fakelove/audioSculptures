
#include "drawOrbs.h"

drawOrbs::drawOrbs() {
    
}

drawOrbs::~drawOrbs() {
    
}

//--------------------------------------------------------------
void drawOrbs::setup(int posX, int posY, float orbSize){
    ofDisableArbTex(); // we need GL_TEXTURE_2D for our models coords.
    pos.set(posX, posY, 0);
    model.loadModel("orb2.dae");
    //model.setPosition(pos.x, pos.y, pos.z);
    rotate = 0;
    
    c = ofColor::teal;
    c.a = 50;
    size = orbSize;

    ofxAccelerometer.setup();
    ofxAccelerometer.setForceSmoothing(200);
    
    
    
}

//--------------------------------------------------------------
void drawOrbs::update(float noiseSpeed, float rotationSpeed){
    
    model.update();
    rotate += 0.33f;
    noise += noiseSpeed;
    sendNoise = 300 * ofNoise(noise);

    
    total -= total;
    total += ofMap(ofxAccelerometer.getForce().x, 0.0, 1.0, 50, 600);
    pos.y = total + sendNoise;
    
    
    //cout << "Accel: " << total << endl;
    
}

//--------------------------------------------------------------
void drawOrbs::draw(){
    
    ofEnableDepthTest();
    //Outside Orb
    ofSetColor(c, 75);
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
    ofDisableDepthTest();
    
   
}

void drawOrbs::randomizePosition(int posX, int posY) {
    
     pos.set(posX, posY, 0);

}

void drawOrbs::randomizeColor() {
    
    randomColor = ofRandom(4);
    
    switch (randomColor) {
        case 0:
            c = ofColor::crimson;
            break;
        case 1:
            c = ofColor::aquamarine;
            break;
        case 2:
            c = ofColor::whiteSmoke;
        case 3:
            c = ofColor::teal;
        default:
            c = ofColor::black;
            break;
    }

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

