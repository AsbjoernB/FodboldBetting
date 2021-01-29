class UserData {
  String username;
  float money;
  int round;
  String userData;
  int userNum=-1;
  float startAmount = 1000;
  String[] newlines;
  UserData(String username) {
    this.username = username;
    String[] lines = loadStrings("data/UserData.txt");
    String[] names = new String[lines.length];
    for (int j=0; j<lines.length; j++) {
      for (int i=0; i<lines[j].length(); i++) {
        if (lines[j].charAt(i)==',') {
          names[j]=(lines[j].substring(0, i));
          break;
        }
      }
    }
    for (int i=0; i<names.length; i++) {
      if (names[i].substring(0).equals(username)) {
        userNum=i;
        userData=lines[i];
        String userdata[]=split(userData,",");
        money=float(userdata[1]);
        round=int(userdata[2]);
      }
    }
    if (userNum==-1) {
      newlines = new String[lines.length+1];
      for (int i =0; i< newlines.length-1; i++) {
        newlines[i]=lines[i];
      }
      newlines[newlines.length-1]= username+","+startAmount+",1";
      money=startAmount;
      userNum=newlines.length-1;
      saveStrings("data/UserData.txt", newlines);
    }
    else{
      newlines=lines;
    }
    
  }
  // funktion til at tilføje penge, eller trække penge fra brugerens beløb
  void moneyRefresh(float addmoney) {
    money = money + addmoney;
    dataRefresh(money, round);
  }
  void nextround() {
    round++;
    dataRefresh(money, round);
  }
  void dataRefresh(float money, int round){
    newlines[userNum]=username+","+money+","+round;
    saveStrings("data/UserData.txt", newlines);
  }
}
