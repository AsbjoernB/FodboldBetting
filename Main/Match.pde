class Match
{
  int round;
  String weekday;
  int day;
  int month;
  int year;
  int hour;
  int minute;
  String homeTeam;
  String awayTeam;
  int homeGoals;
  int awayGoals;
  int spectatorCount;
  
  public Match(int round, String weekday, int day, int month, int year, int hour, int minute, String homeTeam, String awayTeam, int homeGoals, int awayGoals, int spectatorCount)
  {
    this.round = round;
    this.weekday = weekday;
    this.day = day;
    this.month = month;
    this.year = year;
    this.hour = hour;
    this.minute = minute;
    this.homeTeam = homeTeam;
    this.awayTeam = awayTeam;
    this.homeGoals = homeGoals;
    this.awayGoals = awayGoals;
    this.spectatorCount = spectatorCount;
  }
  public Match()
  {
  }
}
