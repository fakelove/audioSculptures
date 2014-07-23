/*
Note:
6/23/14
This is the latest version of the Fake Love Audio Sculptures Ipad App
*/

#pragma once
//openFrameworks stuff

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

//Background Images
#include "background.h"
#include "drawGifs.h"

//Objects
#include "Pentagon.h"
#include "lineShape.h"
#include "Cube.h"
#include "Squid.h"
#include "Diamond.h"
#include "Arp.h"
#include "Chip.h"
#include "Cyl.h"
#include "Circles.h"
#include "Orbs.h"



class testApp : public ofxiOSApp{
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);

    //randomButton
    void randomButton();
    ofPoint pos;
    float rotateButton, sineButton, pulseSpeedButton;
    
    //ofImage flLogo;
    
    Pentagon pent; //OK
    lineShape line; //OK
    Cube cube; //OK
    Squid squid; //OK
    Diamond dia; //OK
    Arp rect; //OK
    Chip chip; //OK
    Cyl cyl; //OK
    
    vector<Orbs> orbs;
    int orbsPosX, orbsPosY;
    
    //Generate Button
    ofColor buttonColor;
    
    //Load Backgrounds
    background bg, mg, fg;
    int randomBackground;
      
    //vector<drawGifs> gif;
    //vector<int> imgAmt;
    //vector<string> imageNames;
    //int randomImage;
    
    
    vector<Circles> circles;
    int cirPosX, cirPosY;
    
    int randomSculpture1, randomSculpture2, randomSculpture3;
    
    //Notes:
    
    //Overall need to fix size of everthing
    //Setup has all drone volume set 0.0
    //Need to draw 1.0 volume

    ///Randomize///
    ofPoint randomPos;
    int sizeRandom;
    float alpha, alphaSine, counter;
    
    ///STK
    void audioOut(float *output,int bufferSize,int nChannels);

    
    ///Fade Logo
    void logoFade();
    bool logoToggle, romeoToggle;
    int fade1, fade2, fadeBack;
    ofTexture introBack, introFl, introRomeo;
    
};


