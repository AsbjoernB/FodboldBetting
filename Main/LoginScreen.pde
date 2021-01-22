public class LoginScreen extends Screen
{
  
  TextBox usernameInput;
  
  Button loginButton;
  
  public LoginScreen()
  {
    usernameInput = new TextBox(new PVector(width/2-100, height/2), new PVector(200, 40), false);
    loginButton = new Button(new PVector(width/2-40, height/2+75), new PVector(80, 30), "Login", color(0,200,200), color(0,255,255), color(0));
  }
  
  public void update()
  {
    loginButton.update();
    usernameInput.update();
  }
  
  public void mouseClicked()
  {
    usernameInput.mousePressed();
    
    if (loginButton.tryPress())
    {
      println("heyo");
      currentUser = new UserData(usernameInput.value);
      currentScreen = new MainScreen();
    }
  }
  public void keyPressed()
  {
    usernameInput.keyPressed();
  }
}
