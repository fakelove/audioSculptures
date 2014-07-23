
#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	

    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
    ofBackground(255);
    ofEnableSmoothing();
    ofSetRectMode(OF_RECTMODE_CENTER);
    ofSoundStreamSetup(2, 0);

    ofxAccelerometer.setup();
    
    pent.setup();
    line.setup();
    cube.setup();
    squid.setup();
    dia.setup();
    rect.setup();
    chip.setup();
    cyl.setup();
    
    //// Floating Orbs ////
    for (int i = 0; i < ofGetWidth(); i ++) {
        for (int j = 0; j < ofGetHeight(); j ++) {
            orbsPosX = i;
            orbsPosY = j;
        }
    }
    
    int orbAmt = 5;
    
    Orbs tempOrbs;
    
    for (int i = 0; i < orbAmt; i++) {
        
        orbs.push_back(tempOrbs);
    
    }
    
    for (int i = 0; i < orbs.size(); i++) {

        orbs[i].setup(0, 0, ofRandom(0.20, 0.40));
        
    }

    
    //// Floating Circles ////
    
    for (int i = 0; i < ofGetWidth(); i ++) {
        for (int j = 0; j < ofGetHeight(); j ++) {
            
            cirPosX = i;
            cirPosY = j;
        }
    }
    
    int objectAmt = 5;
    
    Circles temp;
    
    for (int i = 0; i < objectAmt; i++) {
        circles.push_back(temp);
    }
    
    
    circles[0].setup(ofGetWidth() * 0.25, ofGetHeight() * 0.25, ofRandom(0.05, 0.20));
    circles[1].setup(ofGetWidth() * 0.75, ofGetHeight() * 0.25, ofRandom(0.05, 0.20));
    circles[2].setup(ofGetWidth() * 0.50, ofGetHeight() * 0.50, ofRandom(0.05, 0.20));
    circles[3].setup(ofGetWidth() * 0.25, ofGetHeight() * 0.65, ofRandom(0.05, 0.20));
    circles[4].setup(ofGetWidth() * 0.75, ofGetHeight() * 0.65, ofRandom(0.05, 0.20));

    //Random button
    randomPos.set(ofGetWidth() * .06, ofGetHeight() * .08);

    sizeRandom = 70;
    buttonColor = ofColor::black;
    
    /// END FLOATING CIRCLES ///
    
    
    ///Note: make sure to load assests after everything has been setup();
    
    //flLogo.loadImage("fakelovelogo.jpg");
    //flLogo.resize(300, 300);
    
    //imageNames.push_back("Mountains/Mountains");
    //imageNames.push_back("Space/Space");
    //imageNames.push_back("Portrait/Portrait");

    
    //imgAmt.push_back(10);
    //imgAmt.push_back(15);
    //imgAmt.push_back(1);
    
    //gif.resize(imageNames.size());
    
    //for (int i = 0; i < imageNames.size(); i++) {
    //gif[i].loadNewSequence(imageNames[i], imgAmt[i], 6);
    //}
    ////gif.loadNewSequence(fileName, amtFiles, frameRate)
    
    
    
    
    //// LOGO FADE ////
    
    //ofLoadImage(introBack, "intro/introBack.png");
    ofLoadImage(introFl, "intro/introFL.png");
    ofLoadImage(introRomeo, "intro/introRomeo.png");

    logoToggle = true;
    romeoToggle = false;
    
    fade1 = 255;
    fade2 = 255;
    fadeBack = 255;
    
    
    ////            ////
    
    randomSculpture1 = 0;
    randomSculpture2 = 0;
    randomSculpture3 = 0;
    
    //// GENERATE BACKGROUNDS ////
    
    bg.loadBackground("back");
    mg.loadBackground("middle");
    fg.loadBackground("front");
    
    
    //BACKGROUND IMAGE CYCLES//
    
    randomBackground = 2;
    bg.changeBackground(randomBackground);
    mg.changeBackground(randomBackground);
    fg.changeBackground(randomBackground);
    

    
}

