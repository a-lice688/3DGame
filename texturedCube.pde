void texturedCube(float x, float y, float z, PImage texture, float size) {
  world.pushMatrix();
  world.translate(x, y, z);
  world.noStroke();

  // Top
  world.beginShape(QUADS);
  world.texture(texture);

  float s = size;

  //float u = s / texture.width;
  //float v = s / texture.height;


  world.vertex(0, 0, 0, 0, 0);
  world.vertex(s, 0, 0, 1, 0);
  world.vertex(s, 0, s, 1, 1);
  world.vertex(0, 0, s, 0, 1);
  world.endShape();

  // Bottom
  world.beginShape(QUADS);
  world.texture(texture);
  world.vertex(0, s, 0, 0, 0);
  world.vertex(s, s, 0, 1, 0);
  world.vertex(s, s, s, 1, 1);
  world.vertex(0, s, s, 0, 1);
  world.endShape();

  // Left
  world.beginShape(QUADS);
  world.texture(texture);
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(0, 0, s, 1, 0);
  world.vertex(0, s, s, 1, 1);
  world.vertex(0, s, 0, 0, 1);
  world.endShape();

  // Right
  world.beginShape(QUADS);
  world.texture(texture);
  world.vertex(s, 0, 0, 0, 0);
  world.vertex(s, 0, s, 1, 0);
  world.vertex(s, s, s, 1, 1);
  world.vertex(s, s, 0, 0, 1);
  world.endShape();

  // Back
  world.beginShape(QUADS);
  world.texture(texture);
  world.vertex(0, 0, s, 0, 0);
  world.vertex(s, 0, s, 1, 0);
  world.vertex(s, s, s, 1, 1);
  world.vertex(0, s, 0, 0, 1);
  world.endShape();

  // Front
  world.beginShape(QUADS);
  world.texture(texture);
  world.vertex(0, 0, 1, 0, 0);
  world.vertex(s, 0, 1, 1, 0);
  world.vertex(s, s, 1, 1, 1);
  world.vertex(0, s, 1, 0, 1);
  world.endShape();

  world.popMatrix();
}

void texturedCube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size) {
  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(size);
  world.noStroke();

  // Top
  world.beginShape(QUADS);
  world.texture(top);
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 0, 1, 1, 1);
  world.vertex(0, 0, 1, 0, 1);
  world.endShape();

  // Bottom
  world.beginShape(QUADS);
  world.texture(bottom);
  world.vertex(0, 1, 0, 0, 0);
  world.vertex(1, 1, 0, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);
  world.endShape();

  // Left
  world.beginShape(QUADS);
  world.texture(side);
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(0, 0, 1, 1, 0);
  world.vertex(0, 1, 1, 1, 1);
  world.vertex(0, 1, 0, 0, 1);
  world.endShape();

  // Right
  world.beginShape(QUADS);
  world.texture(side);
  world.vertex(1, 0, 0, 0, 0);
  world.vertex(1, 0, 1, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(1, 1, 0, 0, 1);
  world.endShape();

  // Front
  world.beginShape(QUADS);
  world.texture(side);
  world.vertex(0, 0, 1, 0, 0);
  world.vertex(1, 0, 1, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);
  world.endShape();

  // Back
  world.beginShape(QUADS);
  world.texture(side);
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 1, 0, 1, 1);
  world.vertex(0, 1, 0, 0, 1);
  world.endShape();

  world.popMatrix();
}
