import javax.swing.JOptionPane;
boolean isNumber=false;
boolean isDeleted=false;

int NUM=9;
boolean[][] inputtedCells = new boolean[NUM][NUM];

int ith, jth;
float spacing ;
float textSpace;
int insertedValue=-1;
boolean keypressed=false;
int[][] nums = new int[80][80];
int[]cell=new int[2];
int red=0, green=0, blue=0;

void setup() {
  size(500, 500);
  spacing =int(width/NUM);
  textSpace=(spacing *3.63)/100;
  cpuValues();
}
void draw() {
  drawPallete();
}
void drawPallete() {
  //THIS WILL DRAW THE PALLETE
  strokeWeight(1);
  background(191);
  for (int i = 0; i < NUM; i++) {
    if (i % 3 == 0) {
      strokeWeight(4);
      line(i * spacing, 0, i * spacing, height);
    }
    strokeWeight(1);
    for (int j = 0; j < NUM; j++) {
      if (j % 3 == 0) {
        strokeWeight(4);
        line(0, j * spacing, width, j * spacing);
      }
      strokeWeight(1);
      if (nums[i][j] != 0) {
        if (inputtedCells[i][j]) {
          fillColor(0, 0, 0); // Use red color for inputted cells
        } else {
          fillColor(0, 0, 255); // Use black color for other existing values
        }
        textSize(height*6/100);
        //THIS WILL DRAW THE LINES
        line(i * spacing, j * spacing, i * spacing, j * spacing + spacing);
        line(i * spacing + spacing, j * spacing, i * spacing + spacing, j * spacing + spacing);
        line(i * spacing, j * spacing, i * spacing + spacing + spacing, j * spacing);
        line(i * spacing, j * spacing + spacing, i * spacing + spacing + spacing, j * spacing + spacing);

        //DRAW THE TEXT
        text(nums[i][j], (i * spacing) + (spacing - 2 * textWidth("1")) - textSpace, textAscent() + textDescent() + j * spacing);
        fillColor(red, green, blue);
      } else {
        fill(255);
        rect(i * spacing, j * spacing, spacing, spacing);
      }
    }
  }
}

void keyPressed() {
  println("Typed Charecter:", key);
  //THIS IS FOR ENTERED NUMBERED KEY
  if (key>='1' && key<='9') {
    insertedValue=int(key-'0');
    keypressed=true;
    isNumber=true;
    println("Now click on the cell...");
  } else if (key=='c' || key=='C') {
    //THIS IS FOR ENTERED DELETE KEY
    keypressed=true;
    isNumber=false;
    isDeleted=true;
    println("NOW YOU CAN DELETE THE WRONG ENTRY BY CLICKING ON THE CELL...");
  }
}
void mouseClicked() {
  if (isNumber) {
    doForNumber();
  } else if (isDeleted) {
    deleteCharecter();
    isDeleted=false;
  }
}
void doForNumber() {
  //THIS IS FOR NUMBER
  int[] cellindex=getCellIndex();
  ith=cellindex[0];
  jth=cellindex[1];
  if (keypressed && insertedValue!=-1) {
    if (nums[ith][jth]==0) {
      boolean isValid=checkAllCondition(insertedValue, ith, jth);
      if (isValid) {
        nums[ith][jth] = (insertedValue > 0 && insertedValue <= 9) ? insertedValue : -1;
        // this will store for inputted cell
        inputtedCells[ith][jth] = true;
      } else {
        String message="YOU ARE NOT ALLOWED TO ENTER REPEATED VALUES, ALL VALUES IN A SINGLE ROW,COLUMN AND BLOCK HAS TO BE UNIQUE, YOU ARE NOT PERMITTED TO ENTER: "+insertedValue  ;
        JOptionPane.showMessageDialog(null, message, "WRONG VALUE DETECTED", JOptionPane.INFORMATION_MESSAGE);
      }
    }
    drawPallete();
    insertedValue=-1;
    keypressed=false;
  }
}
int[] getCellIndex() {
  //THIS FUNCTIONS RETURNS THE CELL INDEX
  for (int i = 0; i<NUM; i++) {
    for (int j = 0; j<NUM; j++) {
      if (mouseX>i*width/NUM && mouseX < (i+1)*width/NUM
        && mouseY>j*height/NUM && mouseY<(j+1)*height/NUM) {
        ith=i;
        jth=j;
        cell[0]=i;
        cell[1]=j;
      }
    }
  }
  return cell;
}
boolean checkAllCondition(int value, int row, int col) {

  //THIS FUNCTION IS FOR CHECKING CONDITIONS FOR ROW & COLUMNS UNIQUE NUMBER
  boolean isValid=true;
  for (int i =0; i<9; i++) {
    if (i==col || nums[row][i]==0 )
      continue;
    if (nums[row][i]==value) {
      return false;
    }
  }
  for (int i =0; i<9; i++) {
    if (i==row  || nums[i][col]==0)
      continue;
    if (nums[i][col]==value) {
      return false;
    }
  }

  //THIS CONDITION IS FOR BLOCK
  if (!checkForBlock(ith, jth, value)) {
    return ( checkForBlock(ith, jth, value));
  }

  return isValid;
}
boolean checkForBlock(int ith, int jth, int value) {
  //THIS FUNCTION IS FOR BLOCK
  int iIteration, jIteration;
  while (ith%3!=0) {
    ith--;
  }
  while (jth%3!=0) {
    jth--;
  }
  iIteration=ith;
  jIteration=jth;
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      if (nums[iIteration][jIteration]==value) {
        //RETURN FALSE IF VALUES EXISTS IN BLOCK
        return false;
      }
      jIteration++;
    }
    iIteration++;
    jIteration=jth;
  }
  //RETURN TRUE IF VALUE IS UNIQUE
  return true;
}

void deleteCharecter() {
  int[] cell=getCellIndex();
  int ith=cell[0];
  int jth=cell[1];
  nums[ith][jth]=0;
  isDeleted=false;
  //THIS WILL CHANGE THE INPUTTED CELL TO DEFAULT
  inputtedCells[ith][jth] = false;
  cpuValues();
}

void fillColor(int red, int green, int blue) {
  fill(red, green, blue);
}

void cpuValues() {
  //THIS IS FOR CPU GENERATED VALUES
  nums[2][0] = 2;
  nums[4][0] = 8;
  nums[6][0] = 5;
  nums[0][1] = 8;
  nums[2][1] = 1;
  nums[3][1] = 2;
  nums[4][1] = 5;
  nums[5][1] = 7;
  nums[7][1] = 4;
  nums[8][1] = 9;
  nums[1][2] = 4;
  nums[5][2] = 3;
  nums[6][2] = 8;
  nums[7][2] = 2;
  nums[8][2] = 7;
  nums[1][3] = 8;
  nums[2][3] = 4;
  nums[3][3] = 1;
  nums[4][3] = 9;
  nums[8][3] = 3;
  nums[0][4] = 3;
  nums[3][4] = 7;
  nums[5][4] = 5;
  nums[6][4] = 2;
  nums[1][5] = 1;
  nums[2][5] = 7;
  nums[4][5] = 3;
  nums[5][5] = 2;
  nums[4][6] = 7;
  nums[5][6] = 8;
  nums[1][7] = 6;
  nums[5][7] = 9;
  nums[6][7] = 1;
  nums[1][8] = 2;
  nums[2][8] = 8;
  nums[3][8] = 5;
  nums[7][8] = 7;
  nums[8][8] = 4;
  blue=255;
}
