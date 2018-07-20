class Obstacle {
  
  float x;
  float y;
  float w;
  float h;
  
  Obstacle(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void show() {
    fill(0);
    rect(x, y, w, h);
  }
  
  boolean checkInside(Fish f) {
    return (f.pos.x > x && f.pos.x < x+w && f.pos.y > y && f.pos.y < y+h);
  }
}