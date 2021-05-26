# Pong
# By: Craig Stephenson
# A ping pong game with colors and points
<img width="594" alt="Screen Shot 2021-05-26 at 12 49 20 PM" src="https://user-images.githubusercontent.com/70344786/119715414-378b3400-be21-11eb-9ca3-1d7285063bc3.png">
 float p1, p2;
int p1Score, p2Score;
float ballX, ballY, dBX, dBY;
float ballD, paddleW, paddleH, paddleG;
boolean p1Up, p1Down, p2Up, p2Down;


void setup() {
  size(600, 500);
  frameRate(60);
  rectMode(CENTER); 
  textSize(50);
  textAlign(CENTER);
  

  p1 = height/2;
  p2 = height/2;
  ballX = width/2;
  ballY = height/2;
  dBX = (5);
  dBY = (5);
  ballD = 15;
  paddleW = 10;
  paddleH = 60;
  paddleG = 30;
}

void draw() {
 
  
  if (p1Up) {
    p1 -= 10;
  }
  if (p1Down) {
    p1 += 10;
  }
  if (p2Up) {
    p2 -= 10;
  }
  if (p2Down) {
    p2 += 10;
  }


  
  p1 = constrain(p1, paddleH/2, height - paddleH/2);
  p2 = constrain(p2, paddleH/2, height - paddleH/2);

  
  if (ballX - ballD/2 < 0) {
    p2Score += 1;
    ballX = width/2;
    ballY = height/2;
    dBX = (5);
    dBY = (5);
  }
  if (ballX + ballD/2 > width) {
    p1Score += 1;
    ballX = width/2;
    ballY = height/2;
    dBX =(5);
    dBY =(5);
  }

  if (ballY - ballD/2 < 0 || ballY + ballD/2 > height) {
    dBY = -dBY;
  }

  
  background(0);
  fill(255,0,0);
  rect(paddleG, p1, paddleW, paddleH);
  fill(0,255,0);
  rect(width-paddleG, p2, paddleW, paddleH);
  fill(#16C8F2);
  ellipse(ballX, ballY, ballD, ballD);

  fill(255,0,0);
  text(p1Score, width/4, 50);
  fill(0,255,0);
  text(p2Score, 3*width/4, 50);

  
  ballX += dBX;
  ballY += dBY;

  //Checks if ball hit paddles
  if ((ballX - ballD/2 <= paddleG + paddleW/2) && (ballY + ballD/2 >= p1 - paddleH/2) && (ballY - ballD/2 <= p1 + paddleH/2)) {
    dBX = -dBX;
  }
  if ((ballX + ballD/2 >= width - paddleG - paddleW/2) && (ballY + ballD/2 >= p2 - paddleH/2) && (ballY - ballD/2 <= p2 + paddleH/2)) {
    dBX = -dBX;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      p2Up = true;
    }
    if (keyCode == DOWN) {
      p2Down = true;
    }
  } else {
    if (key == 'w') {
      p1Up = true;
    }
    if (key == 's') {
      p1Down = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      p2Up = false;
    }
    if (keyCode == DOWN) {
      p2Down = false;
    }
  } else {
    if (key == 'w') {
      p1Up = false;
    }
    if (key == 's') {
      p1Down = false;
    }
  }
}

void mousePressed() {
  p1Score = 0;
  p2Score = 0;
  }
 
 
 # Cars
 <img width="1000" alt="Screen Shot 2021-05-26 at 1 12 01 PM" src="https://user-images.githubusercontent.com/70344786/119717790-019b7f00-be24-11eb-8b92-e2860168d874.png">
Car Mustang, Mustang2;
Car[] cars = new Car[200];

void setup() {
  size(1000, 1000);
  Mustang = new Car(color(random(255), random(255), random(255)), random(1, 5));
  Mustang2 = new Car(color(random(255), random(255), random(255)), random(1, 5));
  for (int i=0; i<cars.length; i++) {
    cars[i] = new Car(color(random(255), random(255), random(255)), random(1, 5));
  }
}

void draw() {
  background(100);
  Mustang.display();
  Mustang.drive();
  Mustang2.display();
  Mustang2.drive();
  for (int i=0; i<cars.length; i++) {
    cars[i].display();
    cars[i].drive();
  }
}

# Space Game
<img width="499" alt="Screen Shot 2021-05-26 at 1 21 27 PM" src="https://user-images.githubusercontent.com/70344786/119718935-6a372b80-be25-11eb-88eb-89ab36e4556b.png">


// Space Game | Dec 2020
// By: Craig Stephenson
// To Do: Project Setup

SpaceShip s1;
ArrayList<Laser> lasers;
ArrayList<Asteroid> asteroids;
ArrayList<Star> stars;
Timer timer;

