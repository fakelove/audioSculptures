#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class Squid {
	
public:
    Squid();
    ~Squid();
    void setup();
    void update();
    void draw();
    void exit();
    
    void slide(int x, int y);
    
    
    ofVec2f point1, point2, point3, point4;
    float rotate, noise, speedNoise;
    ofSoundPlayer sound;
    ofPoint squidPos;
    float trackVolume;
    
    //random color
    void randomizeColor();
    ofColor randomFill;
    int randomColor;
};

