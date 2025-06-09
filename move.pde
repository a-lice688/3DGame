
void move() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();

  float turnSpeed = 0.02; //replaces the robot class (still can turn even if mouse hits limit

  if (qkey) {
    leftRightHeadAngle -= turnSpeed;
  }
  if (ekey) {
    leftRightHeadAngle += turnSpeed;
  }

  if (wkey && canMove(0)) {
    eyeX += cos(leftRightHeadAngle) * moveSpeed;
    eyeZ += sin(leftRightHeadAngle) * moveSpeed;
  }
  if (skey && canMove(PI)) {
    eyeX -= cos(leftRightHeadAngle) * moveSpeed;
    eyeZ -= sin(leftRightHeadAngle) * moveSpeed;
  }
  if (akey && canMove(-HALF_PI)) {
    eyeX += cos(leftRightHeadAngle - HALF_PI) * moveSpeed;
    eyeZ += sin(leftRightHeadAngle - HALF_PI) * moveSpeed;
  }
  if (dkey && canMove(HALF_PI)) {
    eyeX += cos(leftRightHeadAngle + HALF_PI) * moveSpeed;
    eyeZ += sin(leftRightHeadAngle + HALF_PI) * moveSpeed;
  }


  leftRightHeadAngle += (mouseX - pmouseX)*0.01;
  upDownHeadAngle += (mouseY - pmouseY)*0.01;


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

boolean canMove(float angle) {
  float radius = 50;
  float checkDistance = 130;

  for (int i = -1; i <= 1; i++) {
    float sideAngle = leftRightHeadAngle + angle + HALF_PI;
    float sideX = cos(sideAngle) * radius * i;
    float sideZ = sin(sideAngle) * radius * i;

    float fwdx = eyeX + cos(leftRightHeadAngle + angle) * checkDistance + sideX;
    float fwdz = eyeZ + sin(leftRightHeadAngle + angle) * checkDistance + sideZ;

    int mapx = int(fwdx + 2000) / gridSize;
    int mapy = int(fwdz + 2000) / gridSize;

    if (mapx < 0 || mapx >= map.width || mapy < 0 || mapy >= map.height) {
      return false;
    }

    if (map.get(mapx, mapy) != white) {
      return false;
    }
  }

  return true;
}
