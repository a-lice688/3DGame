//Jun 4, 2025

import java.awt.Robot;
Robot robot;

color black = #000000;
color white = #FFFFFF;

int gridSize;
PImage map;

boolean skipFrame;

boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ;
float leftRightHeadAngle, upDownHeadAngle;


void setup() {
  fullScreen(P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  eyeX = width/2;
  eyeY = height/2;
  eyeZ = 0;

  focusX = width/2;
  focusY = height/2;
  focusZ = 10;

  upX = 0;
  upY = 1;
  upZ = 0;

  map = loadImage("map.png");
  gridSize = 100;

  leftRightHeadAngle = radians(270);

  noCursor();

  try {
    robot = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }

  skipFrame = false;
}

void draw() {
  background(0);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ);
  drawFloor();
  drawFocalPoint();
  controlCamera();

  drawMap();
}

void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c != white) {
        pushMatrix();
        fill(c);
        stroke(100);
        translate(x*gridSize - 2000, height/2, y*gridSize - 2000);
        box(gridSize, height, gridSize);
        popMatrix();
      }
    }
  }
}

void drawFloor() {
  stroke(255);
  for (int x = -2000; x <= 2000; x += 100) {
    line(x, height, -2000, x, height, 2000) ;
    line(-2000, height, x, 2000, height, x) ;
  }
}

void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}

void controlCamera() {
  if (wkey) {
    eyeX += cos(leftRightHeadAngle)*10;
    eyeZ += sin(leftRightHeadAngle)*10;
  }
  if (skey) {
    eyeX -= cos(leftRightHeadAngle)*10;
    eyeZ -= sin(leftRightHeadAngle)*10;
  }
  if (akey) {
    eyeX -= cos(leftRightHeadAngle + PI/2)*10;
    eyeZ -= sin(leftRightHeadAngle + PI/2)*10;
  }
  if (dkey) {
    eyeX += cos(leftRightHeadAngle + PI/2)*10;
    eyeZ += sin(leftRightHeadAngle + PI/2)*10;
  }

  if (!skipFrame) {
    leftRightHeadAngle += (mouseX - pmouseX)*0.01;
    upDownHeadAngle += (mouseY - pmouseY)*0.01;
  }

  if (upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5; //max
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5; //max


  focusX = eyeX + cos(leftRightHeadAngle)*300;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(upDownHeadAngle)*300;

  //  if (mouseX < 2) {
  //    robot.mouseMove(width - 3, mouseY);
  //    skipFrame = true;

  //  } else if (mouseX > width - 2) {
  //    robot.mouseMove(3, mouseY);
  //    skipFrame = true;
  //  } else {
  //    skipFrame = false;
  //  }
  //  //println(eyeX, eyeY, eyeZ);
}

void keyPressed() {
  if (key == 'W' || key == 'w') wkey = true;
  if (key == 'A' || key == 'a') akey = true;
  if (key == 'D' || key == 'd') dkey = true;
  if (key == 'S' || key == 's') skey = true;
}

void keyReleased() {
  if (key == 'W' || key == 'w') wkey = false;
  if (key == 'A' || key == 'a') akey = false;
  if (key == 'D' || key == 'd') dkey = false;
  if (key == 'S' || key == 's') skey = false;
}
