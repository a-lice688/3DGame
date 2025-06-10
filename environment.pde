void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      float wx = (x - map.width / 2.0) * gridSize;
      float wz = (y - map.height / 2.0) * gridSize;

      PImage tex = null;
      float size = gridSize;

      if (c == dullBlue) {
        tex = rockWalls;
        size = gridSize * 1.5;
      } else if (c == black) {
        tex = grassBlock;
      }

      if (tex != null) {
        for (int h = 1; h <= 3; h++) {
          texturedCube(wx, height - gridSize * h, wz, tex, size);
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
        texturedCube(wx, height, wz, oakPlanks, gridSize);
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
