public class ResultScreen extends Screen
{
  Button backButton;
  
  Bet[] bets;
  
  float sum;
  
  int ax, ay, aw, ah; // amount placement and size
  int sx, sy, sw, sh; // sum / total placement and size
  int ux, uy, uw, uh; // user placement and size
  int mx, my, mw, mh; // matches placement and size
  
  // testing
  public ResultScreen()
  {
    ax=1030;  ay=20;  aw=200;  ah=60;
    sx=850;  sy=550;  sw=200;  sh=60;
    ux=800;  uy=20;  uw=200;  uh=60;
    mx=50; my = 100; mw=1180; mh=70;
    backButton = new Button(new PVector(width-150, height-100), new PVector(100, 50), "Tilbage", color(0,200,200), color(0,255,255));
    bets = new Bet[]
    {
      new Bet(matchDatabase.Matches[0], 0, 20),
      new Bet(matchDatabase.Matches[1], 1, 20),
      new Bet(matchDatabase.Matches[2], 2, 20),
      new Bet(matchDatabase.Matches[3], 0, 20),
      new Bet(matchDatabase.Matches[4], 1, 20),
      new Bet(matchDatabase.Matches[5], 2, 20),
    };
  }
  
  public ResultScreen(Bet[] bets)
  {
    ax=1030;  ay=20;  aw=200;  ah=60;
    sx=850;  sy=550;  sw=200;  sh=60;
    ux=800;  uy=20;  uw=200;  uh=60;
    mx=50; my = 100; mw=1180; mh=70;
    
    this.bets = bets;
    
    // beregn skejs
    sum = 0;
    for (Bet b : bets)
    {
      sum += b.getPayout();
    }
    println(sum);
    currentUser.moneyRefresh(sum);
    
    backButton = new Button(new PVector(width-150, height-100), new PVector(100, 50), "Tilbage", color(0,200,200), color(0,255,255));
  }
  
  public void update()
  {
    textSize(17);
    textAlign(CENTER, CENTER);
    for(int i=0; i<6; i++){ // matches 
      fill(180, 230, 143);
      rect(50,my+75*i,1000,70, 7);
      fill(0);
      text(bets[i].match.homeTeam + " - " + bets[i].match.awayTeam, mx+mw/8,my+75*i+mh/2);
      
      for (int j = 0; j < 3; j++)
      {
        if (j == bets[i].match.getResult())
        {
          if (j == bets[i].guess)
            fill(241, 247, 44);
          else
            fill(50, 230, 60);
        }
        else if (j == bets[i].guess)
          fill(235,40,40);
        else
          fill(127);
        rect(mx+mw/3+(mh*j), my + mh/10 + 75*i, mh*8/10, mh*8/10, 7);
        fill(0);
        String txt = "";
        switch (j)
        {
          case 0: txt = "1"; break;
          case 1: txt = "x"; break;
          case 2: txt = "2"; break;
        }
        text(txt, mx+mw/3+(mh*j) + mh*4/10, my + mh/10 + 75*i + mh*4/10);
      }
      
      // gain / loss
      text(nfc(bets[i].money, 2) + " skejs", mx+mw*3/5, my+75*i+mh/2);
      float payout = bets[i].getPayout();
      
      // red / green
      if (payout < 0)
        fill(255,0,0);
      else
        fill(0, 255, 0);
        
      text(nfp(payout, 1, 2) + " skejs", mx+mw*4/5, my+75*i+mh/2);
    }
    
    // net loss/gain   
    fill(190, 250, 200);
    rect(sx, sy, sw, sh);
    // red / green
      if (sum < 0)
        fill(255,0,0);
      else
        fill(0, 255, 0);
    text(sum, sx+sw/2, sy+sh/2);
    
    // money
    fill(190, 250, 200);
    rect(ax, ay, aw, ah);
    fill(0);
    text("Penge: " + nfc(currentUser.money, 2) + " skejs", ax+aw/2,ay+ah/2);
   

    
    backButton.update();
  }
  
  public void mouseReleased()
  {
    if (backButton.tryPress())
    {
      currentUser.round++;
      currentScreen = new MainScreen();
    }
  }
  public void keyPressed()
  {
  }
}
