#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"
#include "ofxAssimpModelLoader.h"

class Orbs {
	
public:
    Orbs();
    ~Orbs();
    void setup(int posX, int posY, float size);
    void update(float noiseSpeed, float rotationSpeed);
    void randomizeColor();
    void draw();
    void exit();
    void randomizePosition(int posX, int posY);
    void moveOrbs(int x, int y);
   
    
    ofxAssimpModelLoader model;
    ofPoint pos;
    ofColor c;
    float rotate, sendNoise, noise;
    float size;
    int randomColor;
    float total;
    
    //sounds
    vector<ofSoundPlayer> sounds;
    int sampleCycle;
    float triggerSounds;
    
    ///new Slider
    void drawSlider();
    void sliderUI(int rotate, int posX);
    ofPoint posSlider;
    float rotateSlider, sine, pulseSpeed;
};


