void setup()
{
  background(0);
  size(1200, 600);
  create();  
  loadData();
  crewECG = new ECG();
  culture = new Bacteria();
  culture.initialise();
  
  font_sign = createFont("Okuda", 50);
  font_main = createFont("Finalnew.ttf", 50);
}

ArrayList<Crew> data = new ArrayList<Crew>();

ECG crewECG;
Bacteria culture;
int selectCrew = 2;

//float BP = data.get(selectCrew).bp;

PShape shape1;
PShape shape2;

PFont font_sign;
PFont font_main;

boolean menuFlag = false;
boolean crewFlag = false;
boolean barFlag = false;
boolean sineFlag = false;
boolean bactFlag = false;

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
    
    if(bactFlag)
    {
      petri();
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

// printing the menu/manifest buttons 
void buttons()
{ 
  stroke(255);
  strokeWeight(7);
  fill(123, 123, 123);
  rect(width/3+3, 3, width/3-5, 50);
  rect(width/3+3, height-53, width/3-5, 50);
  fill(255,223,0);
  textFont(font_sign, 48);
  text("CREW MANIFEST", width*.51, height*.075);
  text("MAIN MENU", width*.51, height*.98);
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
  crewMember();
}

// printing each crew member details
void crewMember()
{
  rect(width/4, height*.32, 600, 300);
  float x = width/3;
  float y = height*.43;
  for(int i=data.size()-1; i>=0; i--)
  {
    
    Crew c = data.get(i);
    fill(0);
    textAlign(CENTER);
    text(c.id, x, y);
    x += 200;
    text(c.Fname, x, y);
    x += 200;
    text(c.Lname, x, y);
    y += 40;
    x = width/3;
  }
}



// draws the main interactive screen
void mainMenu()
{
    background(0);
    render();
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
    // pass the hr value of the selected crew member as param to fxn crewECG.render()
    crewECG.render(data.get(selectCrew).hr);
}

void petri()
{
    background(0);
    culture.render();
}

// checking for user selecting options
void mousePressed() 
{
  // top left grid
  if (mouseX >=0 && mouseX <= width/3) 
  {
    if(mouseY >=0 && mouseY <= height/3)
    {
      bactFlag = false;
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
      bactFlag = false;
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
      barFlag = false;
      sineFlag = false;
      
      bactFlag = true;
      //bacteria culture function
    }
  }
  
  // bottom right grid
  if (mouseX <= width && mouseX >= width-width/3) 
  {
     if(mouseY <= height && mouseY >= height-height/3)
    {
      background(0, 255, 255);
      
      render();
      drawBar();
      drawWave();
      buttons();
      // pi wave function 
    }
  }
 
  // top center grid i.e. crew manifest button
  if (mouseX > width/3 && mouseX < width-width/3) 
  {
     if(mouseY < 50 && mouseY > 0)
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
     if(mouseY <= height && mouseY >= height-50)
    {
      barFlag = false;
      sineFlag = false; 
      crewFlag = false; 
      
      menuFlag = true;
    }
  }
} // end mouseClicked()

// create background shapes
void create()
{
  shape1 = createShape();
  shape1.beginShape();
  shape1.stroke(255);
  shape1.noFill();
  shape1.strokeWeight(2);
  shape1.vertex(width/3, 0);
  shape1.vertex(width/3, height/6);
  shape1.vertex(width/3, height/6);
  shape1.vertex(width/4, height/3);
  shape1.vertex(width/4, height/3);
  shape1.vertex(0, height/3);
  shape1.endShape();
  
  shape2 = createShape();
  shape2.beginShape();
  shape2.stroke(255);
  shape2.noFill();
  shape2.strokeWeight(2);
  shape2.vertex(0, height-height/3);
  shape2.vertex(width/4, height-height/3);
  shape2.vertex(width/4, height-height/3);
  shape2.vertex(width/3, height-height/6);
  shape2.vertex(width/3, height-height/6);
  shape2.vertex(width/3, height);
  shape2.endShape();
} 

// draw the background grid shapes in their respective areas
void render()
{  
  shape(shape1, 0, 0);
  shape(shape2, 0, 0);
  pushMatrix();
  translate(width, height);
  rotate(PI);
  shape(shape1, 0, 0);
  shape(shape2, 0, 0);
  popMatrix();
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
  text("CREW ECG", tx, ty);
}

void loadData()
{
  data.clear();
  
  Table t = loadTable("medRecords2.csv", "header");
  
  for(int i=0; i<t.getRowCount(); i++)
  {
    TableRow row = t.getRow(i);
    Crew c = new Crew(row);
    data.add(c);
  }
}