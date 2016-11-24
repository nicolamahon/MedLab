void setup()
{
  background(0);
  size(1200, 600);
  
  font_sign = createFont("Okuda", 50);
  font_main = createFont("Finalnew.ttf", 50);
  
}


PFont font_sign;
PFont font_main;



void draw()
{
  
  if (frameCount < 300)//in milliseconds
  {
    //display splash screen
    splash1();
  }
  else {
    background(0);
    splash2();
    //rest of the code
  
    //drawAllGrids();
    //drawBar();
    //drawWave();
  }
  
  
}

void splash2()
{
  //background(0);
  float x = width/4;
  float y = height/4;
  
  
  
  PImage loadIMG;
  loadIMG = loadImage("star-trek-online-logo.jpg");
  image(loadIMG, x,y);
  
  
}

void splash1()
{
  float x = width/2;
  float y = 400;
  background(0);
  textFont(font_main);
  textSize(75);
  textAlign(CENTER);
  text("United Federation of Planets", x, y);
  text("StarFleet MedLab", x, y+75);
  
  PImage mainLogo;
  mainLogo = loadImage("UFP_Logo_Main.jpg");
  image(mainLogo, x-170,70);
  
  
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
  float cx = 55;
  float cy = 20;
  float tx = 140;
  float ty = 180;
  
  PImage barChartIMG;
  barChartIMG = loadImage("miniBar_chart.jpg");
  image(barChartIMG, cx, cy);
  
  textAlign(CENTER);
  textFont(font_sign, 32);
  text("Blood Pressure", tx, ty);
}

void drawWave()
{
  float cx = 55;
  float cy = 20;
  float tx = 140;
  float ty = 180;
  
  PImage waveIMG;
  waveIMG = loadImage("miniDNA_wave.jpg");
  image(waveIMG, 930, 27);
  
  textFont(font_sign, 32); 
  text("DNA Scan", 960, 180);
}