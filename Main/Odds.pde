StringList Teams = new StringList("FCN", "AGF", "BIF", "FCM", "SDR", "VFF", "RFC", "EFB", "HOB", "OB", "FCK", "AAB");
class Odds
{
  String A;
  String B;
  float odds_A;
  float odds_B;
  float odds_draw;
  Odds(String A, String B)
  {
    this.A = A;
    this.B = B;
    HashMap<String, Team> Teams= CreateTeams();
    odds_A = (Teams.get(B).points*Teams.get(B).points)/(Teams.get(A).points*Teams.get(A).points)+1;
    odds_B = ((Teams.get(A).points*Teams.get(A).points)/(Teams.get(B).points*Teams.get(B).points))+1;
    odds_draw = Teams.get(A).draws/198+1; 
//    println("The amount of draws is: "+Teams.get("FCN").draws);
  }
}
  HashMap<String, Team> CreateTeams()
{
  HashMap<String, Team> teams = new HashMap<String, Team>();
  for(int i  = 0; i < Teams.size(); i++)
  {
    teams.put(Teams.get(i), new Team(Teams.get(i)));
  }
  return(teams);
}
