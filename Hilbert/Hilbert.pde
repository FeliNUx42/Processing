ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<PVector> path = new ArrayList<PVector>();

int order = 7;
int n;
int total;
float l;

PVector hilbert(int i) {
  int ind = i & 3;
  PVector v = points.get(ind).copy();

  for (int j=1; j<order; j++) {
    i = i >> 2;
    ind = i & 3;
    float len = pow(2, j);

    if (ind == 0) {
      float temp = v.x;
      v.x = v.y;
      v.y = temp;
    } else if (ind == 1) {
      v.y += len;
    } else if (ind == 2) {
      v.x += len;
      v.y += len;
    } else if (ind == 3) {
      float temp = len - 1 - v.x;
      v.x = len - 1 - v.y;
      v.y = temp;
      v.x += len;
    }
  }

  return v;
}

void setup() {
  size(1025, 1025);
  frameRate(240);
  background(0);
  colorMode(HSB, 360, 255, 255);

  points.add(new PVector(0, 0));
  points.add(new PVector(0, 1));
  points.add(new PVector(1, 1));
  points.add(new PVector(1, 0));

  n = int(pow(2, order));
  total = n * n;
  l = width / float(n);
  println(l);

  for (int i=0; i<total; i++) {
    PVector v = hilbert(i).copy();
    v.mult(l);
    v.add(l/2, l/2);
    path.add(v);
  }

  drawOnce();
}

void draw() {
  int i = frameCount;

  if (i >= (path.size())) {
    noLoop();
    return;
  }

  PVector v0 = path.get(i-1);
  PVector v1 = path.get(i);

  float col = float(i) / float(path.size()) * 360.0;
  stroke(col, 255, 255);
  line(v0.x, v0.y, v1.x, v1.y);
}

void drawOnce() {
  for (int i=0; i<path.size()-1; i++) {
    PVector v0 = path.get(i);
    PVector v1 = path.get(i+1);

    float col = float(i) / float(path.size()) * 360.0;
    stroke(col, 255, 255);
    line(v0.x, v0.y, v1.x, v1.y);
  }
  noLoop();
}