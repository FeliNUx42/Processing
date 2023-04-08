float[][] gridA;
float[][] gridB;
float[][] nextA;
float[][] nextB;

float t = 1;
float dA = 1;
float dB = 0.5;
float f = 0.005; // 0.055, 0.025, 0.01
float k = 0.042; // 0.062, 0.058, 0.045

void setup() {
  size(400, 400, P2D);
  frameRate(240);

  gridA = new float[width][height];
  gridB = new float[width][height];
  nextA = new float[width][height];
  nextB = new float[width][height];

  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      gridA[x][y] = 1;
      gridB[x][y] = 0;

      nextA[x][y] = 1;
      nextB[x][y] = 0;
    }
  }

  for (var i=195; i<205; i++) {
    for (var j=195; j<205; j++) {
      gridB[i][j] = 1;
    }
  }

}

void draw() {
  for (int x=1; x<width-1; x++) {
    for (int y=1; y<height-1; y++) {
      float a = gridA[x][y];
      float b = gridB[x][y];

      nextA[x][y] = a +
        (dA * laplaceA(x, y) -
        a * b * b +
        f * (1 - a)) * t;
      nextB[x][y] = b +
        (dB * laplaceB(x, y) +
        a * b * b -
        (k + f) * b) * t;

      nextA[x][y] = constrain(nextA[x][y], 0, 1);
      nextB[x][y] = constrain(nextB[x][y], 0, 1);
    }
  }


  loadPixels();
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      int pix = x + y * width;
      float a = nextA[x][y];
      float b = nextB[x][y];
      int c = floor((a - b) * 255);
      c = constrain(c, 0, 255);

      pixels[pix] = color(c);
    }
  }
  updatePixels();

  swap();
}


float laplaceA(int x, int y) {
  float sumA = 0;

  sumA += gridA[x][y] * -1;
  sumA += gridA[x-1][y] * 0.2;
  sumA += gridA[x+1][y] * 0.2;
  sumA += gridA[x][y+1] * 0.2;
  sumA += gridA[x][y-1] * 0.2;
  sumA += gridA[x-1][y-1] * 0.05;
  sumA += gridA[x+1][y-1] * 0.05;
  sumA += gridA[x+1][y+1] * 0.05;
  sumA += gridA[x-1][y+1] * 0.05;

  return sumA;
}

float laplaceB(int x, int y) {
  float sumB = 0;

  sumB += gridB[x][y] * -1;
  sumB += gridB[x-1][y] * 0.2;
  sumB += gridB[x+1][y] * 0.2;
  sumB += gridB[x][y+1] * 0.2;
  sumB += gridB[x][y-1] * 0.2;
  sumB += gridB[x-1][y-1] * 0.05;
  sumB += gridB[x+1][y-1] * 0.05;
  sumB += gridB[x+1][y+1] * 0.05;
  sumB += gridB[x-1][y+1] * 0.05;

  return sumB;
}

void swap() {
  float[][] tempA = gridA;
  float[][] tempB = gridB;

  gridA = nextA;
  gridB = nextB;

  nextA = tempA;
  nextB = tempB;
}