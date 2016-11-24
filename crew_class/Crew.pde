
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
  int bp;
  
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
    bp = row.getInt("BP"); 
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
  
  void displayRecord()
  {
    
  }
}