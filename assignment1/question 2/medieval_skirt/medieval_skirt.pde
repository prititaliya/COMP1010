int mainEllipseCentreX, mainEllipseCentreY, strokeweight=4, bgColor=#B4AFAF;
float mainEllipseHeight, mainEllipseWidth, thirdELlipseWidth, topEllipseY;
boolean  value=false;
void setup() {

  size(500, 500);
}


void draw() {
  if (!value) {
    strokeweight=(4*(mainEllipseCentreX*2))/100; //this will give the dynamic strokeweight related to centre 
    
    //centre of the circle
    mainEllipseCentreX=width/2; 
    mainEllipseCentreY=height/2;
    
    //width and height of the circke 
    mainEllipseWidth=(width*70)/100;
    mainEllipseHeight=mainEllipseWidth/1.5;
    
    // width and height for topmost ellipse 
    thirdELlipseWidth=width/2;
    int thirdELlipseHeight=(height*20)/100;

    //topEllipseY=(100*mouseY)/500;
    topEllipseY=(height*37)/100; // centre will be 37% up by the main circle centre
    strokeWeight(strokeweight);
    background(bgColor);
    fill(255);
    ellipse(mouseX, mouseY, mainEllipseWidth, mainEllipseHeight); // main circle
    ellipse(mouseX, mouseY-((height*13)/100), thirdELlipseWidth, thirdELlipseHeight); // second circle
    //fill(255, 255, 255, 30);//for opecity
    noFill();
    ellipse(mouseX, mouseY, 100, mainEllipseHeight); // third circle
  }
}
void mousePressed() {
  if (value) {
    value =false;
  } else {
    value =true;
  }
}
