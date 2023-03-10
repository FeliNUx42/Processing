class Block {
  PVector pos;
  boolean visible;

  Block(int x, int y, boolean v) {
    pos = new PVector(x, y);
    visible = v;
  }

  void draw() {
    if (!visible) return;

    float x = (pos.x + 1) * u;
    float y = (pos.y + 2) * u;

    noStroke();
    fill(c0);
    rect(x, y, u, u);

    fill(c1);
    triangle(x, y, x+u, y, x+u, y-u);
    triangle(x+u, y, x+u, y-u, x+2*u, y-u);

    fill(c2);
    triangle(x+u, y, x+2*u, y, x+2*u, y-u);
    triangle(x+u, y, x+u, y+u, x+2*u, y);
  }
}