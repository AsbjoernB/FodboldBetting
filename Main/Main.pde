public MatchDatabase matchDatabase;
public TeamDatabase teamDatabase;

Screen currentScreen;
UserData currentUser;
 


void setup()
{
  size(1280, 720);
  background(0);
  
  matchDatabase = new MatchDatabase();
  teamDatabase = new TeamDatabase();
  
  currentScreen = new LoginScreen();
}

void draw()
{  
  background(200);
  currentScreen.update();
}

void mouseReleased()
{
  currentScreen.mouseClicked();
}

void keyPressed()
{
  currentScreen.keyPressed();
}
