public class MatchDatabase
{
  public ArrayList<Match> Matches;
  
  public MatchDatabase()
  {
    String[] lines = loadStrings("data/results.txt");
    for (String line : lines)
    {
      print(line);
    }
  }
}
