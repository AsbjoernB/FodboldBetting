public class ResultScreen extends Screen
{
  Button backButton;
  
  TripleButton tb;
  
  Bet[] bets;
  
  // testing
  public ResultScreen()
  {
    backButton = new Button(new PVector(width-150, height-100), new PVector(100, 50), "Tilbage", color(0,200,200), color(0,255,255));
    
    tb = new TripleButton(new PVector(width/2, height/2), new PVector(200, 50), new String[] { "2.30", "4.65", "7.41"}, color(0,200,200), color(0,255,255), color(255, 255, 0));
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
    tb.update();
    backButton.update();
  }
  
  public void mouseReleased()
  {
    if (backButton.tryPress())
    {
      currentScreen = new MainScreen();
    }
    
    tb.tryPress();
  }
  public void keyPressed()
  {
  }
}
