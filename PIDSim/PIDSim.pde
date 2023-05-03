Rocket rocket = new Rocket();
PID controller = new PID();
Error error = new Error();

color bgr = color(30, 30, 46);
color cBody = color(127, 132, 156);
color cNozzle = color(108, 112, 134);


void setup() {
  size(800, 800);
}

void draw() {
  background(bgr);

  error.calc();

  float a = controller.calc();
  rocket.setAngle(a);

  rocket.update();
  rocket.draw();

  println(frameCount, error.percent);
}
