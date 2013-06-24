
class MovingWall extends Wall
{
  MovingWall(int x, int y, int width, int height, boolean destructable) {
    super(x, y, width, height, destructable);
  }
  
  void draw() {
    super.draw();
    x = x + (int) random(3) - 1;
    y = y + (int) random(3) - 1;
  }
}           
