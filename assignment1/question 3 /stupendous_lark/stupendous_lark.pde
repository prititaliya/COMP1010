int mainEllipseCentreX, mainEllipseCentreY, difference;
float mainEllipseHeight, mainEllipseWidth, thirdELlipseWidth, topEllipseY, strokeweight;
boolean  value=false;
void setup() {

  size(500, 500);
}


void draw() {
  if (!value) {
    strokeweight=4;
    difference=(100*65)/height;
    mainEllipseCentreX=mouseX;
    mainEllipseCentreY=mouseY;
    //mainEllipseWidth=((mainEllipseCentreX*2)*70)/100;
    mainEllipseWidth=((mainEllipseCentreX*140))/100;

    mainEllipseHeight=(mainEllipseCentreY*93.33)/100;
    thirdELlipseWidth=(mainEllipseCentreX*2)/2;
    int thirdELlipseHeight=((mainEllipseCentreY*2)*20)/100;

    topEllipseY=((mainEllipseCentreY*2)*37)/100; // centre will be 37% up by the main circle centre
    strokeWeight((strokeweight*(mainEllipseCentreX*2))/100);
    //println(mainEllipseWidth);
    background(255);
    ellipse(mainEllipseCentreX, mainEllipseCentreY, mainEllipseWidth, mainEllipseHeight); // main circle
    ellipse(mainEllipseCentreX, mainEllipseCentreY-(((mainEllipseCentreY*2)*13)/100), thirdELlipseWidth, thirdELlipseHeight); // second circle
    fill(255, 255, 255, 30);//for opecity
        println(mainEllipseCentreY-(((mainEllipseCentreY*2)*13)/100));

    ellipse(mainEllipseCentreX, mainEllipseCentreY, (mainEllipseCentreX*40)/100, mainEllipseHeight); // third circle
  }
}
void mousePressed() {
  if (value) {
    value =false;
  } else {
    value =true;
  }
}
