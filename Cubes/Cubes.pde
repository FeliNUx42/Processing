int u = 40;
int cols;
int rows;
float prob = 0.5;
int interval = 60;

color bg = color(3,7,8);
color c0 = color(12,126,126);
color c1 = color(20,71,72);
color c2 = color(192,172,139);


void setup() {
  fullScreen(P2D);

  cols = width/u - 3;
  rows = height/u - 3;

  frameRate(20);
  create();
}

void create() {
  ArrayList<Block> blocks = new ArrayList<Block>();

  for (int y=rows-1; y>=0; y--) {
    for (int x=0; x<cols; x++) {
      boolean visible = random(1) < prob;
      Block b = new Block(x, y, visible);
      blocks.add(b);
    }
  }

  background(bg);
  for (Block b : blocks) {
    b.draw();
  }
}

void mousePressed() {
  prob = float(mouseX) / float(width);
  create();
}

void keyPressed() {
  if (keyCode != 32) return;
  prob = float(mouseX) / float(width);
  create();
}

void draw() {}