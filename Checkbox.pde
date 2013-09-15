class Checkbox {
  
  private String label;
  private boolean checked = false;
  private float boxWidth, x, y;
  private boolean updating = false;
  
  Checkbox(float _x, float _y, float _boxWidth, String _label) {
    this.x = _x;
    this.y = _y;
    this.boxWidth = _boxWidth;
    this.label = _label;
  }
  
  boolean isChecked() {
    return checked;
  }
  
  void toggle() {
    if (checked) {
      checked = false;
    } else {
      checked = true;
    }
  }
  
  void display() {
    rectMode(CORNER);
    stroke(0,0,0);
    fill(255,255,255);
    
    // outer box
    rect(x,y,boxWidth,boxWidth);
    
    if (checked) {
      rectMode(CENTER);
      fill(0,0,0);
      rect(x+boxWidth/2,y+boxWidth/2,boxWidth*0.70,boxWidth*0.70);
    }
    
    fill(0,0,0);
    textSize(boxWidth*0.8);
    textAlign(LEFT,CENTER);
    text(label,x+boxWidth+5,y+boxWidth/2);
  }
  
  boolean isMouseInCheckbox() {
    return (mouseX >= x
            && mouseX <= x+boxWidth
            && mouseY >= y
            && mouseY <= y+boxWidth);
  }
  
  void setChecked(boolean _checked) {
    this.checked = _checked;
  }
  
  boolean isUpdating() {
    return updating;
  }
  
  void setUpdating(boolean _updating) {
    this.updating = _updating;
  }
}
