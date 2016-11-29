void setup()
{
  background(0);
  size(1200, 600);
  
  // draw main grid and load data from CSV file
  createGrid();  
  loadData();
  
  // class objects
  crewECG = new ECG();
  culture = new Bacteria();
  culture.initialise();
  chemPanel = new Chemistry();
  
  // fonts imported
  font_sign = createFont("Okuda", 50);
  font_main = createFont("Finalnew.ttf", 50);
}

// arrayList holding crew objects, read from CSV file
ArrayList<Crew> data = new ArrayList<Crew>();

// class objects
ECG crewECG;
Bacteria culture;
Chemistry chemPanel;

// variable to store the crew member number chosen by user
int selectCrew = 0;

// shapes for the main background grid
PShape shape1;
PShape shape2;

// imported fonts
PFont font_sign;
PFont font_main;

// flags
boolean menuFlag = false;        // if the main menu button clicked
boolean manifestFlag = false;   // if the crew manifest button clicked
boolean exitFlag = false;      // if the exit button is clicked

boolean chemFlag = false;
boolean ecgFlag = false;
boolean bactFlag = false;
boolean crewFlag = false;


void draw()
{
  // delay to allow an initial welcome/splash screen
  if (frameCount < 120)
  {
    //display splash screen
    splash();
  }
  else
  {
    //rest of the code
    
    // display the crew table to allow the user to select a crew members' record for viewing
    crewTable();
    
    /* check state of flags to change between screens */
    
    if (menuFlag)
    {
      mainMenu();
    }
    
    if(manifestFlag)
    {
      crewTable();
    }
    
    if(ecgFlag)
    {
      echo();
    }
    
    if(chemFlag)
    {
      barChart();
    }
    
    if(bactFlag)
    {
      petri();
    }
    
    if(crewFlag)
    {
      crewTable();
    }
    
    if(exitFlag)
    {
      myExit();
    }
  }
}

// draws main welcome screen
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
  text("Crew Member Selected: "+ data.get(selectCrew).Fname+" "+data.get(selectCrew).Lname, 600, 110);
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
  PImage bullet;
  bullet = loadImage("bullet.png");
  rect(width/4, height*.32, 600, 300);
  float x;
  float y = height*.41;
  fill(0);
  
  for(int i=data.size()-1; i>0; i--)
  {
    x = width*0.28;
    Crew c = data.get(i);
    pushMatrix();
    textAlign(LEFT);
    textFont(font_sign, 26);
    image(bullet, x, y-20);
    x += 50;
    text(c.id, x, y);
    x += 100;
    text(c.Fname+" "+c.Lname, x, y);
    x += 130;
    text(c.rank, x, y);
    x += 130;
    text(c.pos, x, y);  
    popMatrix();
    y += 40;
  }
  textAlign(CENTER);  // ** affects formatting of buttons that come after 
}

// draws the main interactive screen
void mainMenu()
{
  if(selectCrew > 0)
  {
    background(0);
    render();
    buttons();
    drawBar();
    drawWave();
    drawCulture();
    drawBackground();
    drawExit();
  }
  else
  {
    // terminate program with terminate msg 
    myExit(); 
  }
}

// draw the exit button
void drawExit()
{
  fill(255,223,0);
  textFont(font_sign, 75);
  text("EXIT", width-200, height-100);
  textSize(45);
  text("MEDLAB  SYSTEM", width-200, height-50);
}

void myExit()
{
    
    background(0);
    PImage exitIMG;
    exitIMG = loadImage("exitSplash.png");
    image(exitIMG, 0, 0);
    textSize(75);
    text("PLEASE WAIT......", 600, 90);
    text(".....SYSTEM SHUTTING DOWN", 575, 500);

    // delay the program exiting wihout user seeing the msg
    if(frameCount % 60 == 0)
    {
      exit(); // built in processing fxn to exit the program
    }
}

// chem panel (barchart) function 
void barChart()
{
    background(0);
    buttons();
    chemPanel();
    
    //chemPanel.render();
    
}

