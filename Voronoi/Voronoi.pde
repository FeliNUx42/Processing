int p_count = 5;
PVector[] points = new PVector[p_count];

void setup() {
  size(800,800);
  background(0);

  for (int i=0; i<p_count; i++) {
    points[i] = new PVector(random(width), random(height));
  }
}

void draw() {
  for (int i=0; i<p_count; i++) {
    circle(points[i].x, points[i].y, 20);
  }
}