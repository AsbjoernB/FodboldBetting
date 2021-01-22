public class ResultScreen extends Screen
{
  Button backButton;
  
  Bet[] bets;
  
  public ResultScreen()
  {
    backButton = new Button(new PVector(width-150, height-100), new PVector(100, 50), "Tilbage", color(0,200,200), color(0,255,255));
  }
  
  public ResultScreen(Bet[] bets)
  {
    this.bets = bets;
    
    // beregn skejs
    int sum = 0;
    for (Bet b : bets)
    {
      sum += b.getPayout();
    }
    currentUser.moneyRefresh(sum);
    
    
    
    backButton = new Button(new PVector(width-150, height-100), new PVector(100, 50), "Tilbage", color(0,200,200), color(0,255,255));
  }
  
  public void update()
  {
    backButton.update();
  }
  
  public void mouseClicked()
  {
    if (backButton.tryPress())
    {
      currentScreen = new MainScreen();
    }
  }
  public void keyPressed()
  {
  }
}
