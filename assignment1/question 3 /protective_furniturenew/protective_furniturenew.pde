int mainEllipseCentreX, mainEllipseCentreY, difference;
float mainEllipseHeight, mainEllipseWidth, thirdELlipseWidth, topEllipseY, strokeweight;
boolean  value=false;
void setup() {

  size(900, 900);
}


void draw() {

  int xDistance =0, yDistance=0;
  //if (mouseX == width/2)
  //  xDistance = 50;
  //if (mouseY == height/2)
  //  yDistance = 50;

  if (mouseX < width/2)
    xDistance = width/2 - mouseX;
  else if (mouseX >width/2 && mouseX < width)
    xDistance = mouseX - width/2;

  if (mouseY < height/2)
    yDistance = height/2 - mouseY;
  else if (mouseY > height/2 && mouseY < height)
    yDistance = mouseY - height/2;

  float a = (width*44)/100, b = (width*56)/100;
  if ( (mouseX < width/2 && mouseX > a) || (mouseX > 250 && mouseX < b) ) {
    xDistance = 30;
  }
  if ( (mouseY < 250 && mouseY > a) || (mouseY > 250 && mouseY < b) )
  {
    yDistance = 30;
  }

  if (!value) {
    strokeweight=4;
    difference=(100*65)/height;

    //mainEllipseCentreX=250;
    //mainEllipseCentreY=250;
    mainEllipseCentreX=xDistance + 80;
    mainEllipseCentreY=yDistance+ 80;

    int x=mouseX;
    int y=mouseY;
    //mainEllipseWidth=((mainEllipseCentreX*2)*70)/100;
    mainEllipseWidth=((mainEllipseCentreX*140))/100;

    mainEllipseHeight=(mainEllipseCentreY*93.33)/100;
    println(mainEllipseWidth, mainEllipseHeight);
    thirdELlipseWidth=(mainEllipseCentreX*2)/2;
    int thirdELlipseHeight=((mainEllipseCentreY*2)*20)/100;

    topEllipseY=((mainEllipseCentreY*2)*37)/100; // centre will be 37% up by the main circle centre
    strokeWeight((strokeweight*(mainEllipseCentreX*2))/100);
    //println(mainEllipseWidth);
    background(255);
    ellipse(x, y, mainEllipseWidth, mainEllipseHeight); // main circle
    ellipse(x, y-(((mainEllipseCentreY*2)*13)/100), thirdELlipseWidth, thirdELlipseHeight); // second circle
    fill(255, 255, 255, 30);//for opecity
    ellipse(x, y, (mainEllipseCentreX*40)/100, mainEllipseHeight); // third circle
  }
}
void mousePressed() {
  if (value) {
    value =false;
  } else {
    value =true;
  }
}
