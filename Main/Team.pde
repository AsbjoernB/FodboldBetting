class Team
{
  int dubs = 0, goals = 0;
  float points;
  String teamName;
  
  Team(String TeamName)
  {
    
    teamName = TeamName;
    
    // går igennem alle kampe
    for (Match match : matchDatabase.Matches)
    {
      // hvis holdet har spillet i kampen på hjemmebane, bliver kampens mål tilføjet til deres samlede mål.
      // Hvis de vandt, tilføjes det også til deres samlede antal vundne kampe
      if (teamName.equals(match.homeTeam))
      {
        goals = goals + match.homeGoals;
        if (match.homeGoals > match.awayGoals)
        {
          dubs++;
        }
        continue;
      }
      
      // det samme som før men for udebane
      else if (teamName.equals(match.awayTeam))
      {
        goals = goals + match.awayGoals;
        if (match.awayGoals > match.homeGoals)
        {
          dubs++;
        }
        continue;
      }
    }
    
    // udregner point
    points = goals*0.5+dubs*2;
  }
}
