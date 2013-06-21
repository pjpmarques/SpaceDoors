
class Ship extends SpaceObject
{
  PImage spacecraft;
  
  Ship(String filename, int x, int y) {
    super(x, y, 0, 0);
    
    spacecraft = loadImage(filename);
    this.width = spacecraft.width;
    this.height = spacecraft.height;
  }
  
  void draw()
  {
    image(spacecraft, x, y);  
  }
}

