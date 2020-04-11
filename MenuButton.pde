class MenuButton extends Object{
  String text;
  
  int state = 0;
  PImage normalImage;
  PImage hoverImage;
  PImage clickImage;
  
  MenuButton(float _x, float _y, float _w, float _h, String _text, PImage _normalImage, PImage _hoverImage, PImage _clickImage){
    super(_x, _y, _w, _h);
    text = _text;
    normalImage = _normalImage;
    hoverImage = _hoverImage;
    clickImage = _clickImage;
  }
  
  void display(){
    if (mouseX > x-halfWidth && mouseX < x+halfWidth && mouseY > y-halfHeight && mouseY < y+halfHeight) {
      image(hoverImage, x, y);
    } else {
      image(clickImage, x, y);
    }
  }
}
