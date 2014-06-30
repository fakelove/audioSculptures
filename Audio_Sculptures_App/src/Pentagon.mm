//
//  Pentagon.mm
//  Fake_Love_Sound_Sculptures
//
//  Created by Fake Love on 6/27/14.
//
//

#include "Pentagon.h"

#include "Pentagon.h"

Pentagon::Pentagon() {
    
    
}

Pentagon::~Pentagon() {
    
}

//--------------------------------------------------------------
void Pentagon::setup(){
    
    sound.loadSound("sounds/pentSound.caf");
    sound.play();
    sound.setLoop(true);
    sound.setVolume(0.0);
    objectOn = false;
    sliderPos.set(100, ofGetHeight() - 150);
    sliderSize = 40;
}

//--------------------------------------------------------------
void Pentagon::update(){
    
    rotateShape += 0.50f;
    
    scaleParaX = varyNoisePent(10.0, controlShape - 0.01);
    scaleParaY = varyNoisePent(5.0, controlShape);
    
    if (objectOn == true) {
        
        volumeNoise = varyNoisePent(1.0, controlVolume);
        sound.setVolume(volumeNoise);
        
    } else {
        
        volumeNoise = 0.0;
        sound.setVolume(volumeNoise);
        
    }
    //alphaCounter += 0.05f;
    //alpha = 200 * sin(alphaCounter);
    
}

//--------------------------------------------------------------
void Pentagon::draw(){
    
    objectOn = true;
    
    for (int i = 0; i < 250; i += 5) {
        shape(ofGetWidth() / 2, ofGetHeight() / 2, 25, i * PI / 2 + 50);
    }
    
}

void Pentagon::drawSlider() {
    
    ofPushMatrix();
    cirSlider();
    ofSetColor(0);
    //ofDrawBitmapString("Sound Sculpture Control", sliderPos.x + 50, sliderPos.y);
    ofPopMatrix();
    
}

//--------------------------------------------------------------
void Pentagon::exit(){
    
}


//--------------------------------------------------------------
void Pentagon::shape(int x, int y, int size, float alpha) {
    
    ofPushMatrix();
    {
        ofSetCircleResolution(5);
        ofTranslate(x, y);
        ofRotateY(rotateShape * PI);
        ofRotateX(alpha + 50);
        ofRotateZ(rotateShape + alpha);
        ofScale(scaleParaX + 4.0, scaleParaY + 4.0);
        //ofSetPolyMode(OF_POLY_WINDING_NONZERO); //odd that this effected other objects
        ofSetColor(pentColor, 80);
        ofNoFill();
        ofCircle(0, 0, size);
    }
    ofPopMatrix();
    
}

//--------------------------------------------------------------
float Pentagon::varyNoisePent(int amount, float speed){
    
    noise += speed;
    float noiseAlpha = amount * ofNoise(noise);
    return noiseAlpha;
    
    
}


//--------------------------------------------------------------
void Pentagon::slide(int x, int y){
    
    int dist1 = ofDist(sliderPos.x, sliderPos.y, x, y);
    
    if (dist1 < sliderSize + 10){
        
        controlShape = ofMap(x, 0, ofGetWidth(), 0.0001, 0.07);
        sound.setSpeed(ofMap(x, 0, ofGetWidth(), 0.30, 1.0, true));
        controlVolume = ofMap(x, 0, ofGetWidth(), 0.01, .10);
        
        //slide control
        sliderPos.x = x;
        
        alpha = ofMap(x, 0.0, ofGetWidth() - 100, 0.0, 255);
    }
}

void Pentagon::cirSlider() {
    
    ofPushStyle(); {
        
        ofPushMatrix(); {
            
            ofSetCircleResolution(100);
            ofTranslate(sliderPos.x, sliderPos.y);
            ofSetColor(0, 0, 0, 150);
            ofNoFill();
            ofCircle(0, 0, sliderSize);
            ofSetColor(0, 0, 0, alpha);
            ofFill();
            ofCircle(0, 0, sliderSize);
            
        } ofPopMatrix();
        
    } ofPopStyle();
    
    ofPushMatrix();
    ofSetColor(200);
    ofTranslate(sliderPos.x - 20, sliderPos.y);
    ofDrawBitmapString("Slide", 0, 0);
    ofPopMatrix();
    
}

