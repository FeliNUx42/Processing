class PID {
  float kp, kd, ki;

  PID() {}

  float calc() {
    kp = 1;
    kd = 30;
    ki = 0.001;

    return error.percent*kp + error.derivative*kd + error.integral*ki;
  }

  float calcV0() {
    kp = radians(15);

    if (error.percent > 0) return kp;
    if (error.percent < 0) return -kp;
    return 0;
  }

  float calcV1() {
    kp = 1;
    
    return error.percent * kp;
  }

  float calcv2() {
    kp = 1;
    kd = 20;

    return error.percent*kp + error.derivative*kd;
  }
}