//--------------------------------------------------------------
void testApp::update(){
    
    pent.update();
    line.update();
    cube.update();
    squid.update();
    dia.update();
    rect.update();
    chip.update();
    cyl.update();
    
    if (randomSculpture1 == 10 || randomSculpture2 == 10 || randomSculpture3 == 10) {

    for (int i = 0; i < orbs.size(); i++) {
        orbs[i].update(ofRandom(0.009f, 0.03f), ofRandom(0.15f, 0.33f));
        
        }
    }
    
    for (int i = 0; i < circles.size(); i++) {
        circles[i].update();
    }
    
    alphaSine += 0.08f;
    alpha = 255 * sin(alphaSine);
    
    ofPushStyle(); {
        
    ofxAccelerometer.setForceSmoothing(0.95);
    
    //cout << ofxAccelerometer.getForce().y << endl;
    //Parralax Horizontal
    
    bg.pos.x = ofMap(ofxAccelerometer.getForce().y, -1.0, 1.0, -40, 40, true);
    fg.pos.x = ofMap(ofxAccelerometer.getForce().y, -1.0, 1.0, -150, 150, true);
    mg.pos.x = ofMap(ofxAccelerometer.getForce().y, -1.0, 1.0, -75, 75, true);

    //Parralax Vertical
    bg.pos.y = ofMap(ofxAccelerometer.getForce().x, -1.0, 1.0, -10, 10, true);
    fg.pos.y = ofMap(ofxAccelerometer.getForce().x, -1.0, 1.0, -45, 105);
    mg.pos.y = ofMap(ofxAccelerometer.getForce().x, -1.0, 1.0, -40, 40, true);
    
    } ofPopStyle();
    
    rotateButton += 0.45f;
    pulseSpeedButton += 0.15f;
    sineButton = 50 * sin(pulseSpeedButton);
    
    
    ///LOGO FADE///
    if (ofGetElapsedTimef() >= 16.0) {
        fade1 -= 7;
        
    }
    
    if (fade1 <= 0) {
        romeoToggle = true;
    }
    
    if (ofGetElapsedTimef() >= 18.0) {
        fade2 -= 5;
    }
    
    if (fade2 <= 25) {
        fadeBack -= 10;
    }
    
    if (fadeBack <= 10) {
        logoToggle = false;
       
    }
    
    if (fadeBack <= 0) {
        introRomeo.clear();
        introFl.clear();
        introBack.clear();
    }

}

