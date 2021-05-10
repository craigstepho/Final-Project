Ball ball;
Paddle primary, secondary;

void setup()
{
  size(1000, 500);
  background(0);
  smooth();
  frameRate(300);
  ball = new Ball();
  initializePaddles();  // enters x values into primary and secondary paddles
}
void draw()
{
  ball.animateBall();  //uses vectors to add movements to ball, also checks if hitting walls
  animatePaddles();  //adds movements to paddles
}
