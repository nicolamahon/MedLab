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
  
  // size of the grids
  int size;

  Bacteria()
  {
    cellSize = 5;
    probabilityOfAliveAtStart = 30;
    interval = 100;
    lastRecordedTime = 0;
    dead = color(0); 
    size = 60;
    cells = new int[size][size];
    cellsBuffer = new int[size][size];
  }

  // Initialization of cells
  void initialise()
  {
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

  // renders the whole blood culture chart
  void render(int spCode)
  {
    // values for the speciesCode dictate the colour of the grid elements
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
    
     //Draw the grid
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
    
    // draw the standard border for all the charts
    data.get(selectCrew).drawCrewBorder();
    
    
    drawBactDetails();
    
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
    
  // iterate through grid elements updating their values
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
        // visit all the neighbours of each cell
        int neighbours = 0; //count the neighbours
        for (int xx=x-1; xx<=x+1;xx++) 
        {
          for (int yy=y-1; yy<=y+1;yy++) 
          {  
            if (((xx>=0)&&(xx<size))&&((yy>=0)&&(yy<size))) 
            { 
              // check for 'out of bounds'
              if (!((xx==x)&&(yy==y))) 
              { 
                // check against self
                if (cellsBuffer[xx][yy]==1)
                {
                  neighbours ++; // Check alive neighbours and count them
                }
              } // End inner IF
            } // End outer IF
          } // End of yy loop
        } //End of xx loop
      
        // Neighbours Checked: apply life rules
        if (cellsBuffer[x][y]==1) 
        { 
          // cell is alive: kill if necessary
          if (neighbours < 2 || neighbours > 3) 
          {
            cells[x][y] = 0; // Die unless it has 2 or 3 neighbours
          }
        } 
        else 
        { 
          // cell is dead: set alive if necessary      
          if (neighbours == 3 ) 
          {
            cells[x][y] = 1; // Only if it has 3 neighbours
          }
        } // End IF
      } // End y loop
    } // End x loop
  } // End iteration()
 
  // draw the details that are specific to the blood culture
  void drawBactDetails()
  {
    fill(255);
    text("BLOOD CULTURES", 260, 500);
    
    data.get(selectCrew).printCrewCult();
    buttons();
  }
  
}