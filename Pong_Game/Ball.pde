class Ball
{
  PVector location, direction;
  final int diameter = height/20;
  Ball()
  {
    location = new PVector(width/2, height/2);
    direction = new PVector(0.5, 0.5);
  }
  void animateBall()  //movement to balls and checking if hitting walls
  {
    background(0);
    fill(255, 0, 255);
    circle(location.x, location.y, diameter);
    location.add(direction);
    if (location.y+diameter/2>= height|| location.y<=diameter/2)
      direction.y*=-1;
  }
}
