# MedLab
HUD OOP CA Semester1 Year2

The concept for my OOP assignment is based on a Star Trek-esque Sick Bay HUD/UI.  
The videos below give a basic demonstration of the functionality of the program and the expected user interactions. 

CLICK THE IMAGE BELOW TO PLAY VIDEO
(Alt Link: https://youtu.be/NytrvnN8dhk)

[![Video](http://img.youtube.com/vi/NytrvnN8dhk/0.jpg)](http://www.youtube.com/watch?v=NytrvnN8dhk)

The basic functionality of the program involves the user selecting a crew member from a list. This selection triggers a 
mouseClicked() function inside my sketch which is checking to see if various areas of this screen are clicked by the user. 
Once a specific button or item is clicked, state flags are set to true or false, and global variables 
are updated. This allows the program to progress to new areas with the data selected by the user.

The basic concept for the user is to select a crew member from a list diplayed to them, and from there to proceed to 
a main menu where they are able to view the medical records for that individual user. 

Data for each crew member is unique and is held in a CSV file which the program loads into an arrayList when setup() is called. 
A 'Crew' class is used to parse the data into rows and and load the values into global variables which are saved in the arrayList.
This Crew class also has methods used to display the medical records to the user. 

The user is initially shown a splash screen to welcome them to the "United Federation of Planets, MedLab System".
This screen displays for a few seconds using a frameCount check, then disappears. 

![Main Splash](/screenshots/mainSplash.jpg?raw=true "Main Splash")

After the main splash screen has been wiped, the user is presented with a new screen, the Crew Manifest table. 
Here the user can select a crew member that they want to review. 

![Crew Manifest](/screenshots/crewManifestScreen.jpg?raw=true "Crew Manifest")

Once a crew member is selected from the list, their name is displayed in the field at the top of the table i.e. 
Crew Member Selected: Beverly Crusher. The user can then proceed to the Main Menu to view Beverly Crusher's medical records.

Error Checking:
If the user does not select a crew member from the Crew Manifest table, but selects to enter the Main Menu immediately, 
the program will termninate softly with an exit splash screen. This to prevent the program displaying any data that is not 
associated with a crew member. 

Once inside the Main Menu, the user is shown a number of buttons: "Blood Cultures", "Chemistry Panel", "ECG" and "Exit MedLab System".
These buttons allow the user to further interact, clicking the buttons will bring the user to a new display where they can 
review the chosen crew member's medical record for that particular fields i.e. Beverly Crusher's Echocardiogram, etc

![Main Menu](/screenshots/mainMenu.jpg?raw=true "Main Menu")

Below are screen shots from the medical fields available to the user. 

![Echocardiogram](/screenshots/echocardiogram.jpg?raw=true "Echocardiogram")

![Chemistry Panel](/screenshots/chemPanel.jpg?raw=true "Chemistry Panel")

![Blood Culture](/screenshots/bloodCulture.jpg?raw=true "Blood Culture")

At any point in the program the user can return to the Crew Manifest by selecting that button, which appears on each 
display page. The user can switch between crew members and view their records by accessing the options in the Main Menu. 

Once the user is finished their analysis, the user can click the final button on the Main Menu, named "Exit MedLab System".
Clicking this button will terminate the program with an exit splash screen. 