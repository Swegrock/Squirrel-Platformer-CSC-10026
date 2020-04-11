class Collectable extends MultiImageObject {
  int swayFactor;
  CollectableType typeOf;
  
  Collectable(float _x, float _y, float _w, float _h, PImage[] _images, int _swayFactor, CollectableType _typeOf){
    super(_x, _y, _w, _h, _images[0], _images, _w, _h);
    swayFactor = _swayFactor;
    typeOf = _typeOf;
  }
  
  @Override
  void drawObject(){
    float sway = sin(frame) * swayFactor;
    objectImage = images[round(frame) % 5];
    image(objectImage, x  - camera.x, y  - camera.y + sway, w, h);
    frame += 0.1;
  }
}

enum CollectableType {
  PAGE,
  ACORN,
  HEART
}
