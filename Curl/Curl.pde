float s = 0.0075;
float delta = 0.01;
float vel = 0.2;

int gap = 10;
int diam = 1;

ArrayList<Particle> particles = new ArrayList<Particle>();


void setup() {
  size(600, 600);
  background(0);
  noiseSeed(1);
  frameRate(240);

  for (int y=gap; y<width; y+=gap) {
    for (int x=gap; x<width; x+=gap) {
      Particle p = new Particle(x, y);
      particles.add(p);
    }
  }
}

void draw() {
  fill(0,0,0,1);
  rect(0,0,width,height);
  /*
    loadPixels();
    
    for (float y=0; y<width; y++) {
      for (float x=0; x<width; x++) {
        float n = noise(x*s, y*s);
        pixels[int(x + y*width)] = color(n*255);;
      }
    }

    updatePixels();
  */

  for (Particle p : particles) {
    p.move();
    p.draw();
  }

  /*
    PVector dir = curl(mouseX, mouseY);

    stroke(255,0,0);
    strokeWeight(2);
    line(mouseX, mouseY, mouseX+dir.x*40, mouseY+dir.y*40);

    stroke(0,0,255);
    strokeWeight(1);
    line(mouseX, mouseY, mouseX+dir.y*40, mouseY-dir.x*40);
  */

  println(frameRate);
}