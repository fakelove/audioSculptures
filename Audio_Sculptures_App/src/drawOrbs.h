#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"
#include "ofxAssimpModelLoader.h"

class drawOrbs : public ofxiOSApp{
	
public:
    drawOrbs();
    ~drawOrbs();
    void setup(int posX, int posY, float size);
    void update(float noiseSpeed, float rotationSpeed);
    void draw();
    void exit();
    void shape();
	
    void touchDown(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    void touchCancelled(ofTouchEventArgs & touch);
    
    ofxAssimpModelLoader model;
    ofPoint pos;
    ofColor c;
    float rotate, sendNoise, noise;
    float size;
};