//--------------------------------------------------------------
void testApp::draw(){

    bg.draw();

    /// BACKGROUND ///
   
    //gif[randomImage].draw();
  
    ////Randomize button////
   //ofPushMatrix(); {
        
   // ofSetCircleResolution(100);
   // ofSetColor(0, 0, 0, 100);
   // ofNoFill();
   // ofCircle(75, 75, sizeRandom);
   // ofSetColor(buttonColor, alpha);
   // ofFill();
   // ofCircle(randomPos.x, randomPos.y, sizeRandom);
        
   //     }
   // ofPopMatrix();
    

    //DRAW RANDOM BUTTON
    if (logoToggle == false) {
    randomButton();
    }
    
    /////SPINNING RECTANGLE BACKGROUND/////
    if (randomSculpture1 == 7 || randomSculpture2 == 7 || randomSculpture3 == 7) {
        rect.trackVolume = 0.50;
        rect.draw();
    } else {
        rect.trackVolume = 0.0;
    }

    
    /////ROTATING CENTER BACKGROUND PENT/////

    if (randomSculpture1 == 2 || randomSculpture2 == 2 || randomSculpture3 == 2) {
        
        pent.objectOn = true;
        pent.draw();
        
    } else {
        
        pent.objectOn = false;
    
    }
    
    /////EVOLVING LINES SWIRL/////

    if (randomSculpture1 == 3 || randomSculpture2 == 3 || randomSculpture3 == 3) {

            line.volumeLevel = 1.0;
            line.draw();
        
    } else {
        
            line.volumeLevel = 0.0;
    
    }
    
    ////CIRCLE CENTER////
    if (randomSculpture1 == 8 || randomSculpture2 == 8 || randomSculpture3 == 8) {
        
        chip.draw();
        chip.volumeLevel = 1.0;

    } else {
        
        chip.volumeLevel = 0.0;
    }
    
    
    /// MIDDLEGROUND ///
    mg.draw();

    
    ////ORBS////
    if (randomSculpture1 == 10 || randomSculpture2 == 10 || randomSculpture3 == 10) {
        
        for (int i = 0; i < orbs.size(); i++) {
            orbs[i].draw();
        }
    }
    
    /////CUBE BACKGROUND/////

    if (randomSculpture1 == 4 || randomSculpture2 == 4 || randomSculpture3 == 4) {

            cube.draw();
    }
    
    /////SQUIGGLE LINES/////

    if (randomSculpture1 == 5 || randomSculpture2 == 5 || randomSculpture3 == 5) {
            squid.draw();
            squid.audioOn = true;
    } else {
            squid.trackVolume = 0.0;
            squid.audioOn = false;
    }
    
    
    /// FOREGROUND ///
    fg.draw();
    
    
    ////DIAMOND////
    if (randomSculpture1 == 6 || randomSculpture2 == 6 || randomSculpture3 == 6) {

            dia.draw();
    }

    ////CYLINDER////
    if (randomSculpture1 == 9 || randomSculpture2 == 9 || randomSculpture3 == 9) {
        cyl.draw();
        
    } else {
        
        cyl.pos.set(-1, -1);
    }
    
    
    ////SPHERES 3D////
    if (randomSculpture1 == 1 || randomSculpture2 == 1 || randomSculpture3 == 1) {
    for (int i = 0; i < circles.size(); i++) {
        circles[i].draw();
        }
    }
    
    /////Fake logo
    /*if (ofGetElapsedTimef() < 4.0) {
     ofPushMatrix();
     ofSetColor(255);
     ofTranslate(ofGetWidth() / 2, ofGetHeight() / 2);
     ofScale(1.0, 1.0);
     //flLogo.setAnchorPoint(ofGetWidth() / 2, ofGetHeight() / 2);
     flLogo.draw(0, 0);
     ofPopMatrix();
     }*/
    
    /////  UI /////
    
    /////ROTATING CENTER BACKGROUND PENT/////
    if (randomSculpture1 == 2 || randomSculpture2 == 2 || randomSculpture3 == 2) {
        pent.drawSlider();
    }
    
    ///// RECT SLIDER ////
    if (randomSculpture1 == 7 || randomSculpture2 == 7 || randomSculpture3 == 7) {
        rect.rectSlider();
    }
    
    //Logo Fade
    if (logoToggle == true) {
      
        logoFade();
        
    }
}

void testApp::logoFade() {
    
    ofPoint logoMiddle;
    logoMiddle.set(ofGetWidth() / 2, ofGetHeight() / 2);
    
    ofPushStyle();
    ofDisableSmoothing();
    ofPushMatrix();
    ofSetColor(255, 255, 255, fadeBack);
    ofTranslate(logoMiddle);
    introBack.draw(0, 0);
    ofPopMatrix();
    ofPopStyle();
    
    
    ofPushStyle();
    ofDisableSmoothing();

    ofPushMatrix();
    ofSetColor(255, 255, 255, fade1);
    ofTranslate(logoMiddle);
    introFl.draw(0,0,ofGetWidth(),ofGetHeight());
    ofPopMatrix();
    ofPopStyle();
    
    if (romeoToggle == true) {
    ofPushStyle();
    ofPushMatrix();
    ofTranslate(logoMiddle);
    ofSetColor(255, 255, 255, fade2);
    introRomeo.draw(0,0,ofGetWidth(),ofGetHeight());
    ofPopMatrix();
    ofPopStyle();
    }
    
    //cout << "Total Time: " << ofGetElapsedTimef() << endl;
}


void testApp::audioOut(float *output,int bufferSize,int nChannels) {
    
    squid.audioOut(output, bufferSize, nChannels);
    
}




void testApp::randomButton() {
    
    ofColor buttonAniColor;
    buttonAniColor.set(135,135,165);
    
    ofPushStyle(); {
        
        ofPushMatrix(); {
            
            ofTranslate(randomPos);
            ofScale(1.25, 1.25);
            ofRotateZ(rotateButton);
            ofSetCircleResolution(10);
            ofSetLineWidth(2.0);
            ofSetColor(ofColor::black);
            ofFill();
            ofCircle(0, 0, 75);
            
            ofSetCircleResolution(100);
            ofSetLineWidth(1.0);
            
            ofSetColor(buttonAniColor);
            ofNoFill();
            ofCircle(0, 0, sineButton);
            
            ofSetCircleResolution(100);
            ofSetColor(ofColor::red, 0);
            ofNoFill();
            ofCircle(0, 0, sizeRandom);
            
        } ofPopMatrix();
        
    } ofPopStyle();


}

