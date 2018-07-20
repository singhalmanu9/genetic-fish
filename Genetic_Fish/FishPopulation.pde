class FishPopulation {
  Fish[] fishes;
  int gen = 1;
  
  FishPopulation(int numFishes) {
    fishes = new Fish[numFishes];
    for (int i = 0; i < numFishes; i ++) {
      fishes[i] = new Fish();
    }
  }
  
  void show() {
    for (Fish f : fishes)
      f.show();
  }
  
  void update() {
    for (Fish f : fishes)
      f.update();
  }
  
  void calcFitness() {
    for (Fish f : fishes) 
      f.calcFitness();
  }
  
  boolean allDead() {
    for (Fish f : fishes) {
      if (!f.dead && !f.reachedGoal)
        return false;
    }
    return true;
  }
  
  void naturalSelection() {
    Fish[] newFishes = new Fish[fishes.length];
    for (int i = 0; i < newFishes.length; i ++) {
      Fish parent = selectParent();
      Fish child = new Fish();
      child.brain = parent.brain.clone();
      newFishes[i] = child;
    }
    fishes = newFishes.clone();
    gen ++;
  }
  
  void mutate() {
    for (Fish f : fishes)
      f.brain.mutate();
  }
  
  Fish selectParent() {
    float fitnessSum = 0;
    for (Fish f : fishes)
      fitnessSum += f.fitness;
      
    float rand = random(fitnessSum);
    float curr = 0;
    for (int i = 0; i < fishes.length; i ++) {
      curr += fishes[i].fitness;
      if (curr > rand) {
        return fishes[i];
      }
    }
    return null;
  }
}