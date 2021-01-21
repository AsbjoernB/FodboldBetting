StringList Teams = new StringList("FCN", "AGF", "BIF", "FCM", "SDR", "VFF", "RFC", "EFB", "HOB", "OB", "FCK", "AAB");
class Odds
{
  String A;
  String B;
  Odds(String A, String B)
  {
    this.A = A;
    this.B = B;
    CreateTeams();
    
    
  }
}
  void CreateTeams()
{
  HashMap<String, Team> teams = new HashMap<String, Team>();
  for(int i  = 0; i < Teams.size(); i++)
  {
    teams.put(Teams.get(i), new Team(Teams.get(i)));
  }
}
