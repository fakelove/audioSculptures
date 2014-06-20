
#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class foreground {
	
public:
    foreground();
    ~foreground();
    void loadForeground();
    void draw();
    void changeForeground(int imageNumber);
    void exit();
	    
    vector<ofTexture> texture;
    int totalFiles, counter;
    ofPoint pos;
  

};


