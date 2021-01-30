class Bet
{
  // kampen, der spilles på
  public Match match;
  // oddsene for kampen
  public Odds odds;
  // hvilket udfald, der gættes på
  public int guess;
  // hvor mange penge, der spilles med
  public float money;
  
  public Bet(Match match, int guess, float money)
  {
    this.match = match;
    this.guess = guess;
    this.odds = new Odds(match.homeTeam, match.awayTeam);
    this.money = money;
  }
  
  public float getPayout()
  {
    int res = match.getResult();
    
    if (guess != res)
      return -money;
    
    if (res == 0)
      return money * odds.homeOdds - money;
    else if (res == 1)
      return money * odds.drawOdds - money;
    else if (res == 2)
      return money * odds.awayOdds - money;
    
    // hvis det her sker er der gået noget seriøst galt
    return -money;
  }
}
