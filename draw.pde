
void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == dullBlue) {
        texturedCube(x*gridSize - 2000, height - gridSize, y*gridSize - 2000, stoneBricks, gridSize);
        texturedCube(x*gridSize - 2000, height - gridSize*2, y*gridSize - 2000, stoneBricks, gridSize);
        texturedCube(x*gridSize - 2000, height - gridSize*3, y*gridSize - 2000, stoneBricks, gridSize);
      } else if (c == black) {
        texturedCube(x*gridSize - 2000, height - gridSize, y*gridSize - 2000, oakPlanks, gridSize);
        texturedCube(x*gridSize - 2000, height - gridSize*2, y*gridSize - 2000, oakPlanks, gridSize);
        texturedCube(x*gridSize - 2000, height - gridSize*3, y*gridSize - 2000, oakPlanks, gridSize);
      }
    }
  }
}

void drawFloor(int xStart, int xEnd, int zStart, int zEnd, int yLevel, int gap) {
  stroke(255);
  strokeWeight(1);

  for (int x = xStart; x <= xEnd; x += gap) {
    for (int z = zStart; z <= zEnd; z += gap) {
      texturedCube(x, yLevel, z, oakPlanks, gap);
    }
  }
}

void drawAxis() {
  strokeWeight(5);

  int axisLength = 2000;

  //x axis -> Red
  stroke(255, 0, 0);
  line(-axisLength, 0, 0, axisLength, 0, 0);

  //y axis -> Green
  stroke(0, 255, 0);
  line(0, -axisLength, 0, 0, axisLength, 0);

  //z axis -> Blue
  stroke(0, 0, 255);
  line(0, 0, -axisLength, 0, 0, axisLength);

  strokeWeight(1);
}
