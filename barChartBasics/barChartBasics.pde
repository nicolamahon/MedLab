void setup()
{
  size(500, 500);
  background(255);
}
 
void draw()
{
  
  
  noStroke();
  fill(255,0,0);
  rect(75, 50, 25, 100);
  fill(0,255,0);
  rect(100, 30, 25, 120);
  fill(0,0,255);
  rect(125, 70, 25, 80);
  fill(255,255,0);
  rect(150, 60, 25, 90);
  fill(153,0,153);
  rect(175, 90, 25, 60);
  fill(255,128,0);
  rect(200, 50, 25, 100);
  
  strokeWeight(5);
  stroke(0, 125, 0);
  line(50, 150, 250, 150);
  line(50, 150, 50, 20);
  line(50, 20, 250, 20);
  line(250, 20, 250, 150);
}