class Platform extends ImageObject{
  
  Platform (float _x, float _y, PImage _image, float _platformLength){
    super(_x, _y, _platformLength * 64, 64, _image, _platformLength * 64, 64);    
  }
  
  @Override
  void drawObject(){
    if (x > player.x - width/2 - halfWidth | x < player.x + width/2 + halfWidth) {
      int loops = round(w / 64);
      for (int i = 0; i < loops; i++){
        image(objectImage, x - camera.x + (64 * i), y - camera.y, 64, h); 
      }
    }
  }
}

class Box extends MultiImageObject {
  int index;

  Box (float _x, float _y, PImage _image, PImage[] _brokeImage) {
    super(_x, _y, 64, 64, _image, _brokeImage, 64, 64);
    frame = 0;
  }

  @Override
  void drawObject() {
    if ((x > player.x - width/2 - halfWidth | x < player.x + width/2 + halfWidth) && frame % 5 < 2) {
      drawBox();
    }
    if (frame < 50 && !enabled) {
      frame++;
    } else if (!enabled) {
      breakBox();
      show = false;
    }
  }

  void breakBox() {
    level.levelObjects[level.length] = new Collectable(x + 16, y + 16, 32, 32, acornSprites, 8, CollectableType.ACORN);
    level.length++;
  }

  void drawBox() {
    if (!enabled) {
      image(images[0], x - camera.x, y - camera.y, w, h);
    } else {
      image(objectImage, x - camera.x, y - camera.y, w, h);
    }
  }
}
