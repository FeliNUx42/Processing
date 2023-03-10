class Particle {
  PVector pos;
  PVector pos0;
  PVector vel = new PVector(0,0);
  PVector acc;
  int r = 1;

  Particle(float x, float y) {
    pos = new PVector(x, y);
    pos0 = new PVector(x, y);
  }

  void Update() {
    int x = floor(pos.x/scl);
    int y = floor(pos.y/scl);
    int index = x + y*cols;

    pos0 = pos.copy();

    acc = field[index].copy();
    acc.mult(react);
    vel.add(acc);
    vel.limit(maxvel);
    pos.add(vel);

    if (pos.x >= width) {
      pos.x = 0;
      pos0 = pos.copy();
    } if (pos.x < 0) {
      pos.x = width-1;
      pos0 = pos.copy();
    } if (pos.y >= height) {
      pos.y = 0;
      pos0 = pos.copy();
    } if (pos.y < 0) {
      pos.y = height-1;
      pos0 = pos.copy();
    }
  }

  void Draw() {
    line(pos.x, pos.y, pos0.x, pos0.y);
  }
}