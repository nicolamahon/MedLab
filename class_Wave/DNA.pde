class Wave
{
  int xspacing;   // How far apart should each horizontal location be spaced
  int w;              // Width of entire wave
  
  float theta = 0;  // Start angle at 0
  float amplitude;  // Height of wave
  float period;  // How many pixels before the wave repeats
  float dx;  // Value for incrementing X, a function of period and xspacing
  float[] yvalues;  // Using an array to store height values for the wave
  int c;
  
  Wave(int c)
  {
    xspacing = 16;
    w = width+16;
    theta = 0.0;
    amplitude = 85.0;
    period = 500;
    dx = (TWO_PI / period) * xspacing;
    yvalues = new float[w/xspacing];
    this.c = c;
  }

  void render() 
  {
    background(0);
    calcWave();
    drawGrid();
    fill(c, 0, 0);
    renderWave1();
    
    pushMatrix();
    translate(0, 50);
    fill(0, c, 0);
    renderWave1();
    popMatrix();
    
    pushMatrix();
    translate(0, -50);
    fill(0, 0, c);
    renderWave1();
    popMatrix();
    
    drawEndBars();
    
  }

  void calcWave() 
  {
    // Increment theta (try different values for 'angular velocity' here
    theta += 0.3;
  
    // For every x value, calculate a y value with sine function
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) 
    {
      yvalues[i] = sin(x)*amplitude;
      x+=dx;
    }
  }

  void renderWave1() 
  {
    noStroke();
    // A simple way to draw the wave with an ellipse at each location
    for (int x = 0; x < yvalues.length; x++) 
    {
      ellipse(x*xspacing, height/2+yvalues[x], 16, 16);
    }
  }

  void drawGrid()
  {
    strokeWeight(8);
    stroke(125, 0, 125);
    line(0, 25, width, 25);
    line(0, 325, width, 325);
    strokeWeight(4);
    for(int y=50; y<=300; y+=25)
    {
      line(0, y, width, y);
    }
  }

  void drawEndBars()
  {
    strokeWeight(55);
    stroke(0, 125, 0);
    line(0, 25, 0, 325);
    line(width, 25, width, 325);
  }

}