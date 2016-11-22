void setup()
{
  size(1200, 600);
  background(0);
  font = loadFont("SegoeUISymbol-30.vlw");
  drawAllGrids();
  drawBar();
  drawWave();
  
}

PFont font;



void draw()
{
  if (millis() < 3000)//in milliseconds
  {
    //display splash screen
  }
  else {
    //rest of the code
    
  }
  
}


void mouseClicked() 
{
  // top left grid
  if (mouseX >=0 && mouseX <= width/3) 
  {
    if(mouseY >=0 && mouseY <= height/3)
    {
      background(255, 0, 0);
      drawAllGrids();
      drawBar();
      drawWave();
      // do graph here
    }
  }
  
  // top right grid
  if (mouseX <= width && mouseX >= width-width/3) 
  {
    if(mouseY >=0 && mouseY <= height/3)
    {
      background(0, 0, 255);
      drawAllGrids();
      drawBar();
      drawWave();
      // do graph here
    }
  }
  
  // bottom left grid
  if (mouseX >=0 && mouseX <= width/3) 
  {
     if(mouseY <= height && mouseY >= height-height/3)
    {
      background(0, 255, 0);
      drawAllGrids();
      drawBar();
      drawWave();
      // do graph here
    }
  }
  
  // bottom right grid
  if (mouseX <= width && mouseX >= width-width/3) 
  {
     if(mouseY <= height && mouseY >= height-height/3)
    {
      background(0, 255, 255);
      drawAllGrids();
      drawBar();
      drawWave();
      // do graph here
    }
  }
} // end mouseClicked()

void drawAllGrids()
{
  stroke(255);
  strokeWeight(5);
  
  // top-left grid
  line(width/3, 0, width/3, height/6);
  line(width/3, height/6, width/4, height/3);  
  line(width/4, height/3, 0, height/3);

  // top-right grid
  line(width-width/3, 0, width-width/3, height/6);
  line(width-width/3, height/6, width-width/4, height/3);  
  line(width-width/4, height/3, width, height/3); 

   // bottom-left grid
  line(0, height-height/3, width/4, height-height/3);
  line(width/4, height-height/3, width/3, height-height/6);  
  line(width/3, height-height/6, width/3, height);

   // bottom-right grid
  line(width, height-height/3, width-width/4, height-height/3);
  line(width-width/4, height-height/3, width-width/3, height-height/6);  
  line(width-width/3, height-height/6, width-width/3, height);  
}

void drawBar()
{
 
  PImage barChartIMG;
  barChartIMG = loadImage("miniBar_chart.jpg");
  image(barChartIMG, 55, 20);
  
  /*
  stroke(255, 0, 255);
  line(50, 150, 250, 150);
  fill(255);
   
  rect(75, 50, 25, 100);
  rect(100, 30, 25, 120);
  rect(125, 70, 25, 80);
  rect(150, 60, 25, 90);
  rect(175, 90, 25, 60);
  rect(200, 50, 25, 100);
  */
  
  textFont(font, 30); 
  text("Blood Pressure", 48, 180);
}

void drawWave()
{
  PImage waveIMG;
  waveIMG = loadImage("miniDNA_wave.jpg");
  image(waveIMG, 930, 27);
  
  textFont(font, 30); 
  text("DNA Scan", 960, 180);
}