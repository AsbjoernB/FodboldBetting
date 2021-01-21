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
      return 0;
    
    if (res == 0)
      return money * odds.odds_A;
    if (res == 1)
      return money * odds.odds_draw;
    if (res == 2)
      return money * odds.odds_B;
    
    // not possible
    return 0;
  }
}
