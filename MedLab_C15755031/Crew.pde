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
    text("Name: "+c.Fname+c.Lname, x, y);
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
    image(profileIMG, x,y);
    popMatrix();
    
    textAlign(CENTER);
    buttons();
  }
  
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
    text("Name: "+c.Fname+c.Lname, x, y);
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
    image(profileIMG, x,y);
    popMatrix();
    
    textAlign(CENTER);
    buttons();
  }
  
} // end class