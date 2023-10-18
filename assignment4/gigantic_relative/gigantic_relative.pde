float rectX, rectY, rectWidth, rectHeight;
float DIAMETER;
float vx = 5;       // Initial velocity in x direction
float vy = -5;
float velocity=0.5;
boolean isMouseReleased=false;
boolean mouseDragged=false;
boolean played=false;
String status;
int green;
float targetY;
float gravity = 0.5; // Gravity value
float cannonBallX, cannonBallY;
float centerX, centerY;
float xAngle, yAngle;
void setup() {
  size(700, 700);
  rectX=0;
  rectY=(height*60)/100;
  rectWidth=(width*20)/100;
  rectHeight=height-(height*60)/100;
  DIAMETER=(height*5)/100;
  green=int(random(1, 6));
}

void draw() {

  //println(played);
  if (!played) {
    background(220); // Clear the canvas
    stroke(0);
    drawingPallet();
  } else {
    //println(played);
    background(192);
    showTemplate();
  }
}
void drawingPallet() {
  drawBackground(113, 83, 21, 'f');
  rect(rectX, rectY, rectWidth, rectHeight);
  drawBackground(192, 192, 192, 'f');
  circle(rectX+rectWidth, rectY, DIAMETER);
  activeAngle();
  drawBackground(255, 0, 0, 'f');
  targetY=(height*98)/100;
  for (int i=1; i<=6; i++) {
    if (green==i) {
      drawBackground(0, 255, 0, 'f');
    }
    rect(150+i*40, targetY, (width*8)/100, (width*8)/100);
    drawBackground(255, 0, 0, 'f');
  }
  if (isMouseReleased) {
    cannonBallX += vx;
    cannonBallY += vy;
    vy += gravity; // Apply gravity to the ball's velocity
  }

  if (!mousePressed) {
    if (!played) {
      //println(played);
      fill(255);
      if (centerX!=0)
        if (mouseX<rectX+rectWidth && mouseY>rectY)
          circle(cannonBallX, cannonBallY, DIAMETER);


      if (cannonBallY>targetY) {
        vy=0;
        vx=0;
        if (cannonBallX>150+green*40 && cannonBallX<150+green*40 +40) {
          status="you win!!";
          played=true;
          isMouseReleased=false;
          cannonBallX=-20;
          cannonBallY=-20;
        } else {
          status="you lost!";
          played=true;
          isMouseReleased=false;
          cannonBallX=-20;
          cannonBallY=-20;
        }
      }
    }
  }

  //background(255);
  //centerX=0;
}
void activeAngle() {
  xAngle=(rectY)-sin(radians(90))*50;
  yAngle=(rectX+rectWidth)+(sin(radians(90)) * 50);
  line(rectX+rectWidth, rectY, rectX+rectWidth, xAngle );
  line(rectX+rectWidth, rectY, yAngle, rectY);
}
void showTemplate() {
  if (played) {
    textSize(30);
    background(255);

    fill(250);
    rect(width/2-textWidth(status)/2-20, height/2-textAscent()+textDescent(), textWidth(status)+40, textAscent()+textDescent());
    if (status.equals("you win!!"))
      fill(0, 255, 0);
    else
      fill(255, 0, 0); // Set fill color to red
    text(status, width/2-textWidth(status)/2, height/2);

    //background(255);
    fill(250);
    rect(width/2-textWidth("click to exit")/2-20, height/2+2*textAscent()+textDescent()-textAscent()+textDescent(), textWidth("click to exit")+40, textAscent()+textDescent());

    fill(0); // Set fill color to red
    text("click to exit", width/2-textWidth("click to exit")/2, height/2+2*textAscent()+textDescent());

    //println(mouseY, textAscent()+textDescent());
    //println( mouseY,height/2+2*textAscent()+textDescent()-textAscent()+textDescent());
  }
}
void mouseClicked() {
  if (  mouseX>width/2-textWidth("click to exit")/2-20 && mouseY>height/2+2*textAscent()+textDescent()-textAscent()+textDescent() && mouseX<(width/2-textWidth("click to exit")/2)+(textWidth("click to exit")+40) &&mouseY<((height/2+2*textAscent()+textDescent()-textAscent()+textDescent())+textAscent()+textDescent())) {
    //println(true);
    isMouseReleased=false;
    mouseDragged=false;
    played=false;
    //drawingPallet();
    //println("mosueclicekd",played);
    green=int(random(1, 6));
  }
}
void mouseDragged() {
  if (!played) {
    frameRate(60);
    stroke(0);
    mouseDragged=true;
    if (mouseX < rectX + rectWidth - DIAMETER/2 && mouseY > rectY + DIAMETER/2  ) {
      if ( mouseX<0 || mouseY>height) {
        cannonBallX=rectX+rectWidth;
        cannonBallY=rectY;
      } else {
        cannonBallX = mouseX;
        cannonBallY = mouseY;
        centerX = 2 * (rectX + rectWidth) - mouseX;
        centerY = 2 * (rectY) - mouseY;
        noLoop();
        fill(192);
        stroke(192);
        strokeWeight(2);
        line(mouseX, mouseY, centerX, centerY);
        circle(cannonBallX, cannonBallY, DIAMETER);
      }
    }

    loop();
  }
}
void mouseReleased() {
  if (mouseDragged) {
    isMouseReleased = true;
    cannonBallX = mouseX;
    cannonBallY = mouseY; // Set the initial y position of the ball to the release point
    vx = (centerX - cannonBallX) * 0.05; // Calculate the initial x velocity based on the distance between the cannon and the release point
    vy = (centerY - cannonBallY) * 0.05; // Calculate the initial y velocity based on the distance between the cannon and the release point
    mouseDragged=false;
  }
}
void drawBackground(int red, int green, int blue, char whatToDo) {
  if (whatToDo=='f') {
    fill(red, green, blue);
  } else if (whatToDo=='b') {
    background(red, green, blue);
  }
}
