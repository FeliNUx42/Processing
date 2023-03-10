int scl = 20;
float step = 0.05;
float z_step = 0.01;
int maxvel = 2;
float react = 0.2;
int p_count = 1000;

PVector[] field;
int cols;
int rows;

float x_off = 0;
float y_off = 0;
float z_off = 0;

Particle[] p;

void setup() {
  size(800, 800);
  background(0);
  
  cols = ceil(width/scl);
  rows = ceil(height/scl);

  field = new PVector[cols*rows];

  p = new Particle[p_count];

  for (int i=0; i<p_count; i++) {
    p[i] = new Particle(random(width), random(height));
  }
}

void draw() {
  //background(0);
  //stroke(255);
  stroke(255, 30);
  
  y_off = 0;
  for (int i=0; i<cols; i++) {
    x_off = 0;
    for (int j=0; j<rows; j++) {
      int index = i + j * cols;
      float a = noise(x_off, y_off, z_off)  * TWO_PI * 2;
      field[index] = PVector.fromAngle(a);
      
      x_off += step;
      /*
      PVector pos = new PVector(i*scl, j*scl);
      PVector dir = PVector.add(pos, field[index].copy().mult(scl/2));
      line(pos.x, pos.y, dir.x, dir.y);
      */
    }
    y_off += step;
  }
  
  z_off += z_step;

  for (int i=0; i<p_count; i++) {
    p[i].Update();
    p[i].Draw();
  }
}