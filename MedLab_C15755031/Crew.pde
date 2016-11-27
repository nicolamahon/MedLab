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
  
  void printCrew()
  {
    Crew c = data.get(selectCrew);
    fill(0);
    textAlign(LEFT);
    float x = width*.50;
    float y = height*.3;
    text("CREW MEMBER", x, y);
    y += 80;
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
    x += 250; 
    y = height*.25;
    PImage profileIMG;
    profileIMG = loadImage(c.photo);
    image(profileIMG, x,y);
  }
  
} // end class