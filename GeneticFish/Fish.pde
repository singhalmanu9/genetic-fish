class Fish{
  
  PVector pos;
  float angle;
  int size;
  
  float[] dna = new float[1000];
  boolean dead = false;
  boolean hit = false;
  boolean food = false;
  
  float closest = -1;
  float fitness = 0;
  
  int curr = 0;
  
  Fish() {
    pos = new PVector(100, 500);
    angle = 0;
    size = 20;
    for(int i = 0; i < dna.length; i++) {
      dna[i] = random(2*PI);
    }
  }
  
  void move() {
    if (dead) {
      calcFitness();
    } else {
      if (curr < dna.length) {
        PVector next = PVector.fromAngle(angle).mult(10);
        pos.add(next);
        angle = dna[curr];
        curr += 1;
      } else {
        dead = true;
      }
      
      hitWall();
      foundFood();
      float d = dist2(pos.x, pos.y, foodX, foodY);
      closest = (closest != -1) ? min(closest, d) : d;
      
      if (pos.y < 0 || pos.y > width) {
        angle = -angle;
      }
    }
    
  }
  
  void calcFitness() {
    if (hit) {
      fitness = -1;
    }
    fitness = closest;
  }
  
  void hitWall() {
    if (pos.x < 0 || (pos.x > barrierX && pos.x < barrierX + barrierW
      && pos.y > barrierY && pos.y > barrierY + barrierH)) {
      dead = true;
      hit = true;
    }
  }
  
  void foundFood() {
    if (dist2(pos.x, pos.y, foodX, foodY) < 100) {
      food = true;
      dead = true;
    }
  }
  
  void printDNA() {
    for(float f: dna) {
      print(f + " ");
    }
  }
  
  void show() {
    if(!dead) {
      pushMatrix();
      fill(150, 150, 0, 200);
      noStroke();
      translate(pos.x, pos.y);
      rotate(angle);
      ellipse(-size*1, 0, size*2, size);
      fill(255, 200);
      ellipse(-size/3, 0, 5, 5);
      popMatrix();
    }
  }
}