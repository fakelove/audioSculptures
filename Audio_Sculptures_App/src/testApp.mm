
#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	

    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
    ofBackground(255);
    ofEnableSmoothing();
    ofSetFrameRate(60);
    ofSetRectMode(OF_RECTMODE_CENTER);
    ofxAccelerometer.setup();
    ofxAccelerometer.setForceSmoothing(25);
    
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

    orbs[i].setup(i * 100, i * 20, ofRandom(0.15, 0.25));
    
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
    
    
    circles[0].setup(300, 150, ofRandom(0.05, 0.20));
    circles[1].setup(350, 475, ofRandom(0.05, 0.20));
    circles[2].setup(650, 175, ofRandom(0.05, 0.20));
    circles[3].setup(650, 400, ofRandom(0.05, 0.20));
    circles[4].setup(475, 300, ofRandom(0.05, 0.20));

    //Random button
    randomPos.set(75, 75);
    sizeRandom = 30;
    buttonColor = ofColor::black;
    
    /// END FLOATING CIRCLES ///
    
    
    //// GENERATE BACKGROUNDS ////
    
    bg.loadBackground("back");
    mg.loadBackground("middle");
    fg.loadBackground("front");
    
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
    
    bg.pos.z = ofMap(ofxAccelerometer.getForce().y, 0.0, .25, 10, -10, true);
    fg.pos.x = ofMap(ofxAccelerometer.getForce().y, 0.0, .25, -100, 100, true);
    mg.pos.x = ofMap(ofxAccelerometer.getForce().y, 0.0, .25, -50, 50, true);
    
    
    rotateButton += 0.45f;
    pulseSpeedButton += 0.15f;
    sineButton = 50 * sin(pulseSpeedButton);
    
}

//--------------------------------------------------------------
void testApp::draw(){

    /// BACKGROUND ///
    bg.draw();
   
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
    randomButton();
    
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
            squid.trackVolume = 1.0;
            squid.draw();
    } else {
            squid.trackVolume = 0.0;
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
}

void testApp::randomButton() {
    
    
    ofPushStyle(); {
        
        ofPushMatrix(); {
            
            ofTranslate(randomPos);
            ofScale(0.75, 0.75);
            ofRotateZ(rotateButton);
            ofSetCircleResolution(10);
            ofSetLineWidth(2.0);
            ofSetColor(ofColor::black);
            ofFill();
            ofCircle(0, 0, 75);
            
            ofSetCircleResolution(100);
            ofSetLineWidth(1.0);
            
            ofSetColor(ofColor::aquamarine);
            ofNoFill();
            ofCircle(0, 0, sineButton);
            
            ofSetCircleResolution(100);
            ofSetColor(0, 0, 0, 20);
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

    ///BACKGROUND MOVEMENT
    
    if (cube.movementOn == true || cyl.movementOn == true || dia.movementOn == true) {
        
        bg.pos.z = ofMap(touch.x, 0, ofGetWidth(), 10, -10);
        fg.pos.x = ofMap(touch.x, 0, ofGetWidth(), -100, 100);
        mg.pos.x = ofMap(touch.x, 0, ofGetWidth(), -50, 50);
        
    }
    
    
    int distance = ofDist(cube.pos.x, cube.pos.y, dia.pos.x, dia.pos.y);
    
    if (distance <= 250) {
        
        cube.pos += -10.0;
        dia.pos += 10.0;

    }
    
    int distance2 = ofDist(cube.pos.x, cube.pos.y, cyl.pos.x, cyl.pos.y);
    
    if (distance2 <= 250) {
        cube.pos += -10.0;
        cyl.pos += 10.0;
    }
    
    int distance3 = ofDist(cyl.pos.x, cyl.pos.y, dia.pos.x, dia.pos.y);
    
    if (distance3 <= 250) {
        cyl.pos += -10.0;
        dia.pos += 10.0;
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
    
    if ( dist1 < sizeRandom ) {
        
    
    //Needs randomize button
    randomSculpture1 = ofRandom(11);
    randomSculpture2 = ofRandom(11);
    randomSculpture3 = ofRandom(11);
        
        //Randomize the orbs every random button touch
        for (int i = 0; i < orbs.size(); i++) {
            orbs[i].randomizePosition(300 + i * 100, i * 20);
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
        
    cube.pos.set(ofGetWidth() / 2 - 200, ofGetHeight() / 2);
    dia.pos.set(ofGetWidth() / 2 + 250, ofGetHeight() / 2 + 100);
    cyl.pos.set(ofGetWidth() / 2 , ofGetHeight() / 2);

        
    /*cout << "Sculpture 1: " << randomSculpture1 << endl;
    cout << "Sculpture 2: " << randomSculpture2 << endl;
    cout << "Sculpture 3: " << randomSculpture3 << endl;*/
   
    //BACKGROUND IMAGE CYCLES//
        
    randomBackground = ofRandom(bg.totalFiles);
    bg.changeBackground(randomBackground);
    mg.changeBackground(randomBackground);
    fg.changeBackground(randomBackground);
        
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
        

        
    //TEXTURE CYCLES//
    
    cube.reloadTex(ofRandom(2));
    cyl.reloadTex(ofRandom(2));
    
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
