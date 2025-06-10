class Particle extends GameObject {

  PVector vel;
  PVector gravity;
  float speed;

  public Particle(PVector newloc) {
    super();
    lives = 255;
    loc = newloc.copy();
    speed = 50;
    float vx = random(-5, 5);
    float vy = random(-5, 0);
    float vz = random(-5, 5);
    
    vel = new PVector(vx, vy, vz);
    vel.setMag(speed);
    gravity = new PVector(0, 5, 0);
  }

  void act() {
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(white);
    world.stroke(100);
    world.box(size);
    world.popMatrix();
    lives--;
  }
}
