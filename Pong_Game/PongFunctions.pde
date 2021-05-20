void initializePaddles()  //enters x values into paddles relative screen size
{
  primary = new Paddle();
  primary.location= new PVector(width*.987, height/2);
  secondary = new Paddle();
  secondary.location = new PVector(width*.007, height/2);
}

void animatePaddles()  //creates the paddles and adds movement
{
  fill(0,255,255);
  rect(primary.location.x, primary.location.y, primary.paddleWidth, primary.paddleLength);
  rect(secondary.location.x, secondary.location.y, secondary.paddleWidth, secondary.paddleLength);
  primary.location.add(primary.direction);
  secondary.location.add(secondary.direction);
  if (ball.location.x+ball.diameter/2==primary.location.x-primary.paddleWidth/2 && ball.location.y>=primary.location.y-primary.paddleLength/2 && ball.location.y<=primary.location.y+primary.paddleLength/2)  
    ball.direction.x*=-1;  
    
}

void keyPressed()  //controls primary paddle
{
  if (key == CODED)
    if (keyCode == UP)
      primary.direction.y=-2;
    else if (keyCode == DOWN)
      primary.direction.y=2;
      
      if (key == CODED)
    if (keyCode == SHIFT)
      secondary.direction.y=-2;
    else if (keyCode == CONTROL)
      secondary.direction.y=2;
}

void keyReleased()
{
  primary.direction.y=0;
}
