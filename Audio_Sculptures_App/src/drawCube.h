
#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class drawCube {
	
public:
    drawCube();
    ~drawCube();
    void setup();
    void update();
    void draw();
    void exit();
    void touchTrigger(int x, int y);
    void upTouch(int x, int y);
    void moveCube(int x, int y);
    void reloadTex(int changeTex);
    
    float rotate, noise, speed, alpha, alphaOutline;
    float sendNoise;    
    bool trigger, triggerSound;
    int sizeTrigger;
    ofPoint pos;
    
    ofSoundPlayer cubeSound;
    ofRectangle clickBox;
    //sculpture bounce for sound design
    
    void randomizeColor();    
    ofColor randomFill;
    int randomColor;
    
    //outer box color
    ofColor outerCube;
    
    //texturize
    ofImage texture;
    
    //bg movement
    bool movementOn;
};


