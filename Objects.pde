class Object{
  float x, y, w, h;
  float halfWidth, halfHeight;
  
  Object(float _x, float _y, float _w, float _h){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    halfWidth = _w/2;
    halfHeight = _h/2;
  }
}

class ImageObject extends Object {

  PImage objectImage;
  float imageWidth, imageHeight;
  boolean enabled;
  boolean show;

  ImageObject(float _x, float _y, float _w, float _h, PImage _image, float _imageWidth, float _imageHeight) {
    super(_x, _y, _w, _h);
    objectImage = _image;
    imageWidth = _imageWidth;
    imageHeight = _imageHeight;
    enabled = true;
    show = true;
  }

  void display() {
    if (show) {
      drawObject();
    }
  };

  void drawObject() {
  };
}

class MultiImageObject extends ImageObject {
  PImage[] images;
  float frame;

  MultiImageObject(float _x, float _y, float _w, float _h, PImage _image, PImage[] _images, float _imageWidth, float _imageHeight) {
    super(_x, _y, _w, _h, _image, _imageWidth, _imageHeight);   
    images = _images;
  }
}
