
#include "Circles.h"

Circles::Circles(){
    
}

Circles::~Circles(){
        
}

void Circles::setup(int posX, int posY, float setSize) {
    
    ofDisableArbTex(); // we need GL_TEXTURE_2D for our models coords.
    model.loadModel("orb.dae");
    
    //alphaAction = 0.0;
    size = ofRandom(0.20, 0.30);
    fingerPos.set(posX, posY);
    randomSizeSpeed = setSize;
    randomRotateSpeed = ofRandom(-0.10f, 0.40f);
    randomSample = ofRandom(3);
    
    for (int i = 0; i < 4; i++) {
        circleSound.resize(i);
    }
    
    for (int i = 0; i < circleSound.size(); i++) {
        circleSound[i].loadSound("sounds/circles" + ofToString(i) + ".caf");
    }
    
    //button to trigger action
    buttonSize = 80;
    
    outSideColor = ofColor::black;
}
//--------------------------------------------------------------
void Circles::update(){
    
    alphaAction -= 5.0;
    pulse(randomSizeSpeed);
    
    model.update();
    rotate += randomRotateSpeed;
    
    //floating effect
    sine = 10.0 * sin(rotate);
    
}

//--------------------------------------------------------------
void Circles::draw(){
    
    ofPushStyle(); {
        
    //ofEnableDepthTest(); //important to begin and end
    //ofEnableAlphaBlending();
    //Outside Orb
    ofSetColor(outSideColor, 150);
    ofPushMatrix(); {
    
    ofTranslate(fingerPos.x, fingerPos.y + sine);
    model.setScale(size, size, size);
    ofRotateX(rotate);
    ofRotateY(rotate);
    model.drawWireframe();
    ofPopMatrix();
    
    //Inside Orb
    ofSetColor(ofColor::whiteSmoke, alphaAction);
    ofPushMatrix();
    ofTranslate(fingerPos.x, fingerPos.y + sine);
    model.setScale(size, size, size);
    ofRotateX(rotate);
    ofRotateY(rotate);
    model.drawFaces();
    
        } ofPopMatrix();

    //ofDisableAlphaBlending();
    //ofDisableDepthTest();

    } ofPopStyle();


    //Circle Button
    ofPushMatrix();
    ofSetColor(ofColor::red, 0); //transparent circle buttons
    ofTranslate(fingerPos.x, fingerPos.y + sine);
    ofCircle(0,0,buttonSize);
    ofPopMatrix();

     
}

void Circles::pulse(float speed){
    
    counter += speed;
    //size = size * sin(counter);
    
    
}

//--------------------------------------------------------------
void Circles::touchTrigger(int x, int y){
    
    int dist1 = ofDist(fingerPos.x, fingerPos.y, x, y);
    
    if ( dist1 < buttonSize ) {
        alphaAction = 150.0;
        circleSound[randomSample].play();
        randomizeColor(ofRandom(3));
    }
    
}

void Circles::randomizeColor(int randomColor) {
    
    switch (randomColor) {
        case 0:
            randomFill = ofColor::teal;
            break;
        case 1:
            randomFill = ofColor::lightYellow;
            break;
        case 2:
            randomFill = ofColor::crimson;
            break;
        default:
            randomFill = ofColor::black;
            break;
    }
    
}

