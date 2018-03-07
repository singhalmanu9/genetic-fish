int numFish = 1;
int barrierW = 50;
int barrierH = 20;
int barrierX = 300;
int barrierY = 200;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  fill(50);
  rect(barrierX, barrierY, barrierW, barrierH);
}