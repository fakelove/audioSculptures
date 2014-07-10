//
//  Pentagon.mm
//  Fake_Love_Sound_Sculptures
//
//  Created by Fake Love on 6/27/14.
//
//


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
    sliderPos.set(150, ofGetHeight() - 150);
    sliderSize = 40;
    controlRotate = 0.0f;
}

//--------------------------------------------------------------
void Pentagon::update(){
    
    rotateShape += controlRotate;
    
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
    
    //slider
    rotate += 0.45f;
    pulseSpeed += 0.10f;
    sine = 50 * sin(pulseSpeed);
    
    if (controlRotate < 0.05f) {
        controlRotate = 0.0;
    }
}

//--------------------------------------------------------------
void Pentagon::draw(){
    
    objectOn = true;
    
    for (int i = 0; i < 250; i += 5) {
        shape(ofGetWidth() / 2, ofGetHeight() / 2, 25, i * PI / 2 + 50);
    }
    
}


void Pentagon::drawSlider() {
    
    sliderUI(0, 0);
    sliderUI(180, 75);
    
}


void Pentagon::sliderUI(int rotate, int posX) {
    
    //ofPushMatrix();
    //cirSlider();
    //ofSetColor(0);
    //ofDrawBitmapString("Sound Sculpture Control", sliderPos.x + 50, sliderPos.y);
    //ofPopMatrix();
    
    
    ofPushStyle(); {
        
        ofPushMatrix(); {
            
            ofTranslate(sliderPos.x - posX, sliderPos.y);
            ofScale(.75, .75);
            ofRotateZ(rotate);
            ofSetCircleResolution(3);
            ofSetColor(ofColor::black);
            ofFill();
            ofCircle(0, 0, 75);
            
            ofSetCircleResolution(3);
            ofSetLineWidth(1.0);
            
            ofSetColor(ofColor::aquamarine);
            ofNoFill();
            ofCircle(0, 0, ofMap(sine, -50, 50, 0, 50));
            
            ofCircle(0, 0, ofMap(sine, -50, 50, 0, 25));
            
        } ofPopMatrix();
        
        
        
    } ofPopStyle();

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
    
    if (dist1 < sliderSize + 25){
        
        controlShape = ofMap(x, 0, ofGetWidth(), 0.0001, 0.10);
        sound.setSpeed(ofMap(x, 0, ofGetWidth(), 0.10, 1.0, true));
        controlVolume = ofMap(x, 0, ofGetWidth(), 0.01, .20);
        controlRotate = ofMap(x, 100, ofGetWidth(), 0.01f, 2.0f);
        //cout << "Rotate: " << controlRotate << endl;
        
        //slide control
        sliderPos.x = x;
        
        alpha = ofMap(x, 0.0, ofGetWidth() - 100, 0.0, 255);
    }
    
}

void Pentagon::cirSlider() {
    
    ofPushStyle(); {
        
        ofPushMatrix(); {
            
            ofSetCircleResolution(100);
            ofTranslate(sliderPos.x - 50, sliderPos.y); //Change this to be center of slider
            ofSetColor(0, 0, 0, 50);
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

