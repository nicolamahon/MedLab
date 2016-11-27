class Bacteria  
{  
  // Size of cells
  int cellSize = 5;

  // How likely for a cell to be alive at start (in percentage)
  float probabilityOfAliveAtStart = 30;

  // Variables for timer
  int interval = 100;
  int lastRecordedTime = 0;

  // Colors for active/inactive cells
  color alive = color(0, 200, 0);
  color dead = color(0);

  // Array of cells
  int[][] cells; 
  // Buffer to record the state of the cells and use this while changing the others in the interations
  int[][] cellsBuffer; 

  Bacteria()
  {
    cells = new int[width/cellSize][height/cellSize];
    cellsBuffer = new int[width/cellSize][height/cellSize];
  }

  void initialise()
  {
    // Initialization of cells
    for (int x=0; x<width/cellSize; x++) 
    {
      for (int y=0; y<height/cellSize; y++) 
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
    background(0); // Fill in black in case cells don't cover all the windows 
  }

  void render()
  {
    background(0);
     //Draw grid
    for (int x=0; x<width/cellSize; x++) 
    {
    for (int y=0; y<height/cellSize; y++) 
    {
      if (cells[x][y]==1) 
      {
      fill(alive); // If alive
      }
      else 
      {
      fill(dead); // If dead
      }
      rect (x*cellSize, y*cellSize, cellSize, cellSize);
    }   
    }
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
    for (int x=0; x<width/cellSize; x++) 
    {
      for (int y=0; y<height/cellSize; y++) 
      {
        cellsBuffer[x][y] = cells[x][y];
      }
    }

    // Visit each cell:
    for (int x=0; x<width/cellSize; x++) 
    {
      for (int y=0; y<height/cellSize; y++) 
      {
        // And visit all the neighbours of each cell
        int neighbours = 0; // We'll count the neighbours
        for (int xx=x-1; xx<=x+1;xx++) 
        {
          for (int yy=y-1; yy<=y+1;yy++) 
          {  
            if (((xx>=0)&&(xx<width/cellSize))&&((yy>=0)&&(yy<height/cellSize))) 
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
}