
PImage spacecraft;
int x, y;

void setup() {
  size(800, 600);

  spacecraft = loadImage("spacecraft.png");

  x = width - spacecraft.width/2;
  y = (int) random(0, height - spacecraft.height);
}

void drawWalls() {
  fill(255, 0, 0);
  rect(0, 0, 50, height/2 - spacecraft.height/2 - 10); 
  rect(0, height/2 + spacecraft.height/2 + 10, 50, height/2 - spacecraft.height/2 - 10);
}

void drawSpacecraft() {
  image(spacecraft, x, y);  
  x-= 1;
}

boolean hitWall() {
  if ((x <= 50) && (y < height/2 - spacecraft.height/2 - 10)) {
    return true;
  } else if ((x <= 50) && (y + spacecraft.height >= height/2 + spacecraft.height/2 + 10)) {
    return true;
  }
  else {
    return false;
  }
}

void draw() {
  background(0, 0, 255);
  
  drawWalls();    
  drawSpacecraft();

  if (hitWall()) {
    background(255, 0, 0);
    fill(255, 255, 255);
    textSize(50);
    String msg = "You crashed!"; 
    text(msg, width/2 - textWidth(msg)/2, height/2);
    noLoop();
  } else if (x < -spacecraft.width) {
    background(50, 200, 0);
    fill(255, 255, 255);
    textSize(50);
    String msg = "Well Done, Master Pilot!"; 
    text(msg, width/2 - textWidth(msg)/2, height/2);
    noLoop();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y -= 10;
    } else if (keyCode == DOWN) {
      y+= 10; 
    } else if (keyCode == LEFT) {
      x-= 10;
    } else if (keyCode == RIGHT) {
      x+= 10;
    }      
  }
}

