//June, 2025


import java.util.ArrayList;

ArrayList<GameObject> objects = new ArrayList<GameObject>();
ArrayList<SpellBook> currentBooks = new ArrayList<SpellBook>();
ArrayList<String> learnedSpells = new ArrayList<String>();

String[] spellNames = {
  "Avada Kedavra", "Imperio", "Sectumsempra",
  "Confringo", "Glacius", "Reducto"
};

String[] spellEffects = {
  "Instantly destroys target",
  "Control an enemy temporarily",
  "Slice enemy in half",
  "Big explosion",
  "Freeze enemy in place",
  "Break walls or objects"
};

color black = #000000;
color white = #FFFFFF;
color dullBlue = #7092BE;

int gridSize = 50;
PImage map;
PImage grassBlock;
PImage oakPlanks;
PImage rockWalls;
PImage floor;

boolean wkey, akey, skey, dkey, qkey, ekey;

PGraphics world;
PGraphics HUD;

Player player;

void setup() {
  fullScreen(P3D);

  world = createGraphics(displayWidth, displayHeight, P3D);
  HUD = createGraphics(displayWidth, displayHeight, P2D);

  player = new Player();

  grassBlock = loadImage("Grass_Block_Top_C.png");
  oakPlanks = loadImage("Oak_Log_Top.png");
  rockWalls = loadImage("StoneWall.png");
  floor = loadImage("floor.png");

  map = loadImage("map.png");

  int spawnX = 0;
  int spawnY = 0;

  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      if (map.get(x, y) == white) {
        spawnX = x;
        spawnY = y;
        break;
      }
    }
  }

  float wx = (spawnX - map.width / 2.0) * gridSize;
  float wz = (spawnY - map.height / 2.0) * gridSize;
  player.eye.set(wx, height - gridSize * 1.5, wz);
  player.focus.set(wx, height - gridSize * 1.5, wz + 100);

  world.textureMode(NORMAL);
  world.noStroke();

  wkey = akey = skey = dkey = qkey = ekey = false;

  noCursor();
}

void draw() {
  player.update();

  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(0);
  world.ambientLight(100, 100, 100);
  world.pointLight(255, 255, 255, player.eye.x, player.eye.y, player.eye.z);
  player.applyCamera();

  drawAxis();
  drawMazeFloor();
  drawMap();

  for (int i = 0; i < objects.size(); i++) {
    GameObject obj = objects.get(i);
    obj.show();
    obj.act();
    if (obj.lives == 0) {
      objects.remove(i--);
    }
  }

  world.endDraw();
  image(world, 0, 0);

  float maxAngle = PI / 2.5;
  float weight = map(abs(player.upDownHeadAngle), 0, maxAngle, 6, 2);
  stroke(255);
  strokeWeight(weight);
  line(width / 2 - 15, height / 2, width / 2 + 15, height / 2);
  line(width / 2, height / 2 - 15, width / 2, height / 2 + 15);
}
