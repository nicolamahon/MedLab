void setup()
{
  background(0);
  size(1200, 600);
  createGrid();  
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
int selectCrew = 0;

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
  crewList();         // must print before buttons()
  buttons();       // must print after crewList()
  
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
  
  PImage badge1;
  badge1 = loadImage("sciences.png");
  image(badge1, 70, 40);
  PImage badge2;
  badge2 = loadImage("engineering.png");
  image(badge2, 70, 315);
  PImage badge3;
  badge3 = loadImage("tactical.png");
  image(badge3, 965, 40);
  PImage badge4;
  badge4 = loadImage("command.png");
  image(badge4, 965, 315);
  
    
  // printing arrayList of crew here
  crewMember();
}

// printing each crew member details
void crewMember()
{
  rect(width/4, height*.32, 600, 300);
  float x;
  float y = height*.41;
  fill(0);
  //textAlign(0);
  //text("ID\t"+"Name\t"+"Rank", x, y-40);
  for(int i=data.size()-1; i>=0; i--)
  {
    x = width*0.28;
    Crew c = data.get(i);
    pushMatrix();
    textAlign(LEFT);
    textFont(font_sign, 26);
    text(c.id, x, y);
    x += 100;
    text(c.Fname+" "+c.Lname, x, y);
    x += 130;
    text(c.rank, x, y);
    x += 150;
    text(c.pos, x, y);
    popMatrix();
    y += 40;
  }
  textAlign(CENTER);  // ** affects formatting of buttons that come after 
}



// draws the main interactive screen
void mainMenu()
{
    background(0);
    render();
    buttons();
    drawBar();
    drawWave();
    drawCulture();
    drawBackground();
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
    culture.render(data.get(selectCrew).spCode);
    //culture.render((data.get(selectCrew).c1), (data.get(selectCrew).c2), (data.get(selectCrew).c3));
    
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
      // ECG file
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
      // Blood Culture file
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
      drawCulture();
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
      bactFlag = false;
      
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
      bactFlag = false;
      
      menuFlag = true;
    }
  }
} // end mouseClicked()

// create background shapes
void createGrid()
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
  float cx = 47;
  float cy = 40;
  float tx = 290;
  float ty = 70;
  
  PImage barChartIMG;
  barChartIMG = loadImage("miniBar_chart.jpg");
  image(barChartIMG, cx, cy);
  
  textAlign(CENTER);
  textFont(font_sign, 40);
  text("Blood\nPressure", tx, ty);
}

// image as part of main menu
void drawCulture()
{
  float cx = 50;
  float cy = 440;
  float tx = 320;
  float ty = 510;
  
  PImage cultureIMG;
  cultureIMG = loadImage("culture.JPG");
  image(cultureIMG, cx, cy);
  
  textAlign(CENTER);
  textFont(font_sign, 40);
  text("Blood\nCultures", tx, ty);
}

// image as part of main menu
void drawWave()
{
  float cx = 930;
  float cy = 27;
  float tx = 875;
  float ty = 100;
  
  PImage waveIMG;
  waveIMG = loadImage("menuEcg.jpg");
  image(waveIMG, cx, cy);
  
  textFont(font_sign, 40); 
  text("ECG", tx, ty);
}

// image as part of main menu
void drawBackground()
{
  float cx = width/3+15;
  float cy = height/5;

  
  PImage backIMG;
  backIMG = loadImage("sfmedical.jpg");
  image(backIMG, cx, cy);
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