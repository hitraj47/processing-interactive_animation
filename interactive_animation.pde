/* @pjs preload="bikini_bottom.jpg"; /*
/* @pjs preload="spongebob.png"; */
/* @pjs preload="patrick.png"; */

// Java imports
//import java.text.DecimalFormat;

// Graphics
PImage backgroundImage;
final static String BACKGROUND_IMAGE = "bikini_bottom.jpg";
PImage spongebobImage;
final static String SPONGEBOB_IMAGE = "spongebob.png";
PImage patrickImage;
final static String PATRICK_IMAGE = "patrick.png";

// Sprites
Sprite spongebob;
Sprite patrick;

// GUI elements
MyStatusBar myMyStatusBar;
Checkbox chkSpongebob;
Checkbox chkPatrick;
Slider sliderSpongebobSpeed;
Slider sliderPatrickSpeed;
Button btnStartStop;

// button labels
final static String LABEL_START = "Start";
final static String LABEL_STOP = "Stop";

// Height of the are for the UI controls
float UIAreaHeight = 80;

// Height for the movement box that the sprites move in
float movementBoxHeight;

// Flag for animation
boolean animating = false;

long timeToWait = 1000;
long time;

void setup() {
  
  time = millis();
  
  size(800,600);
  backgroundImage = loadImage(BACKGROUND_IMAGE);
  
  // GUI
  myMyStatusBar = new MyStatusBar(MyStatusBar.POSITION_BOTTOM);  
  
  chkSpongebob = new Checkbox(5, 500, 25, "Show Spongebob");
  chkSpongebob.setChecked(true);
  
  chkPatrick = new Checkbox(5, 535, 25, "Show Patrick");
  chkPatrick.setChecked(false);
  
  sliderSpongebobSpeed = new Slider(370, 513, 300, 30, "Spongebob's Speed");
  sliderSpongebobSpeed.setValue(0.5);
  
  sliderPatrickSpeed = new Slider(370, 550, 300, 30, "Patrick's Speed");
  sliderPatrickSpeed.setValue(0.5);
  
  btnStartStop = new Button(LABEL_START, 700, 530, 100, 30);
  
  // Movement box max height
  movementBoxHeight = height-myMyStatusBar.getMyStatusBarHeight()-UIAreaHeight;
  
  // images
  spongebobImage = loadImage(SPONGEBOB_IMAGE);
  patrickImage = loadImage(PATRICK_IMAGE);
  
  // Sprites  
  spongebob = new Sprite(spongebobImage, random(0,width-spongebobImage.width), random(0, movementBoxHeight-spongebobImage.height));
  patrick = new Sprite(patrickImage, random(0,width-patrickImage.width), random(0, movementBoxHeight-patrickImage.height));
  
}

void draw() {
  // background image
  image(backgroundImage,0,0);
  
  // status bar
  myMyStatusBar.display();
  
  // Update the status bar
  if (millis() - time > timeToWait) {
    updateMyStatusBar();
    time = millis();
  }
  
  // An area to play the UI controls
  drawUIArea();
  
  // Draw UI elements
  chkSpongebob.display();
  chkPatrick.display();
  sliderSpongebobSpeed.display();
  sliderPatrickSpeed.display();
  btnStartStop.display();
  
  // Sprites
  if (chkSpongebob.isChecked()) {
    spongebob.display();
  }
  if (animating) {
    spongebob.moveWithinBounds(0, 0, width, movementBoxHeight);
  } else {
    spongebob.stopMoving();
  }
  
  if (chkPatrick.isChecked()) {
    patrick.display();
  }
  if (animating) {
    patrick.moveWithinBounds(0, 0, width, movementBoxHeight);
  } else {
    patrick.stopMoving();
  }
    
}

float calculateSpeed(float _currentSpeed, float _sliderValue) {
  float speed = map(_sliderValue, 0, 1, 0, 5);
  if (_currentSpeed < 0) {
    return speed*-1;
  } else {
    return speed;
  }
}

