// Loading scene

int loadingCount = 0;

void LoadingScene() {
  // Set the necessary attributes.
  background(139, 69, 19);
  textSize(100);
  textAlign(CENTER);
  // Create a string of loading dots according to the current frame count.
  String loadingDots = new String(new char[(frameCount % 24) / 6]).replace("\0", ".");
  // Draw the text preceded by the word loading in caps.
  textOutlined("LOADING" + loadingDots, width/2, height/2, 255, 0);
  
  // The way the loading works is if the frame rate overtakes 60 a total of 15 times then we will assume it has stablized enough to move onto the game.
  // Another way considered was to reset the loadingCount to zero when a frame rate of 60 wasn't achieved, however this meant loading was unecessarily long.
  // This method of loading is taken from older games of the early 2000s.
  if (loadingCount > 15) {
    loading = false;
  }
  if (frameRate > 60) {
    loadingCount++;
  }
}

// Introduction scene

float introductionCount = 200;

void IntroScene() {
  // Set the necessary attributes.
  fill(255);
  background(83, 53, 10);
  textAlign(CENTER, CENTER);
  textSize(30);
  // Draw each of the lines in the introductory credits and set their y position relative to the introduction count.
  for (int n = 0; n < introductions.length; n++)
    text(introductions[n], width/2, 610 - introductionCount + 80*n);
  // Draw the overlay for the credits.
  image(infoImage, 0, 0);
  
  // Animate 3 page sprites along the top of the screen and move them along the screen with the introduction count and change their y according to the sin value of that.
  image(pageSprites[round(introductionCount / 3) % 5], (introductionCount * 2) % width, sin(introductionCount / 5) * 20 + (height/6));
  image(pageSprites[round(introductionCount / 3 + 10) % 5], (introductionCount * 3) % width, sin(introductionCount / 5 + 100) * 20 + (height/6));
  image(pageSprites[round(introductionCount / 3 + 20) % 5], (introductionCount * 2.5) % width, cos(introductionCount / 5) * 20 + (height/6));
  
  // Increase the count.
  introductionCount += 1;
  
  // If the introduction count is greater than 2000 then the introduction is complete.
  // Each of these checks (present in each of the scenes) are a result of trial and error and not calculated.
  if (introductionCount > 2000) {
    introduction = false;
  }
}

void GameScene() {
  // Update the players velocity, position and check boundaries.
  player.update();
  
  // Check collisions for each of the objects in the level.
  // Not an efficient way of checking due to looping though every object, however the CheckCollisions function will determine if it is worth actually checking intersections, positions etc.
  for (int j = 0; j < level.length; j++) {
    player.collisionSide = CheckCollisions(player, level.levelObjects[j]);
    
    //If no collision has been made then the player does not need to change state.
    if (player.collisionSide == 0){
      player.checkColliders();
    }
  }
  
  // Move the camera according to the players new position.
  // This should happen last to avoid awkward movement of the camera.
  MoveCamera();

  // Draw the sky background.
  background(135, 206, 235);

  // Draw the trees and buildings.
  DisplayBackground(background3Image, 0);
  DisplayBackground(background2Image, 2);
  DisplayBackground(backgroundImage, 1);

  // Display the level objects.
  // Only those present within the camera space will be drawn.
  for (int i = 0; i < level.length; i++) {
    level.levelObjects[i].display();
  }
  
  // Draw the player and hud.
  player.display();
  hud.display();
}

// Lose scene

int loseCount = 0;

void LoseScene() {
  // If the lose count is greater than 200 then the scene is finished and can complete.
  if (loseCount > 200) {
    lost = false;
  }
  // Set the background to a woody brown.
  background(139, 69, 19);
  
  //Set the necessary attributes.
  textSize(100);
  textAlign(CENTER);
  
  //Draw the gameover text.
  textOutlined("GAMEOVER", width/2, height/2, 255, 0);
  loseCount++;
}

// Win scene

float winCount = 200;

void WinScene() {
  // Set the necessary attributes.
  fill(255);
  background(83, 53, 10);
  textAlign(CENTER, CENTER);
  textSize(30);
  // Draw each of the lines in the final credits and set their y position relative to the win count.
  for (int n = 0; n < credits.length; n++)
    text(credits[n], width/2, 610 - winCount + 80*n);
    
  // Draw the overlay for the credits.
  image(infoImage, 0, 0);
  
  // Animate the player running from right to left along the screen.
  image(walkingSprites[round(winCount / 6) % 4], width - ((winCount * 2) % width), 160);
  winCount += 1.5;
  
  // If the introduction count is greater than 2000 then the introduction is complete.
  if (winCount > 7200) {
    won = false;
  }
}
