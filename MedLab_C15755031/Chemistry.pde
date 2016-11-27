class BP
{
  


  BP()
  {
    
  }

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
    
    
    fill(255);
    rect(width*.45, height*.17, 570, 400);
    //fill(0);
    
    fill(255);
    text("", 260, 500);
    
    data.get(selectCrew).printCrewBP();
    buttons();
  }
  
}