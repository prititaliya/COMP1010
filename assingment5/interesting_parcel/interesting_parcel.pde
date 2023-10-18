float spacing, smallSpacing;
float rectX, rectY, smallX, smallY;
int ith=-1, jth=-1, boxNum=-1;
void setup() {
  size(500, 500);
  spacing=(height/3);
  smallSpacing=spacing/3;
  background(255);
}

void draw() {
  int countBox=0;
  for (int i =0; i<3; i++) {
    rectX=i*spacing;
    for (int j=0; j<3; j++) {
      rectY=j*spacing;
      square(rectX, rectY, spacing);
      for (int k=0; k<3; k++) {
        smallX=rectX+k*smallSpacing;
        for (int l =0; l<3; l++) {

          if (boxNum==countBox) {
            background(0);
          }
          //println(ith, jth, countX, countY);
          smallY=rectY+l*smallSpacing;
          square(smallX, smallY, smallSpacing);
          //background(255);
          countBox++;
        }
      }
    }
  }
}
void mouseClicked() {
  ith=int(mouseX/smallSpacing);
  jth=int(mouseY/smallSpacing);
  println(ith, jth);
  boxNum=((jth)*9)+(ith+1);
  println(boxNum);
}
