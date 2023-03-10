color bgr = color(14, 26, 36);
color red = color(252, 18, 84);
color white = color(252, 254, 255);
color gray = color(80, 103, 124);

float gravity = 0.1;
int iter = 5;
boolean started = false;
PVector dragStart, dragEnd;
float dist;

ArrayList<Point> points = new ArrayList<Point>();
ArrayList<Link> links = new ArrayList<Link>();


void setup() {
  size(800, 800);
}

void mouseClicked() {
  if (started) return;

  boolean locked = mouseButton == RIGHT;

  Point p = new Point(mouseX, mouseY, locked);
  points.add(p);
}

void keyPressed() {
  if (keyCode == 32) // space
    started = true;
  if (keyCode == 82) { // r
    started = false;
    points = new ArrayList<Point>();
    links = new ArrayList<Link>();
  }
}

void mousePressed() {
  dragStart = new PVector(mouseX, mouseY);
}

void mouseReleased() {
  if (started) return;

  dragEnd = new PVector(mouseX, mouseY);

  dist = 10000; // infinity
  int startPoint = -1;

  for (int i=0; i<points.size(); i++) {
    float _dist = PVector.dist(dragStart, points.get(i).pos);
    if (_dist < dist) {
      startPoint = int(i);
      dist = _dist;
    }
  }

  dist = 10000; // infinity
  int endPoint = -1;

  for (int i=0; i<points.size(); i++) {
    float _dist = PVector.dist(dragEnd, points.get(i).pos);
    if (_dist < dist) {
      endPoint = int(i);
      dist = _dist;
    }
  }

  if (startPoint != -1 && endPoint != -1 && startPoint != endPoint) {
    Link l = new Link(points.get(startPoint), points.get(endPoint));
    links.add(l);
  }
}

void draw() {
  background(bgr);

  if (started)
    for (Point p : points) p.Update();
    for (int i=0; i<iter; i++)
      for (Link l : links) l.Update();

  for (Link l : links) l.Draw();
  for (Point p : points) p.Draw();

  println(frameRate);
}