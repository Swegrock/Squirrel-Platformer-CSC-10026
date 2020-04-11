boolean left, right, up, down;

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

void EnterPressed(){
  if (won == false){
    won = true; 
  }
}
