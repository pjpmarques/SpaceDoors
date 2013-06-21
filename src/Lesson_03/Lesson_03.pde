
int x = 600;
PImage ship;

void setup()
{
  size(800, 600);
  
  ship = loadImage("spacecraft.png");
}

void draw()
{
  background(0, 0, 255);        // Apaga o ecrã preenchendo com a cor de fundp  
  image(ship, x, 400);
  image(ship, x-100, 200);
  
  x = x-1;                      // Actualizo o x
}


