class Spell extends GameObject {
  PVector dir;
  float speed;

  boolean sliced = false;
  int sliceTimer = 30;
  PVector leftHalf, rightHalf;

  boolean frozen = false;
  int freezeTimer = 0;

  Spell(float x, float y, float z, float speed, PVector direction) {
    super(x, y, z, 10);
    this.speed = speed;
    dir = direction.copy();
    dir.setMag(speed);
  }
  
  void act() {
    if (lives <= 0 && sliced == false) {
      sliced = true;
      leftHalf = new PVector(-3, 0, 0);
      rightHalf = new PVector(3, 0, 0);
    }

    if (sliced) {
      sliceTimer--;
      leftHalf.x -= 0.5;
      rightHalf.x += 0.5;
      return;
    }

    if (frozen) {
      freezeTimer--;
      if (freezeTimer <= 0) {
        frozen = false;
      }
      return;
    }
  }

  void show() {
    if (lives <= 0 && sliced == false) return;

    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);

    if (sliced) {
      world.fill(255, 0, 255);
      world.stroke(100);

      // Left half
      world.pushMatrix();
      world.translate(leftHalf.x, leftHalf.y, leftHalf.z);
      world.box(size / 2, size, size);
      world.popMatrix();

      // Right half
      world.pushMatrix();
      world.translate(rightHalf.x, rightHalf.y, rightHalf.z);
      world.box(size / 2, size, size);
      world.popMatrix();
    } else {
      if (frozen) {
        world.fill(100, 200, 255);
      } else {
        world.fill(150, 0, 0);
      }
      world.stroke(50);
      world.box(size);
    }

    world.popMatrix();
  }
}
