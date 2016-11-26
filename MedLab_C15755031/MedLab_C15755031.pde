void setup()
{
  background(0);
  size(1200, 600);
  
  font_sign = createFont("Okuda", 50);
  font_main = createFont("Finalnew.ttf", 50);
}


PFont font_sign;
PFont font_main;

boolean menuFlag = false;
boolean crewFlag = false;
boolean barFlag = false;
boolean sineFlag = false;

void draw()
{
  
  if (frameCount < 120)
  {
    //display splash screen
    splash();
  }
  else
  {
    //rest of the code
    //background(0);
    crewTable();
    
    if (menuFlag)
    {
      mainMenu();
    }
    
    if(crewFlag)
    {
      crewTable();
    }
    
    if(sineFlag)
    {
      sineWave();
    }
    
    if(barFlag)
    {
      barChart();
    }
  }
}

// main welcome screen
void splash()
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

// render all crew manifest items
void crewTable()
{
  background(0);
  crewList();         // must print before crewButton
  buttons();       // must print after crewList
  
}

// printing the crew button 
void buttons()
{ 
 
  stroke(255);
  strokeWeight(7);
  fill(123, 123, 123);
  rect(width*.4, height*.1, 260, 50);
  rect(width*.4, height*.85, 260, 50);
  fill(255,223,0);
  textFont(font_sign, 48);
  text("CREW MANIFEST", width*.51, height*.17);
  text("MAIN MENU", width*.51, height*.92);
}

// printing the crew icon and list
void crewList()
{
  background(0);
  PImage loadIMG;
  loadIMG = loadImage("comm.jpg");
  pushMatrix();
  translate(width*0.40, height*0.12);
  image(loadIMG, 0,0);
  popMatrix();
  
  // printing arrayList of crew here
  // void crewMember();
  //
  //
  //
}

// printing each crew member details
void crewMember()
{
  // loop 
  // print rect(x,y)
  // increment y inside loop
  
}



// draws the main interactive screen
void mainMenu()
{
    background(0);
    drawAllGrids();
    buttons();
    drawBar();
    drawWave();
}

void barChart()
{
    background(255, 0, 0);
    buttons();
    
    // barchart function 
}

void sineWave()
{
    background(0, 0, 255);
    buttons();
    
    // sine wave function
}
// checking for user selecting options
void mousePressed() 
{
  // top left grid
  if (mouseX >=0 && mouseX <= width/3) 
  {
    if(mouseY >=0 && mouseY <= height/3)
    {
      sineFlag = false; 
      barFlag = true;
      // barchart function
    }
  }
  
  // top right grid
  if (mouseX <= width && mouseX >= width-width/3) 
  {
    if(mouseY >=0 && mouseY <= height/3)
    {
      barFlag = false;
      sineFlag = true;
      // sine wave function
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
      buttons();
      //BP function
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
      buttons();
      // pi wave function 
    }
  }
  
  // top center grid i.e. crew manifest button
  if (mouseX > width/3 && mouseX < width-width/3) 
  {
     if(mouseY < height/3 && mouseY > 0)
    {
      menuFlag = false;
      barFlag = false;
      sineFlag = false;
      
      crewFlag = true;
    }
  }
  
  // bottom center grid i.e. main menu button
  if (mouseX > width/3 && mouseX < width-width/3) 
  {
     if(mouseY <= height && mouseY >= height-height/3)
    {
      barFlag = false;
      sineFlag = false; 
      crewFlag = false; 
      
      menuFlag = true;
    }
  }
} // end mouseClicked()

// draw main background table
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

// image as part of main menu
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

// image as part of main menu
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