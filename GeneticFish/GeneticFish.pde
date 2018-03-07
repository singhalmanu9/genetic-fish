int numFish = 10;
int barrierW = 50;
int barrierH = 300;
int barrierX = 700;
int barrierY = 350;

int foodX = 900;
int foodY = 500;

ArrayList<Fish> fishes = new ArrayList<Fish>();

void setup() {
  size(1000, 1000);
  for(int i = 0; i < numFish; i ++) {
    fishes.add(new Fish()); 
  }
}

void draw() {
  background(50, 50, 150);
  fill(151);
  rect(barrierX, barrierY, barrierW, barrierH);
  
  for(Fish f: fishes) {
    if (!f.dead) {
      f.show(); 
      f.move();
    }
  }
  
  fill(0, 255, 0, 100);
  ellipse(foodX, foodY, 20, 20);
}