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
 
  // takes a speed for the crew member's heart rate
  void render(float WaveSpeed)
  {
    background(0);
    fill(255);
    posY = height/2;
    
    // print the baseline for the ECG
    for (int i = startX; i<endX; i+=step) 
    {
      noStroke();
      rect(i, (posY), 2, 2);
    }
    // this fxn draws the echo lines
    drawLines(WaveSpeed);
  }
   
   // draw the 3 moving echo waves
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
      
      data.get(selectCrew).drawCrewBorder();
      drawEchoDetails();
      // border();
   }
   
   // draw an individual wave line, this fxn is used to render and translate the 3 echo waves 
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
   
   // draw the details that are specific to the Echo chart
    void drawEchoDetails()
    {
      fill(255);
      text("ECHOCARDIOGRAM", 260, 500);
    
    data.get(selectCrew).printCrewHR();
    buttons();
    }
}