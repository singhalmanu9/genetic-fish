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

float dist2(float x1, float y1, float x2, float y2) {
  return (x1-x2)*(x1-x2)+(y1-y2)*(y1-y2);
}

ArrayList<Fish> newPop(ArrayList<Fish> fish) {
  ArrayList<Fish> newFish = new ArrayList<Fish>();
  
  float total = 0;
  for (Fish f : fish) {
    total += max(f.fitness, 0);
  }
  
  for (int i = 0; i < numFish; i ++) {
    Fish child  = new Fish();
    // finish this lmao
    
    float rand = random(total);
    float fitSel = 0;
    for (Fish parent : fish) {
      fitSel += parent.fitness;
      if (fitSel > rand) {
        child.dna = parent.dna;
      }
    }
    newFish.add(child);
  }
  return newFish;
}

void draw() {
  background(50, 50, 150);
  fill(151);
  rect(barrierX, barrierY, barrierW, barrierH);
  
  boolean allDead = true;
  for(Fish f: fishes) {
    if (!f.dead) {
      allDead = false;
      f.show(); 
      f.move();
    }
  }
  
  if (allDead) {
    fishes = newPop(fishes);
  }
  
  fill(0, 255, 0, 100);
  ellipse(foodX, foodY, 20, 20);
}