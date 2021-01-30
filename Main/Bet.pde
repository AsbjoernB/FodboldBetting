class Bet
{
  public Match match;
  public Odds odds;
  public int guess;
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
    if (res == 1)
      return money * odds.drawOdds - money;
    if (res == 2)
      return money * odds.awayOdds - money;
    
    // not possible
    return -money;
  }
}
