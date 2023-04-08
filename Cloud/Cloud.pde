int unit = 90;

ArrayList<Section> sections = new ArrayList<Section>();

void setup() {
  //size(1000,1000);
  fullScreen(P2D);

  for (float x=0; x<width/unit; x++) {
    for (float y=0; y<height/unit; y++) {
      Section s = new Section(x, y);
      sections.add(s);
    }
  }
}

void mousePressed() {
  sections = new ArrayList<Section>();
  unit = int(map(mouseX, 0, width, 20, width/8));

  for (float x=0; x<width/unit; x++) {
    for (float y=0; y<height/unit; y++) {
      Section s = new Section(x, y);
      sections.add(s);
    }
  }
}

void draw() {
  background(0);

  float[] distMap = new float[width*height];
  float maxDist = 0;

  for (Section s : sections) {
    ArrayList<Section> neightbours = s.Neightbours();

    for (int x=0; x<unit; x++) {
      for (int y=0; y<unit; y++) {
        PVector off = new PVector(x, y);
        PVector pos = PVector.add(PVector.mult(s.section, unit), off);

        float dist = 10000;
        for (Section n : neightbours) {
          float _dist = PVector.dist(pos, n.pos);
          if (_dist < dist) dist = _dist;
        }

        distMap[int(pos.x+pos.y*width)] = dist;
        if (dist > maxDist) maxDist = dist;
      }
    }
  }

  loadPixels();
  for (int i=0; i<width*height; i++) {
    float dist = distMap[i];
    if (dist == 0.0) dist = maxDist;

    pixels[i] = color(255-dist/maxDist*255);
  }
  updatePixels();

  println(frameRate);
}