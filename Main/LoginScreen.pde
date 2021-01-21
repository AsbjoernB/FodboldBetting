public class LoginScreen extends Screen
{
  
  TextBox userNameInput;
  
  Button loginButton;
  
  public LoginScreen()
  {
    userNameInput = new TextBox(new PVector(width/2-100, height/2-20), new PVector(200, 40), false);
    loginButton = new Button(width/2-40, height-75, "Login");
  }
  
  public void update()
  {
    loginButton.update();
    userNameInput.update();
  }
  
  public void mouseClicked()
  {
    userNameInput.mousePressed();
  }
  public void keyPressed()
  {
    userNameInput.keyPressed();
  }
}
