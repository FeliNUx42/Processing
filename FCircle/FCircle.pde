// controls
boolean speed = true;
boolean pause = true;
boolean hue = false;

boolean p = false;
float t = 0;

int r = 450;
int div = 80;
float incr = 0.5;

float f(float x) {
  //float y = x * t;
  //float y = x + (x % 25 + 1) * t;
  float y = x * sin(t*0.01)*(t+x);
  return y;
}

void setup() {
  size(1000,1000);
  background(0);

  if (hue) colorMode(HSB, 400);
}

void keyPressed() {
  if (keyCode != 32 || !pause) return;

  if (p) loop();
  else noLoop();

  p = !p;
}

void draw() {
  background(0);
  translate(width/2, height/2);

  for (int i = 0; i < div; ++i) {
    float ang0 = 2*i*PI/div;
    float ang1 = 2*f(i)*PI/div;

    if (hue) stroke(map(i,0,div,0,400), 400, 400);
    else stroke(255);

    line(sin(ang0)*r, cos(ang0)*r,
      sin(ang1)*r, cos(ang1)*r);
  }

  if (speed) t += incr * (2*mouseX-width)/width;
  else t += incr;

  noFill();
  if (hue) stroke(0,0,400);
  else stroke(255);
  circle(0,0, 2*r);
}