#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"
#include "ofxAssimpModelLoader.h"

class Circles {
    
public:
    Circles();
    ~Circles();
    void setup(int posX, int posY, float setSize);
    void update();
    void draw();
    void pulse(float speed);
    void touchTrigger(int x, int y);

    
    ofPoint fingerPos;
    float alphaAction, rotateAction;
    float size, counter, randomSizeSpeed, randomRotateSpeed;
    vector<ofSoundPlayer> circleSound;
    int randomSample;
    
    //random colors
    void randomizeColor(int randomColor);
    ofColor randomFill, outSideColor;
    //3d stuff
    ofxAssimpModelLoader model;
    float rotate, sine;
    int buttonSize;
};
