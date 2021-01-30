MatchDatabase matchDatabase;
TeamDatabase teamDatabase;

Screen currentScreen;
UserData currentUser;
 

void setup()
{
  size(1280, 720);
  background(0);
  
  // indlæser/genererer begge databaser
  matchDatabase = new MatchDatabase();
  teamDatabase = new TeamDatabase();
  
  currentScreen = new LoginScreen();
}

void draw()
{  
  background(115,166,87);
  currentScreen.update();
}

// key pressed & mouse release funktioner. Disse er relevante for knapper og tekstfelter
void mouseReleased()
{
  currentScreen.mouseReleased();
}
void keyPressed()
{
  currentScreen.keyPressed();
}
