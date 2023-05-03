class Error {
  float percent;
  float derivative;
  float integral = 0;

  float oldAngle;

  Error() {}

  void calc() {
    percent = rocket.rAngle;
    if (frameCount != 0) {
      derivative = rocket.rAngle - oldAngle;
    }
    integral += rocket.rAngle;

    oldAngle = rocket.rAngle;
  }

}