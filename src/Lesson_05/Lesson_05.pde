
PImage ship;
int x;
int y;

void setup()
{
  size(800, 600);  
  ship = loadImage("spacecraft.png");
  
  x = width - ship.width;
  y = (int) random(0, height - ship.height);
}

void drawShip()
{
  image(ship, x, y);
  x = x - 1;
}

void drawWalls()
{
  fill(255, 0, 0);
  rect(0, 0, 50, height/2 - ship.height/2 - 10);
  
  fill(255, 0, 0);
  rect(0, height/2 + ship.height/2 + 10, 50, height/2 - ship.height/2 - 10);
}

void draw()
{
  background(0, 0, 255);  
  
  drawWalls();
  drawShip();    
}