void chemPanel()
{
  // read a crew members data
    Crew c = data.get(selectCrew);
    
    // map the chem values onto the grid
    float lipHeight = map(c.lipid, 0, 10, 0, 300);
    float tsHeight = map(c.t3_t4, 0, 30, 0, 300);
    float renHeight = map(c.renal, 0, 15, 0, 300);
    float elecHeight = map(c.elect, 0, 10, 0, 300);
    float livHeight = map(c.liver, 0, 25, 0, 300);
    
    // draw the bars for the chart
    noStroke();
    
    pushMatrix();
    translate(0, -70);
    textSize(20);
    fill(255, 0, 0);
    rect(130, height-height/5, lipHeight, -20);
    fill(0, 0, 255);
    rect(130, height-height/5-60, tsHeight, -20);
    fill(0, 255, 0);
    rect(130, height-height/5-120, renHeight, -20);
    fill(255, 0, 255);
    rect(130, height-height/5-180, elecHeight, -20);
    fill(0, 255, 255);
    rect(130, height-height/5-240, livHeight, -20);
    popMatrix();
    
    pushMatrix();
    translate(35, -65);
    textAlign(LEFT);
    text("Lipids: "+c.lipid, 100, (height-height/5)+15);
    text("T3/T4 Conversion: "+c.t3_t4, 100, (height-height/5)-45);
    text("Renal Function: "+c.renal, 100, (height-height/5)-105);
    text("Electrolytes: "+c.elect, 100, (height-height/5)-165);
    text("Liver Proteins: "+c.liver, 100, (height-height/5)-225);
    popMatrix();
    
    chemPanel.border();
}

void echo()
{
    
    buttons();
    
    // pass the hr value of the selected crew member as param to fxn crewECG.render()
    crewECG.render(data.get(selectCrew).hr);
}

void petri()
{
    background(0);
    culture.render(data.get(selectCrew).spCode); 
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
      ecgFlag = false; 
      
      chemFlag = true;
      // barchart function
    }
  }
  
  // top right grid
  if (mouseX <= width && mouseX >= width-width/3) 
  {
    if(mouseY >=0 && mouseY <= height/3)
    {
      bactFlag = false;
      chemFlag = false;
      
      ecgFlag = true;
      // ECG file
    }
  }
  
  // bottom left grid
  if (mouseX >=0 && mouseX <= width/3) 
  {
     if(mouseY <= height && mouseY >= height-height/3)
    {
      chemFlag = false;
      ecgFlag = false;
      
      bactFlag = true;
      // Blood Culture file
    }
  }
  
  // bottom right grid
  if (mouseX <= width && mouseX >= width-width/3) 
  {
     if(mouseY <= height && mouseY >= height-height/3)
    {
      exitFlag = true; 
    }
  }
 
  // top center grid i.e. crew manifest button
  if (mouseX > width/3 && mouseX < width-width/3) 
  {
     if(mouseY < 50 && mouseY > 0)
    {
      chemFlag = false;
      ecgFlag = false;
      bactFlag = false;
      menuFlag = false;
      
      manifestFlag = true;
    }
  }
   
  // bottom center grid i.e. main menu button
  if (mouseX > width/3 && mouseX < width-width/3) 
  {
     if(mouseY <= height && mouseY >= height-50)
    {
      chemFlag = false;
      ecgFlag = false; 
      bactFlag = false;
      manifestFlag = false; 
      
      menuFlag = true;
    }
  }

  // if centre square areas are clicked i.e. crew manifest table
  if (mouseX >330 && mouseX < 880) 
  {
    if (mouseY > 225 && mouseY < 245)
    {
      selectCrew = 6;
    }
    
    if (mouseY > 265 && mouseY < 295)
    {
      selectCrew = 5;
    }
    
    if (mouseY > 315 && mouseY < 345)
    {
      selectCrew = 4;
    }
    
    if (mouseY > 355 && mouseY < 385)
    {
      selectCrew = 3;
    }
    
    if (mouseY > 395 && mouseY < 425)
    {
      selectCrew = 2;
    }
    
    if (mouseY > 435 && mouseY < 465)
    {
      selectCrew = 1;
    }
  } 
}// end mousePressed()
  
 
 
// create background grid shapes
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
  text("Chemistry\nPanel", tx, ty);
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
  
  Table t = loadTable("medRecords.csv", "header");
  
  for(int i=0; i<t.getRowCount(); i++)
  {
    TableRow row = t.getRow(i);
    Crew c = new Crew(row);
    data.add(c);
    //println(c);
  }
}