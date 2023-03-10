import processing.javafx.*;


int scl = 1;

float dec = 0.98;
float diff = 0.0;
int count = 80000;

float vel = 1;
float ang_vel_min = 1;
float ang_vel_max = 2;

float s_angle = PI/6;
float s_dist = 10;

float weight = 0.05;

int w;
int h;

int iter = 0;
int gap = 1;


int c2i(int x, int y, int w) { // coord to index
  return x + y * w;
}

Trail t;
Particle[] particles;

void setup() {
  size(1280, 720, FX2D);
  //fullScreen(FX2D);
  background(0);

  frameRate(240);

  w = floor(width / scl);
  h = floor(height / scl);

  t = new Trail();
  particles = new Particle[count];

  for (int i=0; i<count; i++) {
    float x = random(s_dist, w-s_dist);
    float y = random(s_dist, h-s_dist);

    PVector a = PVector.random2D();

/*
    while (dist(x, y, w/2, h/2) > h/4) {
      x = random(s_dist, w-s_dist);
      y = random(s_dist, h-s_dist); 
    }

    a = atan2(y-h/2,x-w/2);
*/
    particles[i] = new Particle(x, y, a);
  }
}

void draw() {
  t.Diffuse();
  t.Decay();

  if (iter % gap == 0) {
    t.Draw();
  };

  for (int i=0; i<count; i++) {
    particles[i].Turn();
    particles[i].Move();
    particles[i].Mark();
    //particles[i].Draw();
  }

  if (mousePressed) {
    int x = int(mouseX/scl);
    int y = int(mouseY/scl);

    for (int i=-3; i<4; i++) {
      for (int j=-3; j<4; j++) {
        t.map.add(c2i(x+i, y+j, w), 100);
      }
    }
  }

  println(frameRate);

  iter++;
}