# MedLab
HUD OOP CA Semester1 Year2

The concept for my OOP assignment is based on a Star Trek-esque Sick Bay HUD/UI.  
The video below give a basic demonstration of the functionality of the program and the expected user interactions. 

Click image below to play video: (https://youtu.be/NytrvnN8dhk)

[![Video](http://img.youtube.com/vi/NytrvnN8dhk/0.jpg)](http://www.youtube.com/watch?v=NytrvnN8dhk)

The basic functionality of the program involves the user selecting a crew member from a list. This selection triggers a 
mouseClicked() function inside my sketch which is checking to see if various areas of this screen are clicked by the user. 
Once a specific button or item is clicked, state flags are set to true or false, and global variables 
are updated. This allows the program to progress to new areas with the data selected by the user.

The basic concept from the user's point of view is, to select a crew member from a list diplayed to them, and from there to proceed to 
a main menu where they are able to view the medical records for that individual user. They have control over what records are displayed
and which crew member they want to view. They can freely move between screens and swap in and out of different crew members records at any 
time during the program. 

Data for each crew member is unique and is held in a CSV file which the program loads into an arrayList when setup() is called. 
A 'Crew' class is used to parse the data into rows and and load the values into global variables which are saved in the arrayList.
This Crew class also has methods used to display the medical records to the user. 

Now you know the basic concept, let's see how it looks....

The user is initially shown a splash screen to welcome them to the "United Federation of Planets, MedLab System".
This screen displays for a few seconds using a frameCount check, then disappears. 

![Main Splash](/screenshots/mainSplash.jpg?raw=true "Main Splash")

After the main splash screen has been wiped, the user is presented with a new screen, the Crew Manifest table. 
Here the user can select a crew member that they want to review by simply clicking on that crew member's name in the table. 

Once a crew member is selected from the list, their name is displayed in the field at the top of the table i.e. 
"Crew Member Selected: Beverly Crusher". The user can then proceed to the Main Menu to view Beverly Crusher's medical records.

Error Checking:
If the user does not select a crew member from the Crew Manifest table, but selects to enter the Main Menu immediately, 
the program will terminate softly with an exit splash screen. This to prevent the program displaying any data that is not 
associated with a crew member. 

![Crew Manifest](/screenshots/crewManifestScreen.jpg?raw=true "Crew Manifest")

Once inside the Main Menu, the user is shown a number of menu option buttons: "Blood Cultures", "Chemistry Panel", "ECG" and "Exit MedLab System".
These buttons allow the user to further interact, clicking the buttons will bring the user to a new display where they can 
review the chosen crew member's medical record for that particular menu option i.e. Beverly Crusher's Echocardiogram, etc

![Main Menu](/screenshots/mainMenu.jpg?raw=true "Main Menu")

Below are screen shots from the internal displays of the menu options available to the user. 
Each crew member has different medical records and as such, their records display unique values or animations.
These unique values are identified in the file "medRecords.csv" which is loaded at the start of the sketch. 

<b>CHEMISTRY PANEL</b>
The chemistry panel is made up of values that are associated with a humanoid chemistry panel, ordered by a doctor 
as part of any medical check up. As all the crew members are humanoid, I have suggested with this option that they 
would share common chemistries. Values are unique for each user and are displayed to the screen using a map() of 
the values in the CSV file. 

![Chemistry Panel](/screenshots/chemPanel.jpg?raw=true "Chemistry Panel")

The Blood Culture menu option is actually a miniature version of John Conway's Game of Life. The idea is that we are looking at the 
crew member's blood cells under a microscope. The aminations differ for each crew member selected, by taking the value assigned 
for a crew member's Species Code in the CSV file. This value is passed as a parameter to the Bacteria class and determines the 
colour of the cells in the animation. This is to reflect crew member's of different species having different blood cultures.  

![Blood Culture](/screenshots/bloodCulture.jpg?raw=true "Blood Culture")

The ECG menu option is animated using a sine wave function. An initial white base line is drawn using a for loop, with the
three sine waves being rendered using an single function call to draw one wave, and then a pushMatrix(), popMatrix() and translate() 
to render the additional lines. The speed of the ECG is different for each crew member to reflect their personal heart rate. 
It is based on a specific value set in the original CSV file which is passed to the ECG class when that menu option is 
selected by the user in the Main Menu. 

![Echocardiogram](/screenshots/echocardiogram.jpg?raw=true "Echocardiogram")

At any point in the program the user can return to the Crew Manifest by selecting the "Crew Mainfest" button, which appears on each 
display page. The user can select any crew member and view their records by accessing the options in the Main Menu. 

Once the user is finished their analysis, the user can click the final button on the Main Menu, named "Exit MedLab System".
Clicking this button will terminate the program with an exit splash screen. The splash screen display is delayed using a frameCount check.
This allows enough time for the user to see the exit splash, telling them that the program is exiting. The user does not 
need to close the program window manually, it will self-terminate. 

![Exit Splash](/screenshots/exitSplash.jpg?raw=true "Exit Splash")

Items I'm Proud Of:
- manipulating the sine wave function in the ECG class
- getting Conway's Game of Life into my program!
- ensuring that the program does not continue if no crew member is selected (error checking)
- the uniformity and clarity of my display screens, overall pleasing appearance
- terminating the program at the user's request rather than self-terminating
- being able to flip back and forth between screens to allow the user full control over what they see

That's it, I hope you enjoy playing around with it.
~ Engage!