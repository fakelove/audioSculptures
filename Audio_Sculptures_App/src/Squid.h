#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"
#include "ofxStk.h"

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
    float trackVolume, trackPitch;
    float squidSize;
    
    //random color
    void randomizeColor();
    ofColor randomFill;
    int randomColor;
    
    //stk
    void audioOut(float *output,int bufferSize,int nChannels);
    stk::FileLoop soundCyl;
    stk::FreeVerb reverb;
    stk::Chorus chorus;
    bool audioOn;
    void upTouch(int x, int y);
    void downTouch(int x, int y);

};


