
#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class Pentagon {
	
public:
    Pentagon();
    ~Pentagon();
    void setup();
    void update();
    void draw();
    void drawSlider();
    void exit();
	
    
    void shape(int x, int y, int size, float alpha);
    
    float varyNoisePent(int amount, float speed); //useful noise function
    float noise; //public variable
    
    void slide(int x, int y);
    void cirSlider();
    
    ofEasyCam cam;
    float rotateShape, controlRotate;
    float scaleParaX, scaleParaY, controlVolume, volumeNoise;
    float controlShape;
    ofSoundPlayer sound;
    bool objectOn;
    ofPoint sliderPos;
    int sliderSize;
    float alpha, alphaCounter;
    ofColor pentColor;
    
    //new Slider
    void sliderUI(int rotate, int posX);
    float rotate, sine, pulseSpeed;
};