void updateMyStatusBar() {
  String text = "FPS: " + nf(frameRate,0,1) + " | ";
  text += "Elapsed time: " + time/1000 + " seconds | ";
  text += "Spongebob Position: (" + nf(spongebob.getXPosition(),0,1) + "," + nf(spongebob.getYPosition(),0,1) + ") | ";
  text += "Patrick Position: (" + nf(patrick.getXPosition(),0,1) + ", " + nf(patrick.getYPosition(),0,1) + ")";
  myMyStatusBar.setStatusText(text);
}

void drawUIArea() {
  rectMode(CORNER);
  stroke(0,0,0);
  fill(128,128,128,128);
  rect(-1,height-myMyStatusBar.getMyStatusBarHeight()-UIAreaHeight,width+1,UIAreaHeight);
}

void moveSpongebob() {
  spongebob.setXSpeed( calculateSpeed( spongebob.getXSpeed(), sliderSpongebobSpeed.getValue() ) );
  spongebob.setYSpeed( calculateSpeed( spongebob.getYSpeed(), sliderSpongebobSpeed.getValue() ) );
}

void movePatrick() {
  patrick.setXSpeed( calculateSpeed( patrick.getXSpeed(), sliderPatrickSpeed.getValue() ) );
  patrick.setYSpeed( calculateSpeed( patrick.getYSpeed(), sliderPatrickSpeed.getValue() ) );
}

void mousePressed() {
  
  if(btnStartStop.isMouseOverButton()) {
    btnStartStop.setUpdating(true);
  }
  
  if (chkSpongebob.isMouseInCheckbox()) {
    chkSpongebob.setUpdating(true);
  }
  
  if (chkPatrick.isMouseInCheckbox()) {
    chkPatrick.setUpdating(true);
  }
  
  if (sliderSpongebobSpeed.contains(mouseX, mouseY)) {
    sliderSpongebobSpeed.setUpdate(true);
  }
  
  if (sliderPatrickSpeed.contains(mouseX, mouseY)) {
    sliderPatrickSpeed.setUpdate(true);
  }
  
}

void mouseDragged() {
  
  if(sliderSpongebobSpeed.isUpdating()) {
    float value = sliderSpongebobSpeed.interp(mouseX);
    sliderSpongebobSpeed.setValue(value);
    moveSpongebob();
  }
  
  if(sliderPatrickSpeed.isUpdating()) {
    float value = sliderPatrickSpeed.interp(mouseX);
    sliderPatrickSpeed.setValue(value);
    movePatrick();
  }
  
}

void mouseReleased() {
  
  if (btnStartStop.isUpdating()) {
    if (btnStartStop.isMouseOverButton()) {
      if(btnStartStop.getLabel().equals(LABEL_START)) {
        animating = true;
        moveSpongebob();
        movePatrick();
        btnStartStop.setLabel(LABEL_STOP);
      } else if (btnStartStop.getLabel().equals(LABEL_STOP)) {
        animating = false;
        btnStartStop.setLabel(LABEL_START);
      }
    }
    btnStartStop.setUpdating(false);
  }
  
  if (chkSpongebob.isUpdating()) {
    if (chkSpongebob.isMouseInCheckbox()) {
      chkSpongebob.toggle();
    }
    chkSpongebob.setUpdating(false);
  }
  
  if (chkPatrick.isUpdating()) {
    if(chkPatrick.isMouseInCheckbox()) {
      chkPatrick.toggle();
    }
    chkPatrick.setUpdating(false);
  }
  
  if (sliderSpongebobSpeed.isUpdating()) {
    sliderSpongebobSpeed.setUpdate(false);
  }
  
  if (sliderPatrickSpeed.isUpdating()) {
    sliderPatrickSpeed.setUpdate(false);
  }
  
}
