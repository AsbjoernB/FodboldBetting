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
  
  currentUser = new UserData("Bo");
  currentScreen = new MainScreen();
  
  
  Match[] m = matchDatabase.GetRoundMatches(1);
  println(m[5].homeTeam);
}

void draw()
{  
  background(135,200,115);
  
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
