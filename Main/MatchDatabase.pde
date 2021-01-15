public class MatchDatabase
{
  public ArrayList<Match> Matches;
  
  public MatchDatabase()
  {
    String[] lines = loadStrings("data/results.txt");
    for (String line : lines)
    {
      String[] data = split(line, ';');
      
      int round = int(data[0].substring(1));
      String[] date = split(data[2], '/');
      String[] time = split(data[3], '.');
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
      
    }
  }
}
