Minim minim;
AudioPlayer musicAudio, jumpAudio, breakAudio, collectAudio, damageAudio, levelCompleteAudio;

String[] introductions, credits;

PImage infoImage;

PImage backgroundImage, background2Image, background3Image;

PImage woodImage, boxImage;

PImage[] walkingSprites, jumpingSprites, pageSprites, acornSprites, brokenBoxSprites;

PFont pixelFont;

void LoadContent(){
  introductions = loadStrings("introduction.txt");
  credits = loadStrings("credits.txt");
  
  minim = new Minim(this);
  
  jumpAudio = minim.loadFile("jump.mp3");
  jumpAudio.setGain(-10);
  breakAudio = minim.loadFile("break.mp3");
  breakAudio.setGain(-5);
  musicAudio = minim.loadFile("music.mp3");
  musicAudio.setGain(-10);
  collectAudio = minim.loadFile("collect.mp3");
  collectAudio.setGain(-10);
  damageAudio = minim.loadFile("damage.mp3");
  damageAudio.setGain(-10);
  levelCompleteAudio = minim.loadFile("levelComplete.mp3");
  levelCompleteAudio.setGain(-10);
  
  musicAudio.loop(100);
  
  infoImage = loadImage("InfoWindow.png");
  
  backgroundImage = loadImage("background.png");
  background2Image = loadImage("background2.png");
  background3Image = loadImage("background3.png");
  
  woodImage = loadImage("wood.png");
  boxImage = loadImage("box.png");
  brokenBoxSprites = new PImage [] { loadImage("brokenbox.png") };
  
  walkingSprites = new PImage[4];
  for (int i = 0; i < 4; i++) {
    walkingSprites[i] = loadImage("walk"+nf(i+1)+".png");
  }
  jumpingSprites = new PImage[4];
  for (int j = 0; j < 4; j++) {
    jumpingSprites[j] = loadImage("jump"+nf(j+1)+".png");
  }
  pageSprites = new PImage[5];
  for (int l = 0; l < 5; l++) {
    pageSprites[l] = loadImage("page"+nf(l+1)+".png"); 
  }
  acornSprites = new PImage[5];
  for (int l = 0; l < 5; l++) {
    acornSprites[l] = loadImage("acorn"+nf(l+1)+".png"); 
  }
  
  pixelFont = createFont("pixelfont.ttf", 32);
  textFont(pixelFont);
}
