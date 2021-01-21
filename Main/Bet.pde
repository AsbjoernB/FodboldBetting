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
    
  }
}
