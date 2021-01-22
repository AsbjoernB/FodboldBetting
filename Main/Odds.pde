
class Odds
{
  float odds_A;
  float odds_B;
  float odds_draw;
  
  Odds(String home, String away)
  {
    Team homeTeam = teamDatabase.Teams.get(home);
    Team awayTeam = teamDatabase.Teams.get(away);
    
    odds_A = (awayTeam.points*awayTeam.points)/(homeTeam.points*homeTeam.points)+1;
    odds_B = ((homeTeam.points*homeTeam.points)/(awayTeam.points*awayTeam.points))+1;
    odds_draw = homeTeam.draws/198+1; 
  }
}
