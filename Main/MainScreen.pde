public class MainScreen extends Screen
{
  int ax, ay, aw, ah; // amount placement and size
  int ux, uy, uw, uh; // user placement and size
  
  TextBox bettingAmount;
  
  Button resultButton;
  
  public MainScreen(){
    bettingAmount = new TextBox(new PVector(60, 600), new PVector(200, 60), true);
    resultButton = new Button(new PVector(1000, 600), new PVector(200, 60), "Resultat", color(0,200,200),color(0,255,255), color(0));
    ax=1030;
    ay=20;
    aw=170;
    ah=60;
    
  }
  
  public void update()
  {
    for(int i=100; i<500; i=i+75){
      fill(190, 250, 200);
    rect(50,i,1000,70);
    }
    textAlign(CENTER, CENTER);
    fill(190, 250, 200);
    rect(ax, ay, aw, ah);//amount
    fill(0);
    text(currentUser.money, ax+aw/2,ay+ah/2);
    
    fill(190, 250, 200);
    rect(820, 20, 200, 60);//user
    
    bettingAmount.update();
    resultButton.update();
  }
  
  public void mouseReleased()
  {
    bettingAmount.mouseReleased();
    if (resultButton.tryPress())
    {
      currentScreen = new ResultScreen();
    }
  }
  
  public void keyPressed()
  {
    bettingAmount.keyPressed();
  }
}
