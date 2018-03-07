class Fish{
  
  PVector pos;
  float angle;
  int size;
  
  float[] dna = new float[1000];
  boolean dead = false;
  boolean hit = false;
  
  int curr = 0;
  
  Fish() {
    pos = new PVector(100, 500);
    angle = 0;
    size = 20;
    for(int i = 0; i < dna.length; i++) {
      dna[i] = random(2*PI);
    }
  }
  
  void onDead() {
    if (hit) {
      println("I hit a wall");
    } else {
      println("I made it to the end!");
    }
  }
  
  void move() {
    if (dead) {
      onDead();
    } else {
      if (curr < dna.length) {
        PVector next = PVector.fromAngle(angle).mult(10);
        pos.add(next);
        angle = dna[curr];
        curr += 1;
      } else {
        dead = true;
        onDead();
      }
      
      if (pos.x < 0) {
        dead = true;
        hit = true;
        onDead();
      }
      
      if (pos.y < 0 || pos.y > width) {
        angle = -angle;
      }
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