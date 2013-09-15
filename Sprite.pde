class Sprite {
  
  private PImage image;
  private float x,y;
  private float xspeed = 0;
  private float yspeed = 0;
  
  Sprite(String imageLocation, float x, float y) {
    this.image = loadImage(imageLocation);
    this.x = x;
    this.y = y;
  }
  
  Sprite(PImage _image, float _x, float _y) {
    this.image = _image;
    this.x = _x;
    this.y = _y;
  }
  
  void setImage(String imageLocation) {
    this.image = loadImage(imageLocation);
  }
  
  void setImage(PImage image) {
    this.image = image;
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
    if (x > (width-image.width) || x < 0) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height-image.height || y < 0) {
      yspeed *= - 1;
    }
  }
  
  // pretty much the same as move() but within a certain area, defined like a rect
  void moveWithinBounds(float _x, float _y, float _width, float _height) {
    x += xspeed;
    y += yspeed;
    
    // check horizontal edge
    if (x < _x || x > (_x + (_width-image.width))) {
      xspeed *= -1;
    }
    
    // check vertical edge
    if (y < _y || y > (_y + (_height-image.height))) {
      yspeed *= -1;
    }
  }
  
  void stopMoving() {
    xspeed = 0;
    yspeed = 0;
  }
  
  void display() {
    image(image,x,y);
  }
  
  float getHeight() {
    return image.height;
  }
  
  float getWidth() {
    return image.width;
  }
  
}
