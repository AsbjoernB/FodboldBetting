public class MainScreen extends Screen
{
  int ax, ay, aw, ah; // amount placement and size
  int ux, uy, uw, uh; // user placement and size
  int mx, my, mw, mh; // matches placement and size
  
  TextBox bettingAmount;
  
  Button resultButton;
  int Odds;
  Odds odds_A;
  TripleButton tp;
  
  public MainScreen(){
    bettingAmount = new TextBox(new PVector(50, 600), new PVector(200, 60), true);
    resultButton = new Button(new PVector(1030, 600), new PVector(200, 60), "Resultat", color(115,240,130),color(100,200,100), color(0));
    ax=1030;  ay=20;  aw=200;  ah=60;
    ux=800;  uy=20;  uw=200;  uh=60;
    mx=50; my = 100; mw=1180; mh=70;
    
    //for(int i=0; i<0; i++){
    tp = new TripleButton(new PVector(800,108), new PVector(200, 50), new String[]{"2","3","5"}, color(115,240,130),color(100,200,100),color(150,255,200));
    //}
  }
  
  public void update()
  {
    textSize(17);
    textAlign(CENTER, CENTER);
    Match[] match = matchDatabase.GetRoundMatches(currentUser.round+1);
    for(int i=0; i<6; i++){ // matches 
      fill(190, 250, 200);
      rect(mx,my+75*i,mw,mh);
      fill(0);
      text("Kamp "+(i+1)+": "+match[i].homeTeam+" - "+match[i].awayTeam+"  "+match[i].weekday+" den "+match[i].day+"/"+match[i].month+" "+match[i].year+ " kl: "+match[i].hour+":"+match[i].minute, mx+mw/5,my+75*i+mh/2);
    }
    fill(190, 250, 200);
    rect(ax, ay, aw, ah);//amount
    fill(0);
    text("Penge: " + currentUser.money + " skejs", ax+aw/2,ay+ah/2);
    
    fill(190, 250, 200);
    rect(ux, uy, uw, uh);//user
    fill(0);
    text("Bruger: "+currentUser.username, ux+uw/2,uy+uh/2);    
    bettingAmount.update();
    resultButton.update();
    tp.update();
    textSize(11);
  }
  
  public void mouseReleased()
  {
    bettingAmount.mouseReleased();
    if (resultButton.tryPress())
    {
      currentScreen = new ResultScreen();
    }
    tp.tryPress();
  }
  
  public void keyPressed()
  {
    bettingAmount.keyPressed();
  }
}
