void keyPressed() {
  if (key == 'E' || key == 'e') wkey = true;
  if (key == 'S' || key == 's') akey = true;
  if (key == 'F' || key == 'f') dkey = true;
  if (key == 'D' || key == 'd') skey = true;

  if (key == 'W' || key == 'w') qkey = true;
  if (key == 'R' || key == 'r') ekey = true;
}

void keyReleased() {
  if (key == 'E' || key == 'e') wkey = false;
  if (key == 'S' || key == 's') akey = false;
  if (key == 'F' || key == 'f') dkey = false;
  if (key == 'D' || key == 'd') skey = false;

  if (key == 'W' || key == 'w') qkey = false;
  if (key == 'R' || key == 'r') ekey = false;
}

void mousePressed() {
  for (SpellBook b : currentBooks) {
    b.open();
  }
}
