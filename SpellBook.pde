class SpellBook extends GameObject {
  String[] bookNames = new String[2];
  String[] bookEffects = new String[2];

  boolean opened = false;
  boolean learned = false;
  // boolean cancelled = false;

  int selected = 0;

  SpellBook(float x, float y, float z, int index) {
    super(x, y, z, 80);
    this.bookNames[0] = spellNames[index];
    this.bookEffects[0] = spellEffects[index];
    this.bookNames[1] = spellNames[index + 1];
    this.bookEffects[1] = spellEffects[index + 1];
  }

  void act() {

    float distance = distToPlayer();

    if (learned) return;

    if (okey) opened = true;

    // Nearby but not opened or learned: show "press 'o'"
    if (distance <= 300 && !opened && !learned) {
      hud.set("", "", "Press 'O' to open the book");
    }

    // Not close enough
    if (distance > 300 && !learned) {
      hud.clear();
    }

    //opened but not learned: show spell options
    if (opened && !learned) {
      
      if (key == '1') {
        key1 = true;
        selected = 0;
      }
      if (key == '2') {
        key2 = true;
        selected = 1;
      }

      if (selected == 0) {
        hud.set(bookNames[0], bookEffects[0], "Press L to learn, 2 to view the second spell");
      } else {
        hud.set(bookNames[1], bookEffects[1], "Press L to learn, 1 to view the first spell");
      }

      if (lkey) {
        for (int i = 0; i < spellNames.length; i++) {
          if (spellNames[i].equals(bookNames[selected])) {
            learnedSpells.add(spells.get(i));
            break;
          }
        }
        learned = true;
        opened = false;
        hud.clear();

        objects.remove(this);
        currentBooks.remove(this);
      }

      //      if (ckey) {
      //        opened = false;
      //        showPrompt = false;
      //        HUDLine1 = "";
      //        HUDLine2 = "";
      //        HUDLine3 = "";
      //      }
    }
  }

  void show() {

    drawModels(loc.x, loc.y, loc.z, 1.3, 1.3, 1.3, book, PI, HALF_PI, 0);

    // if (cancelled && distance > 250) {
    //   cancelled = false;
    //   return;
    // }

    // if (distance < 250 && !cancelled) {
  }

  float distToPlayer() {
    return dist(this.loc.x, this.loc.y, this.loc.z, player.eye.x, player.eye.y, player.eye.z);
  }
}


void generateBooks() {
  currentBooks.clear();

  float[] xPos = { -450, 710, -760 };
  float[] yPos = { height - 48, height - 48, height - 115 };
  float[] zPos = { 212, 700, -755 };

  currentBooks.add(new SpellBook(xPos[0], yPos[0], zPos[0], 0)); // sectumsempra and glacius
  currentBooks.add(new SpellBook(xPos[1], yPos[1], zPos[1], 2)); // avada and imperio
  currentBooks.add(new SpellBook(xPos[2], yPos[2], zPos[2], 4)); //
}
