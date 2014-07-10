
#include "Cube.h"


Cube::Cube() {
    
}

Cube::~Cube() {
    
}

//--------------------------------------------------------------
void Cube::setup(){
    
    //action
    trigger = false;
    alpha = 240;
    alphaOutline = 200;
    movementOn = false;
    
    triggerSound = false;
    cubeSound.loadSound("sounds/cubeSound.caf");
    cubeSound.setMultiPlay(true);
    sizeTrigger = 100;
    pos.set(ofGetWidth() / 2 - 200, ofGetHeight() / 2);
    randomFill.set(ofColor::black);
    
    outerCube = ofColor::lightYellow;
    
    texture.loadImage("tex/tex0.jpg");
    texture.getTextureReference().setTextureWrap( GL_REPEAT, GL_REPEAT );
    
    ofDisableArbTex(); // we need GL_TEXTURE_2D for our models coords.

    
}

//--------------------------------------------------------------
void Cube::update(){
    
    rotate += 0.50f;
    speed += 0.20f;
    noise = 35 * ofNoise(speed);
    noise = noise / 2;
    
    if (trigger == true) {
        alpha = noise;
        sendNoise = noise;
        alphaOutline = noise;
    } else if (!trigger || cubeSound.getPositionMS() >= 3200 ) {
        alpha = 240;
        sendNoise = 0;
        alphaOutline = 200;
        cubeSound.setPositionMS(0);
    }
    
    
    if (trigger && cubeSound.getPosition() == 0) {
        alpha = noise;
        sendNoise = noise;
        alphaOutline = noise;
        
    }
}


//--------------------------------------------------------------
void Cube::draw(){
    
    
    ofPushMatrix();
    ofSetColor(ofColor::red, 0);
    ofCircle(pos.x, pos.y, sizeTrigger);
    ofPopMatrix();
    
    ofPushStyle(); {
        
        ofEnableDepthTest();
        for (int i = 0; i < 50; i += 5) {
            ofPushMatrix(); {
                
                ofEnableNormalizedTexCoords();
                ofTranslate(pos.x, pos.y);
                ofScale(6.0, 6.0);
                ofRotateY(rotate);
                ofRotateX(rotate);
                
                //small box
                
                ofSetColor(randomFill, alpha + 100);
                ofFill();
                ofDrawBox(0, 0, -1, 10 + sendNoise, 10 + sendNoise, 10 + sendNoise);
                ofSetColor(255, 240, 250, alpha + 150);
                ofNoFill();
                ofDrawBox(0, 0, -1, 10 + sendNoise, 10 + sendNoise, 10 + sendNoise);
                
                //big box
                
                ofSetColor(ofColor::black, 150);
                ofNoFill();
                ofDrawBox(0, 0, -1, 50, 50, 50);
                ofSetColor(255, alpha - 20); //outerCube
                ofFill();
                texture.getTextureReference().bind();
                ofDrawBox(0, 0, -1, 50, 50, 50);
                texture.getTextureReference().unbind();
                ofDisableNormalizedTexCoords();
                
            } ofPopMatrix();
        }
        ofDisableDepthTest();
        
    } ofPopStyle();
    
}

void Cube::reloadTex(int changeTex) {
    
    texture.loadImage("tex/tex" + ofToString(changeTex) + ".jpg");
    texture.getTextureReference().setTextureWrap( GL_REPEAT, GL_REPEAT );
    
}

void Cube::exit() {
    
}

void Cube::randomizeColor() {
    
    randomColor = ofRandom(4);
    
    switch (randomColor) {
        case 0:
            randomFill = ofColor::teal;
            break;
        case 1:
            randomFill = ofColor::lightYellow;
            break;
        case 2:
            randomFill = ofColor::magenta;
            break;
        case 3:
            randomFill = ofColor::black;
            break;
    }
    
}

//--------------------------------------------------------------
void Cube::touchTrigger(int x, int y){
    
    
    
    int dist1 = ofDist(pos.x, pos.y, x, y);
    
    if ( dist1 < sizeTrigger ) {
        trigger = true;
        cubeSound.play();
        cubeSound.setLoop(true);
        cubeSound.setPositionMS(0);
        
    }
    
}

void Cube::upTouch(int x, int y){
    
    //if (clickBox.inside(x, y)) {
    
    int dist1 = ofDist(pos.x, pos.y, x, y);
    
    if ( dist1 < sizeTrigger ) {
        trigger = false;
        cubeSound.stop();
        cubeSound.setLoop(false);
        
    }
    
}


void Cube::moveCube(int x, int y){
    
    int dist1 = ofDist(pos.x, pos.y, x, y);
    
    if ( dist1 < sizeTrigger ) {
        pos.x = x;
        pos.y = y;
        
        movementOn = true;
    } else {
        movementOn = false;
    }
    
}

