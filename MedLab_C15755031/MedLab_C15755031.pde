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
  
  if (frameCount < 120)
  {
    //display splash screen
    splash1();
  }
  else
  {
    //rest of the code
    /*
    background(0);
    drawAllGrids();
    drawBar();
    drawWave();
    mainMenu();
    manHead();
    */
    background(0);
    splash2();
  }
  
  
}

void splash2()
{
  //background(0);
  manTable();
  manHead();
  mainMenu();
  
}



// printing the manifest header 
void manHead()
{ 
  float y = height/12;
  stroke(255);
  fill(123, 123, 123);
  pushMatrix();
  translate(width*0.35, height*0.1);
  rect(0, 0, 320, 50);
  popMatrix();
  
  fill(255,223,0);
  textFont(font_sign, 48);
  pushMatrix();
  translate(width*0.48, height*0.17);
  text("CREW MANIFEST", 0, 0);
  popMatrix();
}

// printing the manifest table background
void manTable()
{
  
  
  PImage loadIMG;
  loadIMG = loadImage("comm.jpg");
  pushMatrix();
  translate(width*0.39, height*0.12);
  image(loadIMG, 0,0);
  popMatrix();
  
  // printing arrayList of crew here
  // void crewMan();
  //
  //
  //
  
}

// printing each crew member details
void crewMan()
{
  // loop 
  // print rect(x,y)
  // increment y inside loop
  
}





void mainMenu()
{
  stroke(255);
  fill(123, 123, 123);
  rect(500, 503, 200, 50);
  fill(255,223,0);
  stroke(0);
  textFont(font_sign, 36); 
  pushMatrix();
  translate(width*0.5, height*0.9);
  text("MAIN MENU", 0, 0);
  popMatrix();
}

void splash1()
{
  float x = width/2;
  float y = 400;
  background(0);
  textFont(font_main);
  textSize(75);
  textAlign(CENTER);
  fill(255,223,0);
  text("United Federation of Planets", x, y);
  text("StarFleet MedLab", x, y+75);
  
  PImage mainLogo;
  mainLogo = loadImage("UFP_Logo_Main.jpg");
  image(mainLogo, x-170,70);
  
  
}


void mousePressed() 
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
      mainMenu();
      manHead();
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
      mainMenu();
      manHead();
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
      mainMenu();
      manHead();
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
      mainMenu();
      manHead();
      // do graph here
    }
  }
  
  // top center grid i.e. crew manifest button
  if (mouseX > width/3 && mouseX < width-width/3) 
  {
     if(mouseY < height/3 && mouseY > 0)
    {
      background(0);
      splash2();
      // do graph here
    }
  }
  
  // bottom center grid i.e. main menu button
  if (mouseX > width/3 && mouseX < width-width/3) 
  {
     if(mouseY <= height && mouseY >= height-height/3)
    {
      //background(123, 124, 178);
      // do graph here
      
      background(0);
      drawAllGrids();
      drawBar();
      drawWave();
      mainMenu();
      manHead();
      
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
  float cx = 930;
  float cy = 27;
  float tx = 960;
  float ty = 180;
  
  PImage waveIMG;
  waveIMG = loadImage("miniDNA_wave.jpg");
  image(waveIMG, cx, cy);
  
  textFont(font_sign, 32); 
  text("DNA Scan", tx, ty);
}