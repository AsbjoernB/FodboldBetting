class Team
{
  int dubs = 0, goals = 0, draws = 0;
  float points;
  String TN;
  Team(String TeamName)
  {
    TN = TeamName;
    MatchDatabase m = new MatchDatabase();
    for (Match match : m.Matches)
    {
      if (TN.equals(match.homeTeam))
      {
        if (match.homeGoals > match.awayGoals)
        {
          dubs++;
        }
        goals = goals + match.homeGoals;
      }
      else if (TN.equals(match.awayTeam))
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
    
    println(TN);
    points = goals*0.5+dubs*2;
  }
}
