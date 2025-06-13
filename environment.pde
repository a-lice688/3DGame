void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);

      PImage texture = null;
      float size = gridSize;

      if (c == dullBlue) {
        if ((x + y) % 2 != 0) continue;
        texture = rockWalls;
        size = gridSize * 2;
      }

      if (c == black) {
        texture = grassBlock;
      }

      float wx = (x - map.width / 2.0) * gridSize;
      float wz = (y - map.height / 2.0) * gridSize;

      if (texture != null) {
        for (int h = 1; h <= 5; h++) {
          texturedCube(wx, height - size * h, wz, texture, size);
        }
      }
    }
  }
}



void drawMazeFloor() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      if (map.get(x, y) == white) {
        float wx = (x - map.width / 2.0) * gridSize;
        float wz = (y - map.height / 2.0) * gridSize;
        texturedCube(wx, height, wz, floor, gridSize);
      }
    }
  }
}


void drawAxis() {
  world.strokeWeight(5);
  int axisLength = 2000;
  world.stroke(255, 0, 0);
  world.line(-axisLength, 0, 0, axisLength, 0, 0);
  world.stroke(0, 255, 0);
  world.line(0, -axisLength, 0, 0, axisLength, 0);
  world.stroke(0, 0, 255);
  world.line(0, 0, -axisLength, 0, 0, axisLength);
  world.strokeWeight(1);
}