//--------------------------------------------------------------
void testApp::exit(){

    
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
    
    if (randomSculpture1 == 8 || randomSculpture2 == 8 || randomSculpture3 == 8) {

    chip.receivedTouch(touch.x, touch.y);
   
    }
    
    if (randomSculpture1 == 6 || randomSculpture2 == 6 || randomSculpture3 == 6) {

    dia.touchTrigger(touch.x, touch.y);
    
    }
    if (randomSculpture1 == 4 || randomSculpture2 == 4 || randomSculpture3 == 4) {

    cube.touchTrigger(touch.x, touch.y);
    
        
    }
    
    if (randomSculpture1 == 9 || randomSculpture2 == 9 || randomSculpture3 == 9) {

    cyl.touchTrigger(touch.x, touch.y);
        
    }
        
    if (randomSculpture1 == 1 || randomSculpture2 == 1 || randomSculpture3 == 1) {
        
        for (int i = 0; i < circles.size(); i++) {
            circles[i].touchTrigger(touch.x, touch.y);
                
        }
    }
    
    if (randomSculpture1 == 10 || randomSculpture2 == 10 || randomSculpture3 == 10) {
        
        for (int i = 0; i < orbs.size(); i++) {
            orbs[i].moveOrbs(touch.x, touch.y);
        }
    }
    
    if (randomSculpture1 == 5 || randomSculpture2 == 5 || randomSculpture3 == 5) {
        
        squid.downTouch(touch.x, touch.y);
    }
    

    
    //cout << "Finger: " << touch.id << endl;

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
    
    if (randomSculpture1 == 7 || randomSculpture2 == 7 || randomSculpture3 == 7) {

    rect.slide(touch.x, touch.y);
    }
    
    if (randomSculpture1 == 5 || randomSculpture2 == 5 || randomSculpture3 == 5) {

    squid.slide(touch.x, touch.y);
    }
    
    if (randomSculpture1 == 2 || randomSculpture2 == 2 || randomSculpture3 == 2) {

    pent.slide(touch.x, touch.y);
    }
    
    if (randomSculpture1 == 3 || randomSculpture2 == 3 || randomSculpture3 == 3) {

    line.moveLine(touch.x, touch.y);
    
    }
    
    if (randomSculpture1 == 9 || randomSculpture2 == 9 || randomSculpture3 == 9) {

    cyl.moveCyl(touch.x, touch.y);
        
    }
    
    if (randomSculpture1 == 6 || randomSculpture2 == 6 || randomSculpture3 == 6) {

    dia.moveDiamond(touch.x, touch.y);
        
    }
    
    if (randomSculpture1 == 4 || randomSculpture2 == 4 || randomSculpture3 == 4) {

    cube.moveCube(touch.x, touch.y);
    
    }
    
    if (randomSculpture1 == 10 || randomSculpture2 == 10 || randomSculpture3 == 10) {
        
        for (int i = 0; i < orbs.size(); i++) {
            orbs[i].moveOrbs(touch.x, touch.y);
        }
    }
    

    ///BACKGROUND MOVEMENT
    
    if (cube.movementOn == true || cyl.movementOn == true || dia.movementOn == true) {
        
        bg.pos.x = ofMap(touch.x, 0, ofGetWidth(), -10, 10);
        fg.pos.x = ofMap(touch.x, 0, ofGetWidth(), -100, 100);
        mg.pos.x = ofMap(touch.x, 0, ofGetWidth(), -50, 50);
        
        
    }
    
    int threshold = 400;
    int distance = ofDist(cube.pos.x, cube.pos.y, dia.pos.x, dia.pos.y);
    
    if (distance <= threshold) {
        
        cube.pos += -15.0;
        dia.pos += 15.0;

    }
    
    int distance2 = ofDist(cube.pos.x, cube.pos.y, cyl.pos.x, cyl.pos.y);
    
    if (distance2 <= threshold) {
        cube.pos += -15.0;
        cyl.pos += 15.0;
    }
    
    int distance3 = ofDist(cyl.pos.x, cyl.pos.y, dia.pos.x, dia.pos.y);
    
    if (distance3 <= threshold) {
        cyl.pos += -15.0;
        dia.pos += 15.0;
    }

    
    //cout << "Distance between CUBE and DIA: " << distance << endl;
    
    //cout << "cube moveOn: " << ofToString(cube.movementOn) << endl;
    //cout << "cyl moveOn: " << ofToString(cyl.movementOn) << endl;
    //cout << "dia moveOn: " << ofToString(dia.movementOn) << endl;

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){

  
    //// Random Button ////
    int dist1 = ofDist(randomPos.x, randomPos.y, touch.x, touch.y);
    
    if ( dist1 < sizeRandom + 50 ) {
        
    
    //Needs randomize button
    randomSculpture1 = ofRandom(11);
    randomSculpture2 = ofRandom(11);
    randomSculpture3 = ofRandom(11);
        
        //Randomize the orbs every random button touch
        for (int i = 0; i < orbs.size(); i++) {
            orbs[i].randomizePosition(i * 250 + ofGetWidth() * 0.25, 0);
        }
        
    cube.randomizeColor();
    dia.randomizeColor();
    rect.randomizeColor();
    cyl.randomizeColor();
    line.randomizeColor();
    squid.randomizeColor();
    chip.randomizeColor();
    chip.randomRes();
        
        
    ///RESET OBJECT POSITION///
        
    cube.pos.set(ofGetWidth() * 0.25, ofGetHeight() * 0.45);
    dia.pos.set(ofGetWidth() * 0.80, ofGetHeight() * 0.70);
    cyl.pos.set(ofGetWidth() / 2, ofGetHeight() / 2);

        
    /*cout << "Sculpture 1: " << randomSculpture1 << endl;
    cout << "Sculpture 2: " << randomSculpture2 << endl;
    cout << "Sculpture 3: " << randomSculpture3 << endl;*/
   
    //BACKGROUND IMAGE CYCLES//
        
    randomBackground = ofRandom(bg.totalFiles);
    bg.changeBackground(randomBackground);
    mg.changeBackground(randomBackground);
    fg.changeBackground(randomBackground);
        
    //TEXTURE CYCLES//
    
    cube.reloadTex(ofRandom(2));
    cyl.reloadTex(ofRandom(2));
    
    }
    
    if (randomBackground == 0) {
        buttonColor = ofColor::black;
        pent.pentColor = ofColor::black;
        cube.outerCube = ofColor::black;
        dia.outerDiaColor = ofColor::black;
        cyl.outerCyl = ofColor::black;
        for (int i = 0; i < circles.size(); i++) {
            circles[i].outSideColor = ofColor::black;
        }
        
    }  else if (randomBackground == 1) {
        buttonColor = ofColor::black;
        pent.pentColor = ofColor::black;
        cube.outerCube = ofColor::black;
        dia.outerDiaColor = ofColor::black;
        cyl.outerCyl = ofColor::black;
        for (int i = 0; i < circles.size(); i++) {
            circles[i].outSideColor = ofColor::black;
        }
        
    } else if (randomBackground == 2) {
        buttonColor = ofColor::lightPink;
        pent.pentColor = ofColor::white;
        cube.outerCube = ofColor::white;
        dia.outerDiaColor = ofColor::white;
        cyl.outerCyl = ofColor::white;
        for (int i = 0; i < circles.size(); i++) {
            circles[i].outSideColor = ofColor::white;
        }
        
    }
    
    

    /// If you hold the "Chip" object it loops if touchUp then off
    if (randomSculpture1 == 8 || randomSculpture2 == 8 || randomSculpture3 == 8) {
        
        chip.upTouch(touch.x, touch.y);
    }
    
    if (randomSculpture1 == 6 || randomSculpture2 == 6 || randomSculpture3 == 6) {
        
        dia.upTouch(touch.x, touch.y);
        
    }
    if (randomSculpture1 == 4 || randomSculpture2 == 4 || randomSculpture3 == 4) {
        
        cube.upTouch(touch.x, touch.y);
    }
    if (randomSculpture1 == 5 || randomSculpture2 == 5 || randomSculpture3 == 5) {
        
        squid.upTouch(touch.x, touch.y);
    }
   
    
}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){
    


}
