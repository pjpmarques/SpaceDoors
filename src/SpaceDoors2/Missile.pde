
class Missile extends SpaceObject
{
  Missile(int x, int y) {
    super(x, y, 0, 0);
      
    this.width = missile.width;
    this.height = missile.height;
  }
  
  void draw()
  {
    if (isAlive()) {
      image(missile, x, y);
    }
  }
}

