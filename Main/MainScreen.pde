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
    
    resultButton = new Button(new PVector(nx, ny), new PVector(nw, nh), "Resultat",  color(0,200,200), color(0,255,255), color(0));
   
   // henter alle kamper i den runde, brugeren er nået til
    matches = matchDatabase.GetRoundMatches(currentUser.round);
    
    // beregner odds for alle kampe
    odds = new Odds[6];
    for (int i = 0; i < 6; i++)
    {
      odds[i] = new Odds(matches[i].homeTeam, matches[i].awayTeam);
    }
    
    // laver knapper til at bette på hver kamp
    tripleButtons = new TripleButton[6];
    for(int i=0; i<6; i++){
      tripleButtons[i] = new TripleButton(new PVector(800,my+mh/10 + 75*i), new PVector(200, mh-mh/5), new String[]{nfc(odds[i].homeOdds, 2), nfc(odds[i].drawOdds, 2), nfc(odds[i].awayOdds, 2)}, color(115,240,130),color(100,200,100),color(150,255,200));
    }
    
    // laver inputfelter til at skrive pengene, man byder, ind
    moneyInputs = new TextBox[6];
    for (int i = 0; i < 6; i++)
    {
      moneyInputs[i] = new TextBox(new PVector(mw/2, my + mh*2/10 + 75*i), new PVector(mw/10,mh*6/10), true, str(0)); 
    }
    
    
  }
  
  public void update()
  {
    // titel
    textAlign(LEFT, CENTER);
    textSize(65);
    fill(255);
    text("BET PÅ RUNDE "+currentUser.round, mx, uy+uh/2);
    fill(0);
    
    
    textSize(14);
    
    // nuværende penge
    textAlign(CENTER, CENTER);
    fill(190, 250, 200);
    rect(ax, ay, aw, ah);
    fill(249,166,2);
    text("Penge: " + nfc(currentUser.money, 2) + " skejs", ax+aw/2,ay+ah/2);
    
    // brugernavn
    fill(190, 250, 200);
    rect(ux, uy, uw, uh);//user
    fill(0);
    text("Bruger: "+currentUser.username, ux+uw/2,uy+uh/2);
    
    // data om kampen
    textAlign(LEFT, CENTER);
    for(int i=0; i<6; i++){ // matches 
      fill(190, 250, 200);
      rect(mx,my+75*i,mw,mh);
      fill(0);
      textSize(24);
      text(matches[i].homeTeam+" - "+matches[i].awayTeam, mx*2,my+75*i+mh/3);
      textSize(17);
      text(matches[i].weekday+"dag d. "+matches[i].day+"/"+matches[i].month+" "+matches[i].year+ " kl. "+matches[i].hour+":"+nf(matches[i].minute,2), mx*2,my+75*i+2*(mh/3));  
    }

    
    // opdaterer kontrolelementer
    for (TripleButton tp : tripleButtons)
    {
      tp.update();
    }
    for (TextBox tb : moneyInputs)
    {
      tb.update();
    }
    resultButton.update();
  }
 
  // opdaterer kontrolelementer når der klikkes med musen
  public void mouseReleased()
  {
    if (resultButton.tryPress())
    {
      ArrayList<Bet> bets = new ArrayList<Bet>();
      for (int i = 0; i < matches.length; i++)
      {
        // tilføjer kun bettet til resultatskærmen hvis inputtet er gyldigt
        if (tripleButtons[i].selectedOption != -1 && float(moneyInputs[i].value) > 0)
        {
          bets.add(new Bet(matches[i], tripleButtons[i].selectedOption, float(moneyInputs[i].value)));
        }
      }
      currentUser.round++;
      if (currentUser.round > 33)
        currentUser.round = 1;      
      currentScreen = new ResultScreen(bets.toArray(new Bet[bets.size()]));
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
  
  // opdaterer det aktive tekstfelt
  public void keyPressed()
  {
    for (TextBox tb : moneyInputs)
    {
      tb.keyPressed();
    }
  }
}
