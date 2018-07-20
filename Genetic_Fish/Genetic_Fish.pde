FishPopulation f;
Obstacle[] walls = new Obstacle[2]; 
PVector goal = new PVector(1100, 400);

void setup() {
  size(1200, 800);
  
  f = new FishPopulation(1000);
  walls[0] = new Obstacle(600, 200, 10, 400);
  walls[1] = new Obstacle(900, 200, 10, 400);
  
}

void draw() {
  background(255);
  fill(0,255,0);
  ellipse(goal.x, goal.y, 10, 10);
  for (Obstacle o : walls) {
    o.show();
  }
  
  if (f.allDead()) {
    // do genetic alg
    f.calcFitness();
    f.naturalSelection();
    f.mutate();
  } else {
    f.update();
    f.show();
  }
  
  textSize(32);
  fill(0, 0, 0);
  text("" + f.gen, 50, 50);
}

float dist2(float x1, float y1, float x2, float y2) {
  return (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2);
}