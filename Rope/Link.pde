class Link {
  Point A, B;
  float length;
  boolean shrink = false;

  Link(Point a, Point b) {
    A = a;
    B = b;

    length = PVector.dist(A.pos, B.pos);
  }

  void Update() {
    PVector center = PVector.lerp(A.pos, B.pos, 0.5);
    PVector dir = PVector.sub(A.pos, B.pos).normalize();
    PVector next = PVector.mult(dir, length/2);
    float dist = PVector.dist(A.pos, B.pos);

    if (dist <= length && shrink) return;

    if (!A.locked)
      A.pos = PVector.add(center, next);
    if (!B.locked)
      B.pos = PVector.sub(center, next);
  }

  void Draw() {
    stroke(gray);
    strokeWeight(3);
    line(A.pos.x, A.pos.y, B.pos.x, B.pos.y);
  }
}