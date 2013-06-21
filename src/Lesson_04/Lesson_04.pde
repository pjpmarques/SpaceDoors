
PImage ship;

void setup()
{
  size(800, 600);
  
  ship = loadImage("spacecraft.png");
}

void draw()
{
  background(0, 0, 255);  
  image(ship, width/2 - ship.width/2, height/2 - ship.height/2);
  
  fill(255, 0, 0);
  rect(0, 0, 50, height/2 - ship.height/2 - 10);
  
  fill(255, 0, 0);
  rect(0, height/2 + ship.height/2 + 10, 50, height/2 - ship.height/2 - 10);
}


