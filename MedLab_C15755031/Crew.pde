class Crew
{
  String id;
  String rank;
  String pos;
  String Fname;
  String Lname;
  String birthP;
  float birthD;
  int age;
  float cheight;
  float weight;
  String gender;
  String species;
  int spCode;
  float hr;
  String photo;
  int bp;
  String immune;
  float lipid;
  float t3_t4;
  float renal;
  float elect;
  float liver;
  
   Crew(TableRow row)
  {
    id = row.getString("CrewID");
    rank = row.getString("Rank");
    pos = row.getString("Position");
    Fname = row.getString("FirstName");
    Lname = row.getString("LastName");
    birthP = row.getString("Birthplace");
    birthD = row.getFloat("Birthdate");
    age = row.getInt("Age");
    cheight = row.getFloat("Height");
    weight = row.getFloat("Weight");
    gender = row.getString("Gender");
    species = row.getString("Species");
    spCode = row.getInt("SpeciesCode");
    hr = row.getFloat("HeartRate"); 
    photo = row.getString("Photo");
    bp = row.getInt("BloodPressure");
    immune = row.getString("Immunised");
    lipid = row.getFloat("Lipid");
    t3_t4 = row.getFloat("T3/T4");
    renal = row.getFloat("Renal");
    elect = row.getFloat("Electrolyte");
    liver = row.getFloat("Liver");
  }

   // converts the object to a string so it can be printed
  String toString()
  {
    return id 
    + "," + rank 
    + "," + pos
    + "," + Fname 
    + "," + Lname
    + "," + birthP
    + "," + birthD
    + "," + age
    + "," + cheight
    + "," + weight
    + "," + gender
    + "," + species
    ;
  }
  
  // print crew member details with items specific to the ECG chart
  void printCrewHR()
  {
    Crew c = data.get(selectCrew);
    fill(255,223,0);
    pushMatrix();
    textAlign(LEFT);
    float x = width*.50;
    float y = height*.3;
    text("CREW MEMBER", x, y);
    y += 80;
    fill(206,99,99);
    text("Name: "+c.Fname+" "+c.Lname, x, y);
    y += 40;
    text("Age: "+c.age, x, y);
    y += 40;
    text("BirthDate: "+c.birthD, x, y);
    y += 40;
    text("BirthPlace: "+c.birthP, x, y);
    y += 40;
    text("Weight: "+c.weight, x, y);
    y += 40;
    text("Species: "+c.species, x, y);
    x += 265; 
    y = height*.25;
    PImage profileIMG;
    profileIMG = loadImage(c.photo);
    image(profileIMG, x+25,y+10);
    popMatrix();
    
    textAlign(CENTER);
    buttons();
  }
  
  // print crew member details with items specific to the Blood Culture (Bacteria) chart
  void printCrewCult()
  {
    Crew c = data.get(selectCrew);
    fill(255,223,0);
    pushMatrix();
    textAlign(LEFT);
    float x = width*.50;
    float y = height*.3;
    textSize(48);
    text("CREW MEMBER", x, y);
    y += 80;
    fill(206,99,99);
    text("Name: "+c.Fname+" "+c.Lname, x, y);
    y += 40;
    text("Gender: "+c.gender, x, y);
    y += 40;
    text("BirthPlace: "+c.birthP, x, y);
    y += 40;
    text("Species: "+c.species, x, y);
    y += 40;
    text("Species Code: "+c.spCode, x, y);
    y += 40;
    text("Immunised: "+c.immune, x, y);
    x += 265; 
    y = height*.25;
    PImage profileIMG;
    profileIMG = loadImage(c.photo);
    image(profileIMG, x+25,y+10);
    popMatrix();
    
    textAlign(CENTER);
    buttons();
  }
  
  // print crew member details with items specific to the Chem Panel chart
  void printCrewCP()
  {
    Crew c = data.get(selectCrew);
    fill(255,223,0);
    pushMatrix();
    textAlign(LEFT);
    float x = width*.50;
    float y = height*.3;
    textSize(48);
    text("CREW MEMBER", x, y);
    y += 50;
    fill(206,99,99);
    textSize(36);
    text("Name: "+c.Fname+" "+c.Lname, x, y);
    y += 40;
    text("Weight: "+c.weight, x, y);
    y += 40;
    text("Lipid: "+c.lipid, x, y);
    y += 40;
    text("T3/T4: "+c.t3_t4, x, y);
    y += 40;
    text("Renal: "+c.renal, x, y);
    y += 40;
    text("Electrolytes: "+c.elect, x, y);
    y += 40;
    text("Liver: "+c.liver, x, y);
    x += 265; 
    y = height*.25;
    PImage profileIMG;
    profileIMG = loadImage(c.photo);
    image(profileIMG, x+25,y+10);
    popMatrix();
    
    textAlign(CENTER);
    buttons();
  }
  
  // this draws the generic formatted border for all the charts
  void drawCrewBorder() 
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
  }
  
} // end class