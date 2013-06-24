 
Ship spacecraft;
PImage rock;
PImage missile;

ArrayList<Missile> missiles;
ArrayList<Wall> walls;

color backgroundColor = color(0, 0, 255);
color wallColor = color(255, 0, 0);

boolean showScore = false;
boolean basicColor = true;
int score = 0;

void setup() {
  size(800, 600);

  spacecraft = new Ship("spacecraft.png", width, (int) random(height/4, height/2));
  rock = loadImage("rock.jpg");
  missile = loadImage("missile.png");

  missiles = new ArrayList<Missile>();
  walls = new ArrayList<Wall>();

  createWalls();  
}

void createWalls() {
  walls.add(new Wall(0, 0, 50, height/2 - spacecraft.height/2 - 10, false));
  walls.add(new Wall(0, height/2 + spacecraft.height/2 + 10, 50, height/2 - spacecraft.height/2 - 10, false));
}

void drawWalls() {
  fill(wallColor);
  for (Wall wall: walls) {
    wall.draw();
  }   
}

void drawSpacecraft() {
  spacecraft.draw();    
  spacecraft.x-= 1;
}

void drawMissiles() {
  for (Missile m: missiles)
  {
    m.draw();
    m.x-= 3;
    
    for (Wall w: walls) {
      if (m.intercepts(w) && w.isAlive()) {
        m.kill();
        w.kill();
        if (w.isDestructable())
          score+= 1000;
      }
    }
  }
}

boolean hitWall() {
  for (Wall w: walls) {
    if (w.intercepts(spacecraft) && w.isAlive()) {
      return true;
    }    
  }
  
  return false;
}

void drawScore() {
  if (showScore) {
    textAlign(RIGHT, TOP);
    textSize(20);
    fill(255, 255, 0);
    text("" + score, width-20, 20);
  }
}

void killDeadObjects() {
}

void endGameLoose() {
  background(255, 0, 0);
  fill(255, 255, 255);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("You crashed!", width/2, height/2);
  noLoop();
}

void endGameWin() {
  background(50, 200, 0);
  fill(255, 255, 255);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("Well Done, Master Pilot!", width/2, height/2);
  noLoop();  
}

void draw() {
  background(backgroundColor);
  
  drawWalls();    
  drawSpacecraft();
  drawMissiles();
  drawScore();
  killDeadObjects();
  
  if (hitWall()) {
    endGameLoose();
  } else if (spacecraft.x < -spacecraft.width) {
    endGameWin();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      spacecraft.y -= 10;
    } else if (keyCode == DOWN) {
      spacecraft.y+= 10; 
    } else if (keyCode == LEFT) {
      spacecraft.x-= 10;
    } else if (keyCode == RIGHT) {
      spacecraft.x+= 10;
    }      
  }
  else if (key == ' ') {
    missiles.add(new Missile(spacecraft.x, spacecraft.y+spacecraft.height/2 + 20));
  }
  else if (key == 'w') {
    walls.add(new Wall(350, 150, 60, 200, false));
    walls.add(new Wall(420, 150, 20, 200, true));       
    walls.add(new Wall(60, 50, 50, 50, false));
    walls.add(new Wall(700, 400, 50, 50, true));
    walls.add(new Wall(150, 50, 50, 50, true));
    
    for (int i=0; i<5; i++) {
      walls.add(new MovingWall(20+(i+1)*50, 450, 25, 25, true));
      walls.add(new MovingWall(45+(i+1)*50, 500, 25, 25, true));
    }
  }
  else if (key == 'c') {
    backgroundColor = color(0, 0, 0);
    showScore = true;
    basicColor = false;
  }
}

