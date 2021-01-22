StringList Teams = new StringList("FCN", "AGF", "BIF", "FCM", "SDR", "VFF", "RFC", "EFB", "HOB", "OB", "FCK", "AAB");
class Odds
{
  //String A;
  //String B;
  float odds_A;
  float odds_B;
  float odds_draw;
  Odds(String home, String away)
  {
    //this.A = A;
    //this.B = B;
    Team homeTeam = new Team(home);
    Team awayTeam = new Team(away);
    
    //HashMap<String, Team> Teams= CreateTeams();
    odds_A = (awayTeam.points*awayTeam.points)/(homeTeam.points*homeTeam.points)+1;
    odds_B = ((homeTeam.points*homeTeam.points)/(awayTeam.points*awayTeam.points))+1;
    odds_draw = homeTeam.draws/198+1; 
  }
}
/*
HashMap<String, Team> CreateTeams()
{
  HashMap<String, Team> teams = new HashMap<String, Team>();
  for(int i  = 0; i < Teams.size(); i++)
  {
    teams.put(Teams.get(i), new Team(Teams.get(i)));
  }
  return(teams);
}
*/
