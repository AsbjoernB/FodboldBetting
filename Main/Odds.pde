class Odds
{
  float homeOdds;
  float awayOdds;
  float drawOdds;
  
  Odds(String home, String away)
  {
    Team homeTeam = teamDatabase.Teams.get(home);
    Team awayTeam = teamDatabase.Teams.get(away);
    
    homeOdds = (awayTeam.points*awayTeam.points)/(homeTeam.points*homeTeam.points)+1;
    awayOdds = ((homeTeam.points*homeTeam.points)/(awayTeam.points*awayTeam.points))+1;
    drawOdds = max(homeOdds, awayOdds) / min(homeOdds, awayOdds);
  }
}
