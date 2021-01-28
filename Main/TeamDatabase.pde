class TeamDatabase
{
  public StringList TeamNames = new StringList("FCN", "AGF", "BIF", "FCM", "SDR", "VFF", "RFC", "EFB", "HOB", "OB", "FCK", "AAB");
  public HashMap<String, Team> Teams;
  
  public TeamDatabase()
  {
    Teams = new HashMap<String, Team>();
    for(int i  = 0; i < TeamNames.size(); i++)
    {
      Teams.put(TeamNames.get(i), new Team(TeamNames.get(i)));
    }
    println(Teams.size());
  }
}
