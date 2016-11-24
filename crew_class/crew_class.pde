void setup()
{
 size(800,800);
 loadData();
 printData();
 
}

ArrayList<Crew> data = new ArrayList<Crew>();

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

void printData()
{
  background(0);
  stroke(255);
  rect(width/4, height/5, 300, 300);
  float x = width/3;
  float y = height/4;
  for(int i=0; i<data.size(); i++)
  {
    
    Crew c = data.get(i);
    fill(0);
    text(c.id, x, y);
    x += height/10;
    text(c.Fname, x, y);
    x += height/10;
    text(c.Lname, x, y);
    y += 40;
    x = width/3;
    
  }
}