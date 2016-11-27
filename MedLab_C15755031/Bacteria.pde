class Bacteria  
{  
  int cellSize; // Size of cells

  // How likely for a cell to be alive at start (in percentage)
  float probabilityOfAliveAtStart;

  // Variables for timer
  int interval;
  int lastRecordedTime;

  // Colors for active/inactive cells
  color alive;
  color dead;

  // Array of cells
  int[][] cells; 
  // Buffer to record the state of the cells and use this while changing the others in the interations
  int[][] cellsBuffer; 
  
  int size;

  Bacteria()
  {
    cellSize = 5;
    probabilityOfAliveAtStart = 30;
    interval = 100;
    lastRecordedTime = 0;
    //alive = color(a, b, c);
    dead = color(0); 
    size = 60;
    cells = new int[size][size];
    cellsBuffer = new int[size][size];
  }

  void initialise()
  {
    // Initialization of cells
    for (int x=0; x<size; x++) 
    {
      for (int y=0; y<size; y++) 
      {
        float state = random (100);
        if (state > probabilityOfAliveAtStart) 
        { 
          state = 0;
        }
        else 
        {
          state = 1;
        }
        cells[x][y] = int(state); // Save state of each cell
      }
    } 
  }

  void render(int spCode)
  {
    if(spCode == 6)
    {
      alive = color(123, 0, 0);
    }
    else if(spCode < 6)
    {
      alive = color(0, 0, 123);
    }
    else
    {
      alive = color(0, 123, 0);
    }
     //Draw grid
    for (int x=0; x<size; x++) 
    {
    for (int y=0; y<size; y++) 
    {
      if (cells[x][y]==1) 
      {
      fill(alive); // If alive
      }
      else 
      {
      fill(dead); // If dead
      }
      pushMatrix();
      translate(115, 130);
      noStroke();
      rect (x*cellSize, y*cellSize, cellSize, cellSize);
      popMatrix();
    }   
    }
    border();
    // Iterate if timer ticks
    if (millis()-lastRecordedTime>interval) 
    {
      //if (!pause) 
      //{
      iteration();
      lastRecordedTime = millis();
     // }
    }
  }
    
  void iteration() 
  {   
    // When the clock ticks
    // Save cells to buffer (so we opeate with one array keeping the other intact)
    for (int x=0; x<size; x++) 
    {
      for (int y=0; y<size; y++) 
      {
        cellsBuffer[x][y] = cells[x][y];
      }
    }

    // Visit each cell:
    for (int x=0; x<size; x++) 
    {
      for (int y=0; y<size; y++) 
      {
        // And visit all the neighbours of each cell
        int neighbours = 0; // We'll count the neighbours
        for (int xx=x-1; xx<=x+1;xx++) 
        {
          for (int yy=y-1; yy<=y+1;yy++) 
          {  
            if (((xx>=0)&&(xx<size))&&((yy>=0)&&(yy<size))) 
            { // Make sure you are not out of bounds
              if (!((xx==x)&&(yy==y))) 
              { // Make sure to to check against self
                if (cellsBuffer[xx][yy]==1)
                {
                  neighbours ++; // Check alive neighbours and count them
                }
              } // End of if
            } // End of if
          } // End of yy loop
        } //End of xx loop
      
        // We've checked the neigbours: apply rules!
        if (cellsBuffer[x][y]==1) 
        { // The cell is alive: kill it if necessary
          if (neighbours < 2 || neighbours > 3) 
          {
            cells[x][y] = 0; // Die unless it has 2 or 3 neighbours
          }
        } 
        else 
        { // The cell is dead: make it live if necessary      
          if (neighbours == 3 ) 
          {
            cells[x][y] = 1; // Only if it has 3 neighbours
          }
        } // End of if
      } // End of y loop
    } // End of x loop
  } // End of function
  
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
    
    // text area for printing crew details
    fill(255);
    rect(width*.45, height*.17, 570, 400);
    fill(0);
    
    fill(255);
    text("BLOOD CULTURES", 260, 500);
    
    data.get(selectCrew).printCrewCult();
    buttons();
  }
}