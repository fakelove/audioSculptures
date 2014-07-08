#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class Arp {
	
public:
    Arp();
    ~Arp();
    void setup();
    void update();
    void draw();
    void exit();
    
    void rect(int x, int y, float rotate);
    void slide(int x, int y);
    void rectSlider();
    float rotateShape, speed;
    ofSoundPlayer sound;
    
    ofPoint sliderPos;
    int sliderSize, alpha;
    float trackVolume;
    
    //random colors
    void randomizeColor();
    ofColor randomFill;
    int randomColor;
    
    //new Slider
    void sliderUI(int rotate, int posX);
    float rotate, sine, pulseSpeed;
};


