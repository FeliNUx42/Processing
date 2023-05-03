class Particle {

  PVector pos;

  Particle(int x, int y) {
    pos = new PVector(x, y);
  }

  PVector curl() {
    float nx1 = noise(pos.x*s - delta, pos.y*s);
    float nx2 = noise(pos.x*s + delta, pos.y*s);
    float a = (nx2 - nx1) / (delta * 2);

    float ny1 = noise(pos.x*s, pos.y*s - delta);
    float ny2 = noise(pos.x*s, pos.y*s + delta);
    float b = (ny2 - ny1) / (delta * 2);

    return new PVector(a, b);
  }

  void move() {
    PVector dir = curl();
    dir.normalize().rotate(HALF_PI);

    pos.add(PVector.mult(dir, vel));
  }

  void draw() {
    noStroke();
    fill(255);
    circle(pos.x, pos.y, diam);
  }
}
