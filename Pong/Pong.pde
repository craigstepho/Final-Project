float p1, p2;
int p1Score, p2Score;
float ballX, ballY, dBX, dBY;
float ballD, paddleW, paddleH, paddleG;
boolean p1Up, p1Down, p2Up, p2Down;
boolean onePlayer;

void setup() {
  size(600, 500);
  frameRate(60);
  rectMode(CENTER);
  textSize(50);
  textAlign(CENTER);
  fill(255);

  p1 = height/2;
  p2 = height/2;
  ballX = width/2;
  ballY = height/2;
  dBX = random(2, 6);
  dBY = random(2, 6);
  ballD = 15;
  paddleW = 10;
  paddleH = 60;
  paddleG = 30;
}

void draw() {
  
  if (p1Up) {
    p1 -= 5;
  }
  if (p1Down) {
    p1 += 5;
  }
  if (p2Up) {
    p2 -= 5;
  }
  if (p2Down) {
    p2 += 5;
  }

  
  if (onePlayer) {
    p1 = ballY;
  }

  
  p1 = constrain(p1, paddleH/2, height - paddleH/2);
  p2 = constrain(p2, paddleH/2, height - paddleH/2);

  
  if (ballX - ballD/2 < 0) {
    p2Score += 1;
    ballX = width/2;
    ballY = height/2;
    dBX = random(2, 6);
    dBY = random(2, 6);
  }
  if (ballX + ballD/2 > width) {
    p1Score += 1;
    ballX = width/2;
    ballY = height/2;
    dBX = random(2, 6);
    dBY = random(2, 6);
  }

  if (ballY - ballD/2 < 0 || ballY + ballD/2 > height) {
    dBY = -dBY;
  }

  
  background(0);
  rect(paddleG, p1, paddleW, paddleH);
  rect(width-paddleG, p2, paddleW, paddleH);
  ellipse(ballX, ballY, ballD, ballD);

  
  text(p1Score, width/4, 50);
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
  onePlayer = !onePlayer;
  p1Score = 0;
  p2Score = 0;
}
