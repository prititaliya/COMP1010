float rectRightX, rectRightY, rectWidth, strokeDis, bRed=255, bBlue=0, bGreen=0, bYellow=0, sRed=255, sBlue=0, sGreen=0, sYellow=0,stroke=3;
void setup() {
  size(800, 800);
  rectRightX=(width*1.25)/100;
  rectWidth=(width*2.5)/100;
  rectRightY=(height*13.75)/100;
}

void draw() {
  stroke(sRed, sGreen, sBlue);

    //fill(bRed, bGreen, bBlue);
          strokeWeight(stroke);

  line(pmouseX, pmouseY, mouseX, mouseY);
  stroke(0);

  drawAll();
}


void mousePressed() {
  if (mouseX > rectRightX && mouseX<rectRightX+rectWidth && mouseY<rectRightY+rectWidth) {
    sRed=255;
    sGreen=0;
    sBlue=0;
  } else if (mouseX>rectRightX+rectWidth &&mouseX<rectRightX+rectWidth+rectWidth && mouseY<rectRightY+rectWidth) {
    sRed=0;
    sGreen=255;
    sBlue=0;
  } else if (mouseX>rectRightX+rectWidth+rectWidth &&mouseX<rectRightX+(rectRightX+rectWidth*2)+10 && mouseY<rectRightY+rectWidth) {
    sRed=0;
    sGreen=0;
    sBlue=255;
  } else if (mouseX>rectRightX+(rectRightX+rectWidth*2)+10 && mouseX<rectRightX+(rectRightX+rectWidth*3)+10  && mouseY<rectRightY+rectWidth) {
    sRed=255;
    sGreen=255;
    sBlue=0;
  }
 
  if (mouseX>(rectRightX) && mouseX<(rectRightX+rectWidth) && mouseY>rectRightY+((width*6.25)/100) && mouseY<rectWidth+( rectRightY+((width*6.25)/100))){
    bRed=255;
    bGreen=0;
    bBlue=0;
    changeBack();
  } else if (mouseX>(rectRightX+rectWidth) && mouseX<rectRightX+(rectWidth*2) && mouseY>rectRightY+((width*6.25)/100)  && mouseY<rectWidth+( rectRightY+((width*6.25)/100))) {
    bRed=0;
    bGreen=255;
    bBlue=0;
    changeBack();
  } else if (mouseX>rectRightX+(rectWidth*2) && mouseX<rectRightX+3*rectWidth && mouseY>rectRightY+((width*6.25)/100)  && mouseY<rectWidth+( rectRightY+((width*6.25)/100))) {
    bRed=0;
    bGreen=0;
    bBlue=255;
    changeBack(); 
  }else if (mouseX>rectRightX+(rectWidth*3) && mouseX<rectRightX+4*rectWidth && mouseY>rectRightY+((width*6.25)/100)  && mouseY<rectWidth+( rectRightY+((width*6.25)/100))){
    bRed=255;
    bGreen=255;
    bBlue=0;
    changeBack();
  }
  

  if (mouseX>(rectRightX) && mouseX<(rectRightX+rectWidth) && mouseY>(rectRightY+((width*6.25)/100)*2) &&mouseY<rectWidth+(rectRightY+((width*6.25)/100)*2) ) {
    stroke=1;
  } else if (mouseX>(rectRightX+rectWidth) && mouseX<rectRightX+(rectWidth*2) && mouseY>(rectRightY+((width*6.25)/100)*2) &&mouseY<rectWidth+(rectRightY+((width*6.25)/100)*2) ) {
      stroke=3;

  } else if (mouseX>rectRightX+(rectWidth*2) && mouseX<rectRightX+3*rectWidth  && mouseY>(rectRightY+((width*6.25)/100)*2) &&mouseY<rectWidth+(rectRightY+((width*6.25)/100)*2) ) {
       stroke=5;

  }else if(mouseX>rectRightX+(rectWidth*3) && mouseX<rectRightX+4*rectWidth && mouseY>(rectRightY+((width*6.25)/100)*2) &&mouseY<rectWidth+(rectRightY+((width*6.25)/100)*2) ) {
        stroke=7;

  }
  
}

void changeBack() {
  background(bRed, bGreen, bBlue);
}
void drawAll() {
  fill(#717171);
  rect(0, 0, (width*20)/100, height);
  strokeWeight(2);
  fill(0);
  text("Stroke Color", rectRightX, rectRightX*10 );
  fill(255, 0, 0);
  rect(rectRightX, rectRightY, rectWidth, rectWidth);
  fill(0, 255, 0);
  rect(rectRightX+rectWidth, rectRightY, rectWidth, rectWidth);
  fill(0, 0, 255);
  rect(rectRightX+rectWidth*2, rectRightY, rectWidth, rectWidth);
  fill(255, 255, 0);
  rect(rectRightX+rectWidth*3, rectRightY, rectWidth, rectWidth);

  fill(0);

  fill(255, 0, 0);
  rect(rectRightX, rectRightY+((width*6.25)/100), rectWidth, rectWidth);
  fill(0, 255, 0);
  rect(rectRightX+rectWidth, rectRightY+((width*6.25)/100), rectWidth, rectWidth);
  fill(0, 0, 255);
  rect(rectRightX+(rectWidth*2), rectRightY+((width*6.25)/100), rectWidth, rectWidth);
  fill(255, 255, 0);
  rect(rectRightX+(rectWidth*3), rectRightY+((width*6.25)/100), rectWidth, rectWidth);

  fill(0);
  text("Thickness", rectRightX, rectRightX*20);
  fill(#717171);


  rect(rectRightX, rectRightY+((width*6.25)/100)*2, rectWidth, rectWidth);
  strokeWeight(2);
  line(rectRightX+(0.625*width)/100, rectRightY*2, (rectWidth/2)+(rectRightX+(0.625*width)/100), rectRightY*2);

  strokeWeight(2);

  rect(rectRightX+(rectWidth), rectRightY+((width*6.25)/100)*2, rectWidth, rectWidth);
  strokeWeight(3);
  line(rectRightX+((0.625*width)/100*5), rectRightY*2, (rectWidth*1.5)+(rectRightX+(0.625*width)/100), rectRightY*2);

  strokeWeight(2);

  rect(rectRightX+(rectWidth*2), rectRightY+((width*6.25)/100)*2, rectWidth, rectWidth);
  strokeWeight(4);
  line(rectRightX+((0.625*width)/100*9), rectRightY*2, (rectWidth*2.5)+(rectRightX+(0.625*width)/100), rectRightY*2);

  strokeWeight(2);

  rect(rectRightX+(rectWidth*3), rectRightY+((width*6.25)/100)*2, rectWidth, rectWidth);
  strokeWeight(5);
  line(rectRightX+((0.625*width)/100*13), rectRightY*2, (rectWidth*3.5)+(rectRightX+(0.625*width)/100), rectRightY*2);
  strokeWeight(2);
}
