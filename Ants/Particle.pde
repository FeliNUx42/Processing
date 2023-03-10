class Particle {
  PVector pos, dir;

  Particle(float x, float y, PVector _dir) {
    pos = new PVector(x, y);
    dir = _dir;
  }

  void Move() {
    PVector displacemet = PVector.mult(dir, vel);
    pos.add(dir);

    float angle = -10;

    if (pos.x < s_dist) {
      pos.x = s_dist;
      angle = random(-TWO_PI/8, TWO_PI/8);
    } else if (pos.x >= w-s_dist) {
      pos.x = w-s_dist-1;
      angle = PI + random(-TWO_PI/8, TWO_PI/8);
    } if (pos.y < s_dist) {
      pos.y = s_dist;
      angle = PI/2 + random(-TWO_PI/8, TWO_PI/8);
    } else if (pos.y >= h-s_dist) {
      pos.y = h-s_dist-1;
      angle = 3*PI/2 + random(-TWO_PI/8, TWO_PI/8);
    }

    if (angle != -10) dir = PVector.fromAngle(angle);
  }

  void Turn() {
    PVector dir0 = dir.copy().mult(s_dist);
    PVector dir1 = dir.copy().rotate(s_angle).mult(s_dist);
    PVector dir2 = dir.copy().rotate(-s_angle).mult(s_dist);

    PVector p0 = PVector.add(pos, dir0);
    PVector p1 = PVector.add(pos, dir1);
    PVector p2 = PVector.add(pos, dir2);

    float v0 = t.map.get(c2i(int(p0.x), int(p0.y), w));
    float v1 = t.map.get(c2i(int(p1.x), int(p1.y), w));
    float v2 = t.map.get(c2i(int(p2.x), int(p2.y), w));

    if (v0 >= v1 && v0 >= v2) return;
    if (v1 == v2) v2 += random(-1, 1);

    if (v1 > v2) dir.rotate(random(ang_vel_min, ang_vel_max));
    else dir.rotate(-random(ang_vel_min, ang_vel_max));
  }

  void Mark() {
    int x = int(pos.x);
    int y = int(pos.y);

    t.map.add(c2i(x, y, w), weight);
  }

  void Draw() {
    fill(255, 100);
    noStroke();
    ellipse(pos.x*scl, pos.y*scl, scl*2, scl*2);
  }
}