class ECG
{
  float posY = height/2;
  float amplitude = 40;
  float variationY;
  float variationY2;
  float temps = 0;
  float WaveSpeed; 
  float completeCycle;
  float subCycle;
  int startX = 100;
  int endX = 500;
  int step = 10;
  int distanceX = endX - startX;
 
  ECG()
  {
    completeCycle = TWO_PI/float(distanceX);
    subCycle = (TWO_PI*5)/float(distanceX);
  }
 
  
  void render(float WaveSpeed)
  {
    background(0);
    fill(255);
    posY = height/2;

    for (int i = startX; i<endX; i+=step) 
    {
      noStroke();
      rect(i, (posY), 2, 2);
    }
    drawLines(WaveSpeed);
  }
   
   void drawLines(float WaveSpeed)
   {
      fill(255, 0, 0);
      drawLine(WaveSpeed);
      
      pushMatrix();
      translate(0, 50);
      fill(0, 255, 0);
      drawLine(WaveSpeed);
      popMatrix();
      
      pushMatrix();
      translate(0, -50);
      fill(0, 0, 255);
      drawLine(WaveSpeed);
      popMatrix();
      
      border();
   }
   
  void drawLine(float WaveSpeed)
  {
    for (int i = startX; i<endX; i+=step) 
    {
      temps += (millis()%i)*WaveSpeed;
      variationY = sin(((i-startX+temps))*completeCycle);
      variationY*=(amplitude*0.2)+((i*i)/(4000));
      variationY2 = sin((i-startX+temps)*subCycle);
      variationY2 *= (amplitude*0.005)+((i*i)/(16000));
      ellipse(i, (posY+variationY+variationY2), 5, 5);
    }
  }
     
  void border()
  {
    stroke(123);
    strokeWeight(100);
    line(0, 0, 0, height);
    line(0, 0, width, 0);
    line(width, 0, width, height);
    line(0, height, width, height);
    stroke(0, 123, 0);
    strokeWeight(20);
    line(50, 50, width-50, 50);
    line(50, 50, 50, height-50);
    line(50, height-50, width-50, height-50);
    line(width-50, height-50, width-50, 50);
    
    
    fill(255);
    rect(width*.45, height*.17, 570, 400);
    //fill(0);
    
    fill(255);
    text("ECHOCARDIOGRAM", 260, 500);
    
    data.get(selectCrew).printCrewHR();
    buttons();
  }
}