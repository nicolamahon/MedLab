void setup()
{
  size(800, 600); 
}

void draw()
{
  strokeWeight(3);
  // top-left grid
  line(300, 0, 300, 100);
  line(300, 100, 200, 200);  
  line(200, 200, 0, 200);
  
  // top-right grid
  line(500, 0, 500, 100);
  line(500, 100, 600, 200);  
  line(600, 200, width, 200); 
  
  // bottom-left grid
  line(0, 400, 200, 400);
  line(200, 400, 300, 500);  
  line(300, 500, 300, height);
  
  // bottom-right grid
  line(width, 400, 600, 400);
  line(600, 400, 500, 500);  
  line(500, 500, 500, height); 
}