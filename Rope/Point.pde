class Point {
  PVector pos, pos0;
  boolean locked;

  Point(float x, float y, boolean l) {
    pos = new PVector(x, y);
    pos0 = new PVector(x, y);
    locked = l;
  }

  void Update() {
    if (locked) return;

    PVector diff = PVector.sub(pos, pos0);
    PVector vel = new PVector(0, gravity);

    pos0 = pos.copy();

    pos.add(diff);
    pos.add(vel);
  }

  void Draw() {
    noStroke();
    fill(white);
    if (locked) fill(red);
    ellipse(pos.x, pos.y, 10, 10);
  }
}