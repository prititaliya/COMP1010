import javax.swing.JOptionPane;
final String WORDS = "prit,italitya", FIRST_LINE = "i am :", LAST_LINE="who am i?";
float spacing;
String answer="";
String status="";
boolean isTrue=false;
float textX, textY, textsize;
void setup() {
  size(800, 800);
  println(WORDS.length());
  background(192);
}

void draw() {
  writeText();
  if (isTrue){
    background(0);
  }
}

void writeText() {

  String temp = WORDS.substring(0, WORDS.indexOf(','));
  textsize=(height*6)/100;
  spacing =height/100;
  textSize(textsize);
  if (!isTrue) {
    background(192);
  }else{
    background(0);
  }
  //strokeWeight(5);
  fill(0);
  textX = width / 2 - (textWidth(FIRST_LINE) / 2);
  textY = height*20/100;
  rect((width / 2 - textWidth(FIRST_LINE) / 2) - 5, textY - textAscent(), textWidth(FIRST_LINE) + 5, textAscent() + textDescent() + spacing);

  fill(255);
  text(FIRST_LINE.toUpperCase(), textX, textY);
  textY += textAscent() + textDescent() + spacing;

  textX = width / 2 - (textWidth(temp) / 2);

  temp = "";
  for (int i = 0; i < WORDS.length(); i++) {
    if (WORDS.charAt(i) == ',' ) {
      textY += textAscent() + textDescent();
      textX = (width / 2) - (textWidth(temp.toUpperCase()) / 2);

      fill(0);
      rect((width / 2 - textWidth(temp.toUpperCase()) / 2) - 5, textY - textAscent(), textWidth(temp.toUpperCase()) + 5, textAscent() + textDescent() + spacing);

      fill(255);
      text(temp.toUpperCase(), textX, textY);
      temp = "";
    } else {
      temp += WORDS.charAt(i);
    }
  }
  textY += textAscent() + textDescent();
  textX = (width / 2) - (textWidth(temp.toUpperCase()) / 2);

  fill(0);
  rect((width / 2 - textWidth(temp.toUpperCase()) / 2) - 5, textY - textAscent(), textWidth(temp.toUpperCase()) + 5, textAscent() + textDescent() + spacing);

  fill(255);
  text(temp.toUpperCase(), textX, textY);
  temp = "";
  println(temp);
  fill(0);

  textY += textAscent() + textDescent()+spacing*5;
  textX = (width / 2) - (textWidth(LAST_LINE) / 2);
  rect((width / 2 - textWidth(LAST_LINE.toUpperCase()) / 2) - 5, textY - textAscent(), textWidth(LAST_LINE.toUpperCase()) + 5, textAscent() + textDescent() + spacing);
  fill(255);

  text(LAST_LINE, textX, textY);
  fill(#E58B15);

  textY += textAscent() + textDescent()+spacing*5;
  textX = (width / 2) - (textWidth("ANSWER".toUpperCase()) / 2);

  rect((width / 2 - textWidth("ANSWER".toUpperCase()) / 2) - 5, textY - textAscent(), textWidth("ANSWER".toUpperCase()) + 5, textAscent() + textDescent() + spacing);
  fill(255);


  text("ANSWER".toUpperCase(), textX, textY);
  textSize(20);
  text(status, 10, height-10);
}

void mouseClicked() {
  if (mouseX > width / 2 - textWidth("ANSWER".toUpperCase()) / 2 - 5 && mouseX < (width / 2 - textWidth("ANSWER".toUpperCase()) / 2 - 5) + textWidth("ANSWER".toUpperCase()) + 5 && mouseY > textY - textAscent() && mouseY < (textY - textAscent()) + textAscent() + textDescent() + spacing) {
    String txt=JOptionPane.showInputDialog("enter your answer");
    checkAnswer(txt);
  }
}

void checkAnswer(String inputedAnswer) {
  processAnswer();
  println(answer);
  if (answer.equals(inputedAnswer) ) {
    println(answer, inputedAnswer);
    isTrue=true;
    status="answer is correct, horrah!!";
  } else {
    status="answer is incorrect, try again please!!";

    println(answer, inputedAnswer);
  }
}
void processAnswer() {
  answer+=WORDS.charAt(0);
  int i =1;
  while (i<WORDS.length()) {
    if (WORDS.charAt(i)==',') {
      answer+=WORDS.charAt(i+1);
      //println(WORDS.charAt(i-1));
    }
    i++;
  }
}
