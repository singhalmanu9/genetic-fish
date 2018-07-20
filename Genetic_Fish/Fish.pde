class Fish {
  PVector pos;
  PVector vel;
  PVector acc;
  FishBrain brain;
  
  boolean dead = false;
  float fitness = 0;
  boolean reachedGoal = false;
  
  Fish() {
    pos = new PVector(50, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    brain = new FishBrain(300);
  }
  
  void show() {
    fill(0, 0, 255, 10);
    ellipse(pos.x, pos.y, 5, 5);
  }
  
  void move() {
    if (brain.step < brain.directions.length) {
      acc = brain.directions[brain.step];
      brain.step ++;
    } else {
      dead = true;
    }
    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
  }
  
  void update() {
    if (!dead && !reachedGoal) {
      move();
      if (pos.x < 2 || pos.x > width-2 || pos.y < 2 || pos.y > height-2)
        dead = true;
      else if (dist2(pos.x, pos.y, goal.x, goal.y) < 100)
        reachedGoal = true;
      else if (checkCollision(walls))
      dead = true;
    }
  }
  
  boolean checkCollision(Obstacle[] walls) {
    boolean hit = false;
    for (Obstacle w : walls)
      hit = hit || w.checkInside(this);
    return hit;
  }
  
  void calcFitness() {
    if (reachedGoal)
      fitness = 1.0/16 + 1000.0/(brain.step*brain.step);
    else {
      float distanceToGoal = dist2(pos.x, pos.y, goal.x, goal.y);
      fitness = 1.0/distanceToGoal;
    }
  }
}