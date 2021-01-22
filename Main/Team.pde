class Team
{
  int dubs = 0, goals = 0, draws = 0;
  float points;
  String teamName;
  Team(String TeamName)
  {
    teamName = TeamName;
    for (Match match : matchDatabase.Matches)
    {
      if (teamName.equals(match.homeTeam))
      {
        if (match.homeGoals > match.awayGoals)
        {
          dubs++;
        }
        goals = goals + match.homeGoals;
      }
      else if (teamName.equals(match.awayTeam))
      {
        if (match.awayGoals > match.homeGoals)
        {
          dubs++;
        }
        goals = goals + match.awayGoals;
      }
      if(match.awayGoals == match.homeGoals)
      {
        draws++;
      }
    }
    points = goals*0.5+dubs*2;
    
    println(teamName);
  }
}
