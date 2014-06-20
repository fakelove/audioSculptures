
#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class middleground {
	
public:
    middleground();
    ~middleground();
    void loadmiddleground();
    void draw();
    void changemiddleground(int imageNumber);
    void exit();
    
    vector<ofTexture> texture;
    int totalFiles, counter;
    ofPoint pos;
    
    
};


