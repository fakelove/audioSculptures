#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class drawChip {
	
public:
    drawChip();
    ~drawChip();
    void setup();
    void update();
    void draw();
    void randomizeColor();
    void button(int size, int color);
    void receivedTouch(int x, int y);
    void upTouch(int x, int y);

    
    void exit();

    
    float noise1, noise2, noise3, noise4;
    float speed1, speed2, speed3, speed4;
    float rotate, sine;
    bool trigger;
    ofSoundPlayer clicks;
    ofPoint pos;
    int size, randomColor;
    ofColor randomFill;

};


