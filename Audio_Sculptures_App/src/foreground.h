
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
    void exit();
	    
    ofTexture texture;
 
};


