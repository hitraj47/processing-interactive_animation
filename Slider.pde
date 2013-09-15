class Slider {
  private int x,y;      //location
  private int w,h;      // size
  private String label; // tesxt to show
  
  private float value;  // current value for the slider, range is 0 to 1
  private boolean update = false; // flag to signal when slider is being dragged
  
  Slider (int _x, int _y, int _w, int _h, String _label) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    label = _label;
  }
  
  float getValue() {
    return value;
  }
  
  void setValue(float _f) {
      value = _f;
  }
  
 boolean contains(int _x, int _y) {
   return ( (_x>=x-w/2) 
   && (_x<=x+w/2) 
   && (_y>=y-h/2) 
   && (_y<=y+h/2) ) ? true : false;
 }
  
  void display() {
    
    fill(0,0,255);
    textSize(h*0.5);
    textAlign(CENTER,CENTER);
    text(label, x ,y);
    
    // draw the underlaying box
    fill(255,64);
    rectMode(CENTER);
    rect(x,y,w,h);
    
    // draw the box with the current value
    fill(0, 127);
    rectMode(CORNER);
    rect(x-w/2, y-h/2, w*value, h); 
  }
  
  float interp(int _x) {
    float val = _x - (x-w/2);
    val = val/w;
    if (val < 0) {
      val = 0.0;
    } else if (val > 1) {
      val = 1.0;
    }
    return val;
  }
  
  boolean isUpdating() {
    return update;
  }
  
  void setUpdate(boolean _b) {
    update = _b;
  }
   
}
