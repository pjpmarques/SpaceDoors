
abstract class SpaceObject
{
  int x, y;
  int width, height;
  boolean exists;
  
  SpaceObject(int x, int y, int width, int height) {
    this.x = x; 
    this.y = y;
    this.width = width;
    this.height = height;
    this.exists = true;
  }
  
  abstract void draw();
  
  boolean intercepts(SpaceObject other) {
    if ( (this.x < (other.x+other.width)) &&
         ((this.x+this.width) > other.x) &&
         (this.y < (other.y+other.height)) &&
         ((this.y+this.height) > other.y) &&
         exists)
      return true;
    else
      return false;    
  }
  
  void kill() {
    exists = false;
  }
  
  boolean isAlive() {
    return exists;
  }
}

