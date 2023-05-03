class Rocket {
  // rocket attributes
  float rAngle = radians(45);
  float rAngularVel = 0;
  float rMMMOI = 0.001; // mass moment of inetrtia, randomly chosen

  // nozzle attributes
  float nAngle = 0;
  float maxAngle = radians(15); // max Rotation of nozzle, +/-

  // attributes for drawing
  float rLength = 200;
  float rWidth = 60;

  float nLength = 50;
  float nWidth = 20;
  float nRotPoint = 10;


  Rocket() {}

  void update() {
    float sideForce = sin(nAngle); // * thrust (but thrust = 1)
    float rAngularAcc = rMMMOI * sideForce;
    rAngularVel += rAngularAcc;

    rAngle -= rAngularVel;
  }

  void setAngle(float a) {
    nAngle = constrain(a, -maxAngle, maxAngle);
  }

  void draw() {
    float rX = -rWidth/2;
    float rY = -rLength/2;

    float nX = -nWidth/2;
    float nY = -nRotPoint;

    translate(400,400);

    rotate(rAngle);

      translate(0, -rY);
      rotate(nAngle);

      noStroke();
      fill(cNozzle);
      rect(nX, nY, nWidth, nLength);

      rotate(-nAngle);
      translate(0, rY);

    fill(cBody);
    rect(rX, rY, rWidth, rLength);
    triangle(rX, rY, rX+rWidth, rY, 0, rY-rWidth);

    fill(243, 139, 168);
    noStroke();
    circle(0,0,5);
  }
}