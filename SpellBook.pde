class SpellBook extends GameObject {
  String name;
  String effect;
  boolean opened = false;
  boolean taken = false;

  SpellBook(float x, float y, float z, String name, String effect) {
    super(x, y, z, 80);
    this.name = name;
    this.effect = effect;
  }

  void act() {
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    if (opened) {
      world.fill(color(100, 255, 200));
    } else {
      world.fill(color(200, 50, 100));
    }
    world.box(size, size / 2, size);
    world.popMatrix();

    if (opened && !taken) {
      HUD.beginDraw();
      HUD.fill(255);
      HUD.textAlign(CENTER);
      HUD.textSize(20);
      HUD.text(name, width/2, height - 100);
      HUD.text(effect, width/2, height - 70);
      HUD.text("Click to learn this spell", width/2, height - 40);
      HUD.endDraw();
    }
  }

  void open() {
    if (opened && !taken && distToPlayer() < 150) {
      learnedSpells.add(name);
      println("You learned: " + name);
      taken = true;
      lockOtherBooks();
    }
  }

  void lockOtherBooks() {
    for (SpellBook b : currentBooks) {
      if (b != this) b.taken = true; // makes other books "locked"
    }
  }

  float distToPlayer() {
    return dist(loc.x, loc.y, loc.z, player.eye.x, player.eye.y, player.eye.z);
  }
}

void generateBooks() {
  currentBooks.clear();
  ArrayList<Integer> picked = new ArrayList<Integer>();

  while (picked.size() < 3) {
    int r = int(random(spellNames.length));
    if (!picked.contains(r)) {
      picked.add(r);
    }
  }

  for (int i = 0; i < 3; i++) {
    int index = picked.get(i);
    float x = -500 + i * 500;
    float y = height - gridSize * 3.5;
    float z = 0;
    currentBooks.add(new SpellBook(x, y, z, spellNames[index], spellEffects[index]));
  }
}
