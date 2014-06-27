
#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class background {
	
public:
    background();
    ~background();
    void loadBackground(string layerType);
    void draw();
    void changeBackground(int imageNumber);
    void exit();
	
    vector<ofTexture> texture;
    int totalFiles, counter;
    ofPoint pos;
};


