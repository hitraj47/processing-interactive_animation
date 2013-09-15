class StatusBar {
  
  public static final String POSITION_TOP = "top";
  public static final String POSITION_BOTTOM = "bottom";
  
  private String position;
  private String text = "";
  private float statusBarHeight = 30;
  
  StatusBar(String _position) {
    this.position = _position;
  }
  
  void setStatusBarHeight(float _statusBarHeight) {
    this.statusBarHeight = _statusBarHeight;
  }
  
  float getStatusBarHeight() {
    return statusBarHeight;
  }
  
  void setText(String _text) {
    this.text = _text;
  }
  
  String getText() {
    return text;
  }
  
  void setPosition(String _position) {
    this.position = _position;
  }

  String getPosition() {
    return position;
  }  
  
  void display() {
    float y = 0;
    float x = 0;
    
    if (position.equals(POSITION_TOP)) {
      y = 0;
    } else if (position.equals(POSITION_BOTTOM)) {
      y = height-statusBarHeight;
    }
    
    rectMode(CORNER);
    fill(0,0,0);
    rect(x,y,width,statusBarHeight);
    
    fill(0,255,0);
    textSize(statusBarHeight/2);
    textAlign(LEFT, CENTER);
    text(text,x+5,y+(statusBarHeight/2));
  }
  
}
