void textOutlined(String text, float x, float y, color fillColor, color outLineColor) {
  fill(outLineColor);
  text(text, x-3, y-3);
  text(text, x+3, y+3);
  text(text, x-3, y+3);
  text(text, x+3, y-3);
  text(text, x+3, y);
  text(text, x, y-3);
  text(text, x-3, y);
  text(text, x, y+3);
  fill(fillColor);
  text(text, x, y);
}

class ScoreText extends Object {
  float yDrift;
  int score;

  ScoreText(float _x, float _y, int _score) {
    super(_x + 16, _y, 0, 0);
    yDrift = 0;
    score = _score;
  }

  void display() {
    if (yDrift < 20) {
      textFont(pixelFont);
      textSize(20);
      textAlign(CENTER);
      textOutlined(String.valueOf(score), x - camera.x, y - camera.y - yDrift, 255, 0);
      yDrift += 1;
    }
  }
}
