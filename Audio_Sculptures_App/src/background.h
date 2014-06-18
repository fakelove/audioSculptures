
#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class background {
	
public:
    background();
    ~background();
    void loadBackground();
    void draw();
    void exit();
	
    ofTexture texture;
    
};