void setup() {
  size(500, 500);
  s1 = new SpaceShip(#56BFF2);
  lasers = new ArrayList();
  asteroids = new ArrayList();
  stars = new ArrayList();
  timer = new Timer(int(random(1000, 3000)));
  timer.start();
}

void draw() {
  background(0);
  noCursor();

  stars.add(new Star(int(random(width)), int(random(height))));
  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.reachedBottom()) {
      stars.remove(star);
    }
  }

  if (timer.isFinished()) {
    asteroids.add(new Asteroid(int(random(width)), -50));
    timer.start();
  }

  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid asteroid = asteroids.get(i);
    asteroid.display();
    asteroid.move();
    if (asteroid.reachedBottom()) {
      asteroids.remove(asteroid);
    }
  }

  for (int i = 0; i < lasers.size(); i++) {
    Laser laser = lasers.get(i);
    laser.display();
    laser.fire();
    if (laser.reachedTop()) {
      lasers.remove(laser);
    }
  }

  infoPanel();

  s1.display(mouseX, mouseY);
}

void mousePressed() {
  if (s1.ammo>0) {
    lasers.add(new Laser(s1.x, s1.y));
  }
  s1.ammo--;
}

void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(0, height-50, width, 50);
  fill(255, 128);
  text("Health:" + s1.health, 20, height-20);
  text("Lives:" + s1.lives, 100, height-20);
  text("Ammo:" + s1.ammo, 160, height-20);
  text("Level:", 260, height-20);
  text("Score:", 320, height-20);
}


# EtchASketch
![line-000800](https://user-images.githubusercontent.com/70344786/119719071-905ccb80-be25-11eb-9c08-ca392af43602.png)

// Global Variable
int x, y;

void setup() {
  size(1000, 1000);
  frameRate(10);
  x = 10;
  y = 10;
}

void draw() {
  fill(0);
  strokeWeight(3);
  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      moveRight(10);
    } else if (key == 'a' || key == 'A') {
      moveLeft(10);
    } else if (key == 's' || key == 'S') {
      moveDown(10);
    } else if (key == 'w' || key == 'W') {
      moveUp(10);
    }
  }
}

void mousePressed() {
  saveFrame("line-######.png");
}

void drawName() {
  moveRight(10);
  moveDown(10);
  moveLeft(10);
  moveUp(10);
}

// Method to draw right line
void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x = x+rep;
}


// Method to draw lines dowm
void moveDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y+i);
  }
  y=y+rep;
}

// Method to draw left line
void moveLeft(int rep) {
  for (int i =0; i<rep; i++) {
    point(x-i, y);
  }
  x= x - rep;
}

// Method to draw lines up
void moveUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y-i);
  }
  y = y-rep;
}

// Method move downLeft

# Calculator
<img width="398" alt="Screen Shot 2021-05-26 at 1 24 08 PM" src="https://user-images.githubusercontent.com/70344786/119719202-bc784c80-be25-11eb-8a5a-8ce64f3dd2e7.png">

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];
String dVal = "0.0";

void setup() {
  size(400, 400);
  numButtons[0] = new Button(10, 10, 40, 40, "6", true);
  numButtons[1] = new Button(60, 10, 40, 40, "7", true);
  numButtons[2] = new Button(110, 10, 40, 40, "8", true);
  numButtons[3] = new Button(160, 10, 40, 40, "9", true);
  numButtons[4] = new Button(10, 60, 40, 40, "2", true);
  numButtons[5] = new Button(60, 60, 40, 40, "3", true);
  numButtons[6] = new Button(110, 60, 40, 40, "4", true);
  numButtons[7] = new Button(160, 60, 40, 40, "5", true);
  numButtons[8] = new Button(160, 110, 40, 40, "1", true);
  numButtons[9] = new Button(10, 110, 140, 40, "0", true);
  opButtons[0] = new Button(210, 10, 40, 40, ".", false);
  opButtons[1] = new Button(210, 60, 40, 40, "/", false);
  opButtons[2] = new Button(260, 10, 40, 40, "?", false);
  opButtons[3] = new Button(310, 10, 40, 40, "?", false);
  opButtons[4] = new Button(260, 60, 40, 40, "-", false);
  opButtons[5] = new Button(310, 60, 40, 40, "?", false);
  opButtons[6] = new Button(210, 110, 40, 40, "=", false);
  opButtons[7] = new Button(260, 110, 40, 40, "+", false);
  opButtons[8] = new Button(310, 110, 40, 40, "?", false);
  opButtons[9] = new Button(210, 160, 80, 40, "+", false);
  opButtons[10] = new Button(210, 210, 80, 40, "-", false);
  opButtons[11] = new Button(310, 160, 40, 80, "C", false);
  opButtons[12] = new Button(210, 10, 40, 40, "*", false);
}

void draw() {
  background(85);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover();
  }
  updateDisplay();
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hover) {
      dVal += numButtons[i].val;
    }
  }
}

void updateDisplay() {
  fill(255, 0, 255);
  rect(10, 160, 170, 60);
  fill(0);
  text(dVal, 70, 210);
}

void performCalculation() {
}

 
    
