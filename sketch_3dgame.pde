//Jun 4, 2025

//import java.awt.Robot;
//Robot robot;
//boolean skipFrame;

import java.util.ArrayList;
ArrayList <GameObject> objects = new ArrayList<GameObject>();

color black = #000000; //oakplanks
color white = #FFFFFF; //empty space
color dullBlue = #7092BE; //grassBlock

int gridSize;
PImage map;
PImage grassBlock;
PImage oakPlanks;
PImage stoneBricks;

boolean wkey, akey, skey, dkey, qkey, ekey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ;
float leftRightHeadAngle, upDownHeadAngle;

float moveSpeed = 10;



void setup() {

  grassBlock = loadImage("Grass_Block_Top_C.png");
  oakPlanks = loadImage("Oak_Log_Top.png");
  stoneBricks = loadImage("Stone_Bricks.png");

  fullScreen(P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  eyeX = width/2;
  eyeY = 9*height/10;
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

  //try {
  //  robot = new Robot();
  //}
  //catch (Exception e) {
  //  e.printStackTrace();
  //}

  //skipFrame = false;
}

void draw() {
  background(0);
  move();
  drawAxis();

  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ);

  drawFloor(-2000, 2000, -2000, 2000, height - gridSize*4, gridSize); //ceiling
  drawFloor(-2000, 2000, -2000, 2000, height, gridSize); //floor

  drawMap();

  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.show();
    obj.act();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
}
