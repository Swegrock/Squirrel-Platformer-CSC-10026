int loadingCount = 0;

void LoadingScene() {
  background(139, 69, 19);
  textSize(100);
  textAlign(CENTER);
  String loadingDots = new String(new char[(frameCount % 24) / 6]).replace("\0", ".");
  textOutlined("LOADING" + loadingDots, width/2, height/2, 255, 0);
  if (loadingCount > 15) {
    loading = false;
  }
  if (frameRate > 60) {
    loadingCount++;
  }
}

float introductionCount = 200;

void IntroScene() {
  fill(255);
  background(83, 53, 10);
  textAlign(CENTER, CENTER);
  textSize(30);
  for (int n = 0; n < introductions.length; n++)
    text(introductions[n], width/2, 610 - introductionCount + 80*n);
  image(infoImage, 0, 0);
  image(pageSprites[round(introductionCount / 3) % 5], (introductionCount * 2) % width, sin(introductionCount / 5) * 20 + (height/6));
  image(pageSprites[round(introductionCount / 3 + 10) % 5], (introductionCount * 3) % width, sin(introductionCount / 5 + 100) * 20 + (height/6));
  image(pageSprites[round(introductionCount / 3 + 20) % 5], (introductionCount * 2.5) % width, cos(introductionCount / 5) * 20 + (height/6));
  introductionCount += 1;
  if (introductionCount > 2000) {
    introduction = false;
  }
}

void GameScene() {
  player.update();
  for (int j = 0; j < level.length; j++) {
    player.collisionSide = CheckCollisions(player, level.levelObjects[j]);
    player.checkColliders();
  }
  MoveCamera();

  background(135, 206, 235);

  DisplayBackground(background3Image, 0);
  DisplayBackground(background2Image, 2);
  DisplayBackground(backgroundImage, 1);

  for (int i = 0; i < level.length; i++) {
    level.levelObjects[i].display();
  }
  player.display();
  hud.display();
}

int loseCount = 0;

void LoseScene() {
  if (loseCount > 200) {
    lost = false;
  }
  background(139, 69, 19);
  textSize(100);
  textAlign(CENTER);
  textOutlined("GAMEOVER", width/2, height/2, 255, 0);
  loseCount++;
}

float winCount = 200;

void WinScene() {
  fill(255);
  background(83, 53, 10);
  textAlign(CENTER, CENTER);
  textSize(30);
  for (int n = 0; n < credits.length; n++)
    text(credits[n], width/2, 610 - winCount + 80*n);
  image(infoImage, 0, 0);
  image(walkingSprites[round(winCount / 6) % 4], width - ((winCount * 2) % width), 160);
  winCount += 1.5;
  if (winCount > 7200) {
    won = false;
  }
}
