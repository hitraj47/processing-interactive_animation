class Sprite {
  
  private PImage spriteImage;
  private float x,y;
  private float xspeed = 0;
  private float yspeed = 0;
  
  Sprite(String imageLocation, float x, float y) {
    this.spriteImage = loadImage(imageLocation);
    this.x = x;
    this.y = y;
  }
  
  Sprite(PImage _image, float _x, float _y) {
    this.spriteImage = _image;
    this.x = _x;
    this.y = _y;
  }
  
  void setSpriteImage(String imageLocation) {
    this.spriteImage = loadImage(imageLocation);
  }
  
  void setSpriteImage(PImage image) {
    this.spriteImage = image;
  }
  
  float getXPosition() {
    return x;
  }
  
  float getYPosition() {
    return y;
  }
  
  void setXSpeed(float _xspeed) {
    this.xspeed = _xspeed;
  }
  
  float getXSpeed() {
    return this.xspeed;
  }
  
  void setYSpeed(float _yspeed) {
    this.yspeed = _yspeed;
  }
  
  float getYSpeed() {
    return this.yspeed;
  }
  
  void move() {
    x += xspeed;
    y += yspeed;
    
    // Check horizontal edges
    if (x > (width-spriteImage.width) || x < 0) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height-spriteImage.height || y < 0) {
      yspeed *= - 1;
    }
  }
  
  // pretty much the same as move() but within a certain area, defined like a rect
  void moveWithinBounds(float _x, float _y, float _width, float _height) {
    x += xspeed;
    y += yspeed;
    
    // check horizontal edge
    if (x < _x || x > (_x + (_width-spriteImage.width))) {
      xspeed *= -1;
    }
    
    // check vertical edge
    if (y < _y || y > (_y + (_height-spriteImage.height))) {
      yspeed *= -1;
    }
  }
  
  void stopMoving() {
    xspeed = 0;
    yspeed = 0;
  }
  
  void display() {
    image(spriteImage,x,y);
  }
  
  float getHeight() {
    return spriteImage.height;
  }
  
  float getWidth() {
    return spriteImage.width;
  }
  
}
