// laver en arrayliste af typen button. button input (x-koorinat til placering, y-koordinat til placering, tekst på knap)
ArrayList<Button> button = new ArrayList<Button>(); 

Screen currentScreen;

void setup()
{
  size(1280, 720);
  background(0);
  //button.add(new Button(100, 50, "KnapKnap"));
  //button.add(new Button(100, 120, "Knap"));
  
  currentScreen = new LoginScreen();
}

void draw()
{  
  background(200);
  for (Button knap : button) { 
    knap.update();
  }
  
  currentScreen.update();
}

void mouseClicked()
{
  currentScreen.mouseClicked();
}

void keyPressed()
{
  currentScreen.keyPressed();
}
