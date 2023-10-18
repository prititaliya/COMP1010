float rectX, rectY, rectWidth, rectHeight;
float DIAMETER;
float vx = 5;       // Initial velocity in x direction
float vy = -5;
float vel=30;
float angle;
final float velocity=0.5;
boolean isMouseReleased=false;
boolean mouseDragged=false;
boolean played=false;
String status;
float green;
float targetY;
final float gravity = 0.5; // Gravity value
float cannonBallX, cannonBallY;
float centerX, centerY;
float xAngle, yAngle;
String[] instruction=new String[]{//instruction
  "instructions:",
  "1: To start, move cannonball away ",
  "2: chnage angle of projectile within the guide",
  "3:change a speed of cannonball by pulling away",
  "4: release cannoball to fire the ball"
};
void setup() {
  size(500, 500);

  //variable that should only be assigned once
  rectX=0;
  rectY=(height*60)/100;
  rectWidth=(width*20)/100;
  rectHeight=height-(height*60)/100;
  DIAMETER=(height*5)/100;
  green=int(random(1, 6));
}

void draw() {

  //println(played);
  if (!played) {//only when not played
    background(220); // Clear the canvas
    stroke(0);
    drawingPallet();//this will draw entire pallete
  } else {
    //println(played);
    background(192);
    showTemplate();// this will be called if game is finished
  }
}
void drawingPallet() {
  drawBackground(113, 83, 21, 'f');

  //pallete
  rect(rectX, rectY, rectWidth, rectHeight);
  drawBackground(192, 192, 192, 'f');
  circle(rectX+rectWidth, rectY, DIAMETER);
  activeAngle();
  int size=15;
  textSize(size);
  fill(0);
  for (int i =0; i<instruction.length; i++ ) {
    text (instruction [i], width*1/15, height*1/10+(size*i));
  }

  //text

  writeText("velocity: "+vel, "angle: "+(angle*180)/PI);
  drawBackground(255, 0, 0, 'f');
  targetY=(height*98)/100;

  //for target
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

  //only when not pressed
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
void activeAngle() {//this is for maxi and minimum angle
  xAngle=(rectY)-sin(radians(90))*50;
  yAngle=(rectX+rectWidth)+(sin(radians(90)) * 50);
  line(rectX+rectWidth, rectY, rectX+rectWidth, xAngle );
  line(rectX+rectWidth, rectY, yAngle, rectY);
}
void showTemplate() {//this will be called once game is played
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
    green=int(random(1, 6));
    exit();//this will exit the code
  }
}
void mouseDragged() {//it will work we dra the mouse
  if (!played) {
    frameRate(60);
    stroke(0);
    mouseDragged=true;
    if (mouseX < rectX + rectWidth && mouseY > rectY  ) {
      if ( mouseX<0 || mouseY>height) {
        cannonBallX=rectX+rectWidth;
        cannonBallY=rectY;
      } else {
        vel=getVelocity();

        cannonBallX = mouseX;
        cannonBallY = mouseY;
        centerX = 2 * (rectX + rectWidth) - mouseX;
        centerY = 2 * (rectY) - mouseY;
        //noLoop();
        float deltax=((rectX + rectWidth)-mouseX);
        float deltay=mouseY-rectY;
        angle =getAngle(deltax,deltay);

        println(atan(deltax/deltay));
        fill(192);
        stroke(192);
        strokeWeight(2);
        line(mouseX, mouseY, centerX, centerY);
        circle(cannonBallX, cannonBallY, DIAMETER);
      }
    }

    //loop();
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
void writeText(String vel, String angle) {
  text(vel, (width*70)/100, (height*30)/100);//for velocity
  text(angle, (width*70)/100, (height*30)/100+(15));//for
}
int getVelocity(){
if (vel<30) {
          return 30;
        } else if (vel>rectHeight) {
          return int(rectHeight);
        } else {
          return int(dist(rectX + rectWidth, rectY, mouseX, mouseY));
        }
}
float getAngle(float deltax,float deltay){
  return atan(deltax/deltay);//for angle
}
