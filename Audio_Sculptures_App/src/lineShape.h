#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"


class lineShape {
	
public:
    lineShape();
    ~lineShape();
    void setup();
    void update();
    void draw();
    void exit();
    void drawLine(float x, float y, float rotate, int opacity);
    void moveLine(int x, int y);
    
    float rotateShape, volumeLevel;
    
    ofEasyCam cam;
    ofSoundPlayer pad;
    ofPoint pos;
    
    float counter, sinePan, sineSpeed;
    
    //random colors
    void randomizeColor();
    ofColor randomFill;
    int randomColor;
};


