class SpellBook extends GameObject {
  String[] bookNames = new String[2];
  String[] bookEffects = new String[2];

  boolean rightPressed = false;
  boolean leftPressed = false;


  boolean opened = false;
  boolean learned = false;
  boolean showPrompt = false;
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
    if (opened && !learned) {
      showPrompt = true;

      if (rightkey && !rightPressed) {
        selected = 1;
        rightPressed = true;
      }
      if (!rightkey) {
        rightPressed = false;
      }

      if (leftkey && !leftPressed) {
        selected = 0;
        leftPressed = true;
      }
      if (!leftkey) {
        leftPressed = false;
      }

      HUDLine1 = bookNames[selected];
      HUDLine2 = bookEffects[selected];

      if (selected == 0) {
        HUDLine3 = "Press L to learn, → to switch";
      } else {
        HUDLine3 = "Press L to learn, ← to switch";
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
        showPrompt = false;
        HUDLine1 = "";
        HUDLine2 = "";
        HUDLine3 = "";
        objects.remove(this);
        currentBooks.remove(this);
      }

      if (ckey) {
        opened = false;
        showPrompt = false;
        HUDLine1 = "";
        HUDLine2 = "";
        HUDLine3 = "";
      }
    }
  }

  void show() {
    if (learned) return;

    if (okey) {
      opened = true;
    }

    drawModels(loc.x, loc.y, loc.z, 1.3, 1.3, 1.3, book, PI, HALF_PI, 0);

    float distance = distToPlayer();

    // if (cancelled && distance > 250) {
    //   cancelled = false;
    //   return;
    // }

    // if (distance < 250 && !cancelled) {

    if (distance < 250) {
      showPrompt = true;
      HUDLine1 = "";
      HUDLine2 = "";
      HUDLine3 = "Press 'O' to open the book";
    }
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

  currentBooks.add(new SpellBook(xPos[0], yPos[0], zPos[0], 0));
  currentBooks.add(new SpellBook(xPos[1], yPos[1], zPos[1], 2));
  currentBooks.add(new SpellBook(xPos[2], yPos[2], zPos[2], 4));
}
