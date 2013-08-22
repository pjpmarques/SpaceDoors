class Wall extends SpaceObject
{
  boolean destructable;  
  int lives;
  
  Wall(int x, int y, int width, int height, boolean destructable) {
    super(x, y, width, height);
    this.destructable = destructable; 
    this.exists = true;
    this.lives = 4;
  }
  
  void draw()
  {
    if (isAlive()) {
      if (destructable) {
        fill(255, 255, 0);
        noStroke();
      }
      else {
        stroke(255, 0, 0);
        fill(255, 0, 0);
      }    
      
      if (!basicColor) {
        noFill();
        image(rock, x, y, this.width, this.height);
      }      
      rect(x, y, this.width, this.height);
    }
  }
  
  void kill() {
    if (destructable) {    
      lives-= 1;
      if (lives <= 0)
        this.exists = false;
    }
  }
  
  boolean isDestructable() {
    return destructable;
  }
}

