class HUD{
  int acorns = 0;
  int score = 0;
  int lives = 3;
  int scoreIndex;
  
  ScoreText[] scoreTexts;
  
  HUD(){
    scoreTexts = new ScoreText[5];
  }
  
  void display(){
    for (int i = 0; i < min(scoreIndex, scoreTexts.length); i++){
      scoreTexts[i].display();
    }
    fill(100);
    rect(0, 0, width, 80);
    
    textSize(64);
    textAlign(CENTER);
    textOutlined("ACORNS", width/12, 35, 255, 0);
    textOutlined(String.valueOf(acorns), width/11, 70, color(0, 0, 255), 0);
    
    textOutlined("SCORE", width/2, 35, 255, 0);
    textOutlined(String.valueOf(score), width/2, 70, color(255, 255, 0), 0);
    
    textOutlined("LIVES", width - (width/12), 35, 255, 0);
    textOutlined(String.valueOf(lives), width - (width/12), 70, color(255, 0, 0), 0);
  }
  
  void addScore(float x, float y, int add){
    score += add;
    scoreTexts[scoreIndex % 5] = new ScoreText(x, y, add);
    scoreIndex++;
  }
  
  void removeLife(){
    lives--;
    if (lives <= 0){
      lives = 3;
      score = 0;
      acorns = 0;
      levelIndex = 0;
      level.loadLevel(levels[levelIndex]);
      lost = true;
      loseCount = 0;
    }
  }
}
