//Global Variables
int buttonX, buttonY, buttonWidth, buttonHeight;
color buttonColour, red=#E30505, yellow=#FFFB7E, resetWhite=#FFFFFF;

void setup() {
  size (600, 400);
  //population
  buttonX = width*1/4;
  buttonY = height*1/4;
  buttonWidth = width*1/2;
  buttonHeight = height*1/2;
}//End Void setup

void draw() {
  //  println(mouseX, mouseY);
  if (mouseX>buttonX && mouseX<buttonX+buttonWidth && mouseY>buttonY && mouseY<buttonY+buttonHeight) {
    buttonColour = yellow;
  } else {
    buttonColour = red;
  } // End If

  buttonColour = red;
  fill(buttonColour);
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
  fill(resetWhite);
}//End Void draw

void keyPressed() {
  if (key == 'p' || key == 'P' )  exit();
}//End keyPressed

void mousePressed() {
  if (mouseX>buttonX && mouseX<buttonX+buttonWidth && mouseY>buttonY && mouseY<buttonY+buttonHeight) exit();
}//End mousePressed
