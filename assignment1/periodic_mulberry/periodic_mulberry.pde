int mainEllipseCentreX, mainEllipseCentreY;
float mainEllipseHeight, mainEllipseWidth, thirdELlipseWidth,topEllipseY;
void setup() {
  
  size(700, 700);
}


void draw() {
  mainEllipseCentreX=width/2;
  mainEllipseCentreY=height/2;
  mainEllipseWidth=(width*70)/100;
  mainEllipseHeight=mainEllipseWidth/1.5;
  thirdELlipseWidth=width/2;
  int thirdELlipseHeight=(height*20)/100;
    //topEllipseY=(100*mouseY)/500;
    
  topEllipseY=(height*37)/100; // centre will be 37% up by the main circle centre 
  strokeWeight(20);
  background(255);
  ellipse(mainEllipseCentreX, mainEllipseCentreY, mainEllipseWidth, mainEllipseHeight); // main circle 
  ellipse(mainEllipseCentreX, mainEllipseHeight/1.26, thirdELlipseWidth, thirdELlipseHeight); // second circle 
    fill(255,255,255,30);//for opecity 
print(mainEllipseHeight);
  ellipse(mainEllipseCentreX, mainEllipseCentreY, 100, mainEllipseHeight); // third circle 
}
