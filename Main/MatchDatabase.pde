public class MatchDatabase
{
  public Match[] Matches;
  
  public MatchDatabase()
  {
    String[] lines = loadStrings("data/results.txt");
    
    // reserverer plads i hukommelsen for alle kampene
    Matches = new Match[lines.length];
    
    // looper igennem alle kampene i tekstfilen
    for (int i = 0; i < lines.length; i++)
    {
      // finder visse data, der ikke direkte kan tages ud af tekstfilen og kræver førbehandling
      String[] data = split(lines[i], ';');
      
      int round = int(data[0].substring(1));
      String[] date = split(data[2], '/');
      String[] time = split(data[3], '.');
      
      // udfylder et Match objekt og tilføjer det til listen
      Match m = new Match(
        round, // round
        data[1], // weekday
        
        // date
        int(date[0]), // dd
        int(date[1]), // mm
        int(date[2]), // yyyy
        
        int(time[0]), // hour
        int(time[1]), // minute
        
        data[4], // home team
        data[5], // away team
        int(data[6]), // home goals
        int(data[7]), // away goals
        
        int(data[8]) // spectator Count
        
      );
      Matches[i] = m;
      
    }
  }
  
  
  public Match[] GetRoundMatches(int round)
  {
    ArrayList<Match> roundMatches = new ArrayList<Match>();
    for (Match m : Matches)
    {
      if (m.round == round)
        roundMatches.add(m);
    }
    return roundMatches.toArray(new Match[roundMatches.size()]);
    
  }
}
