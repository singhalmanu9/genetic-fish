class FishBrain {
  PVector[] directions;
  int step = 0;
  
  FishBrain(int size) {
    directions = new PVector[size];
    for (int i = 0; i < directions.length; i ++) {
      PVector v = PVector.fromAngle(random(0, 2*PI));
      directions[i] = v;
    }
  }
  
  FishBrain clone() {
    FishBrain newBrain = new FishBrain(directions.length);
    for (int i = 0; i < directions.length; i++)
      newBrain.directions[i] = directions[i].copy();
    return newBrain;
  }
  
  void mutate() {
    float mutRate = .01;
    for (int i = 0; i < directions.length; i ++) {
      if (random(1) < mutRate) {
        directions[i] = PVector.fromAngle(random(2*PI));
      }
    }
  }
}