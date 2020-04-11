boolean left, right, up, down;

// If key is released set the particular key released to false.
void keyReleased() {
  if (key == CODED && !loading) {
    if (keyCode == LEFT) {
      left = false;
    }
    if (keyCode == RIGHT) {
      right = false;
    }
    if (keyCode == UP) {
      up = false;
    }
    if (keyCode == DOWN) {
      down = false;
    }
  }
}

// If key is pressed set the particular key pressed to true.
void keyPressed() {
  if (key == CODED && !loading) {
    if (keyCode == LEFT) {
      left = true;
    }
    if (keyCode == RIGHT) {
      right = true;
    }
    if (keyCode == UP) {
      up = true;
    }
    if (keyCode == DOWN) {
      down = true;
    }
  } else if (key == ENTER) {
    EnterPressed();
  }
}

// This is in for the purpose of testing, and also for marking. Considering how difficult the game can be.
// Pressing enter will cause the Win credits to be displayed.
void EnterPressed(){
  if (won == false){
    winCount = 200;
    won = true; 
  }
}
