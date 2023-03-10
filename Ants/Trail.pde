class Trail {
  FloatList map;

  Trail () {
    map = new FloatList();

    for (int i=0; i<w*h; i++) {
      map.append(0);
    }    
  }

  void Diffuse() {
    FloatList map0 = map.copy();

    for (int i=0; i<w; i++) {
      for (int j=0; j<h; j++) {

        float sum = 0;

        for (int k=-1; k<2; k++) {
          for (int l=-1; l<2; l++) {
            if (k == 0 && l == 0) continue;

            int x = i + k;
            int y = j + l;

            if (x < 0) x = 0;
            if (x >= w) x = w-1;
            if (y < 0) y = 0;
            if (y >= h) y = h-1;

            sum += map0.get(c2i(x, y, w));
          }
        }

        int index = c2i(i, j, w);
        float val = map0.get(index) * (1-diff) + sum/8*diff;

        map.set(index, val);
      }
    }
  }

  void Decay() {
    for (int i=0; i<w*h; i++) {
      map.mult(i, dec);
    }
  }

  void Draw() {
    loadPixels();
    for (int i=0; i<w; i++) {
      for (int j=0; j<h; j++) {
        int index = c2i(i, j, w);
        float val = map.get(index);

        for (int dx=0; dx<scl; dx++) {
            for (int dy=0; dy<scl; dy++) {
            index = c2i(i*scl+dx, j*scl+dy, width);

            pixels[index] = color(val*255);
          }
        }
      }
    }
    updatePixels();
  }
}