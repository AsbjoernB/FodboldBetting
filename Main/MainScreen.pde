public class MainScreen extends Screen
{
  int ax, ay, aw, ah; // amount placement and size
  int ux, uy, uw, uh; // user placement and size
  int mx, my, mw, mh; // matches placement and size
  int nx, ny, nw, nh; // next-button (resultat) placement and size
  
  TextBox bettingAmount;
  
  Match[] matches;
  
  Button resultButton;
  Odds[] odds;
  TripleButton[] tripleButtons;
  TextBox[] moneyInputs;
  
  public MainScreen(){
    ax=1030;  ay=20;  aw=200;  ah=60;
    ux=800;  uy=20;  uw=200;  uh=60;
    mx=50; my = 100; mw=1180; mh=70;
    nx=1030; ny = 640; nw=200; nh=60;
    
    bettingAmount = new TextBox(new PVector(mx, ny), new PVector(nw, nh), true); // er placeret i forhold til de andre knapper og felter
    resultButton = new Button(new PVector(nx, ny), new PVector(nw, nh), "Resultat", color(115,240,130),color(100,200,100), color(0));
   
    println(currentUser.round);
    matches = matchDatabase.GetRoundMatches(currentUser.round);
    
    odds = new Odds[6];
    for (int i = 0; i < 6; i++)
    {
      odds[i] = new Odds(matches[i].homeTeam, matches[i].awayTeam);
    }
    tripleButtons = new TripleButton[6];
    for(int i=0; i<6; i++){
      tripleButtons[i] = new TripleButton(new PVector(800,108 + 75*i), new PVector(200, 50), new String[]{nfc(odds[i].odds_A, 2), nfc(odds[i].odds_draw, 2), nfc(odds[i].odds_B, 2)}, color(115,240,130),color(100,200,100),color(150,255,200));
    }
    
    
    moneyInputs = new TextBox[6];
    for (int i = 0; i < 6; i++)
    {
      moneyInputs[i] = new TextBox(new PVector(mw/2, my + mh*2/10 + 75*i), new PVector(mw/10,mh*6/10), true, str(0)); 
    }
    
    
  }
  
  public void update()
  {
    // title
    textAlign(LEFT, CENTER);
    textSize(65);
    fill(255);
    text("BET PÅ RUNDE "+currentUser.round, mx, uy+uh/2);
    fill(0);
    textSize(11);
    
    textAlign(LEFT, CENTER);
    Match[] match = matchDatabase.GetRoundMatches(currentUser.round);
    for(int i=0; i<6; i++){ // matches 
      fill(190, 250, 200);
      rect(mx,my+75*i,mw,mh);
      fill(0);
      textSize(24);
      text(match[i].homeTeam+" - "+match[i].awayTeam, mx*2,my+75*i+mh/3);
      textSize(17);
      text(match[i].weekday+"dag d. "+match[i].day+"/"+match[i].month+" "+match[i].year+ " kl. "+match[i].hour+":"+nf(match[i].minute,2), mx*2,my+75*i+2*(mh/3));  
    }
    for (TripleButton tp : tripleButtons)
    {
      tp.update();
    }
    for (TextBox tb : moneyInputs)
    {
      tb.update();
    }
    
    
    // current money
    textAlign(CENTER, CENTER);
    fill(190, 250, 200);
    rect(ax, ay, aw, ah);//amount
    fill(0);
    text("Penge: " + nfc(currentUser.money, 2) + " skejs", ax+aw/2,ay+ah/2);
    
    // username
    fill(190, 250, 200);
    rect(ux, uy, uw, uh);//user
    fill(0);
    text("Bruger: "+currentUser.username, ux+uw/2,uy+uh/2);
    
    // buttons
    bettingAmount.update();
    resultButton.update();
    

  }
  
  public void mouseReleased()
  {
    bettingAmount.mouseReleased();
    if (resultButton.tryPress())
    {
      Bet[] bets = new Bet[matches.length];
      for (int i = 0; i < matches.length; i++)
      {
        bets[i] = new Bet(matches[i], tripleButtons[i].selectedOption, float(moneyInputs[i].value));
      }
      currentUser.round++;
      if (currentUser.round > 33)
        currentUser.round = 1;      
      currentScreen = new ResultScreen(bets);
    }
    for (TripleButton tp : tripleButtons)
    {
      tp.tryPress();
    }
    for (TextBox tb : moneyInputs)
    {
      tb.mouseReleased();
    }
  }
  
  public void keyPressed()
  {
    bettingAmount.keyPressed();
    for (TextBox tb : moneyInputs)
    {
      tb.keyPressed();
    }
  }
}
