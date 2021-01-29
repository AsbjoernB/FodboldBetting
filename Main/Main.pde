MatchDatabase matchDatabase;
TeamDatabase teamDatabase;

Screen currentScreen;
UserData currentUser;
 

void setup()
{
  size(1280, 720);
  background(0);
  matchDatabase = new MatchDatabase();
  teamDatabase = new TeamDatabase();
  
  //currentUser = new UserData("Bo");
  currentScreen = new LoginScreen();
  
  
  Match[] m = matchDatabase.GetRoundMatches(1);
  println(m[5].homeTeam);
}

void draw()
{  
  background(89,170,69);
  
  currentScreen.update();
}

void mouseReleased()
{
  currentScreen.mouseReleased();
}
void keyPressed()
{
  currentScreen.keyPressed();
}
