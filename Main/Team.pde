class Team
{
  int dubs = 0, goals = 0;
  float points;
  String TN;
  Team(String TeamName)
  {
    TN = TeamName;
  }
  MatchDatabase m = new MatchDatabase();
  {
    for (Match match : m.Matches)
    {
      if (TN == match.homeTeam)
      {
        if (match.homeGoals > match.awayGoals)
        {
          dubs++;
        }
        goals = goals + match.homeGoals;
      } else
      {
        if (match.awayGoals > match.homeGoals)
        {
          dubs++;
        }
        goals = goals + match.awayGoals;
      }
    }
    points = goals*0.5+dubs*2;
  }
}
