
#include "Cyl.h"

const float myPI = 3.14159265358979;


Cyl::Cyl() {
    
}

Cyl::~Cyl() {
    
    
}

//--------------------------------------------------------------
void Cyl::setup(){
    
    
    sound.loadSound("sounds/cylSound.caf");
    trigger = false;
    pos.set( ofGetWidth() / 2 , ofGetHeight() / 2 );
    sizeTrigger = 250;
    movementOn = false;
    
    texture.loadImage("tex/tex0.jpg");
    texture.getTextureReference().setTextureWrap( GL_REPEAT, GL_REPEAT );
    ofDisableArbTex(); // we need GL_TEXTURE_2D for our models coords.
    
    sendNoise = 255;
    
    
}

//--------------------------------------------------------------
void Cyl::update(){
    
    rotate += 0.55f;
    
    if (trigger == true) {
        noise += 0.10f;
        sendNoise = 255 * ofNoise(noise);
    }
    
    if (sound.getPosition() >= .35) {
        trigger = false;
        sendNoise = 255;
    }
    
}

void Cyl::reloadTex(int changeTex) {
    
    texture.loadImage("tex/tex" + ofToString(changeTex) + ".jpg");
    texture.getTextureReference().setTextureWrap( GL_REPEAT, GL_REPEAT );
    
}


//--------------------------------------------------------------
void Cyl::draw(){
        
    ofPushStyle(); {
        
        ofPushMatrix(); {
            
            //outer cyl
            cylinder(0, 25, 50, sendNoise - 240, 50);
            //ofDrawBitmapString("Sound File Position: " + ofToString(sound.getPosition()), 50, 50);
            
            //inner cyl
            ofEnableDepthTest();
            ofEnableNormalizedTexCoords();
            texture.getTextureReference().bind();
            cylinder(0, 15, 25, sendNoise - 100, 0);
            texture.getTextureReference().unbind();
            ofDisableNormalizedTexCoords();
            ofDisableDepthTest();
            
            /////Trigger Button/////
            //ofSetColor(ofColor::red);
            //ofNoFill();
            ofTranslate(pos.x, pos.y);
            ofCircle(0, 0, sizeTrigger);
            
            
        } ofPopMatrix();
        
    } ofPopStyle();
        
    
    
}

//--------------------------------------------------------------
void Cyl::cylinder(float iterate, int width, int height, float alpha, int outline){
    
    
    ofSetCylinderResolution(4, 2);
    ofPushMatrix();
    ofTranslate( pos.x, pos.y );
    ofScale(15.0, 15.0);
    ofRotateY(rotate + iterate * myPI );
    ofRotateX(rotate * myPI);
    ofSetColor(randomFill, alpha);
    ofFill();
    ofDrawCylinder(0, 0, width, height);
    ofSetColor(outerCyl, outline);
    ofNoFill();
    ofDrawCylinder(0, 0, width, height);
    ofPopMatrix();
    
}

void Cyl::exit() {
    
}

//--------------------------------------------------------------
void Cyl::touchTrigger(int x, int y){
    
    int dist1 = ofDist(pos.x, pos.y, x, y);
    
    if ( dist1 < sizeTrigger ) {
        trigger = true;
        sound.play();
        
    }
}


void Cyl::moveCyl(int x, int y) {
    
    int dist1 = ofDist(pos.x, pos.y, x, y);
    
    if ( dist1 < sizeTrigger ) {
        pos.x = x;
        pos.y = y;
        movementOn = true;
      
    } else {
        
        movementOn = false;
        
    }
    
}

void Cyl::randomizeColor() {
    
    randomColor = ofRandom(4);
    
    switch (randomColor) {
        case 0:
            randomFill = ofColor::lightGrey;
            break;
        case 1:
            randomFill = ofColor::lightYellow;
            break;
        case 2:
            randomFill = ofColor::lightGreen;
        case 3:
            randomFill = ofColor::crimson;
        default:
            randomFill = ofColor::black;
            break;
    }
}


