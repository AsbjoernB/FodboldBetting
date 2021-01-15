class UserData {
  String username;
  float money;
  float round;
  String userData;
  int userNum;
  UserData(String username) {
    this.username = username;
    String[] lines = loadStrings("data/UserData.txt");
    String[] names = new String[lines.length];
    for (int j=0; j<lines.length; j++) {
      for (int i=0; i<lines[j].length(); i++) {
        if (lines[j].charAt(i)==',') {
          names[j]=(lines[j].substring(0, i));
        }
      }
    }
    for (int i=0; i<names.length; i++) {
      if (names[i]==username) {
        userNum=i;
        userData=lines[i];
      }
    }
    if (userData=="") {
      ArrayList<String> newlines = new ArrayList<String>();
      for (String l : lines) {
        newlines.add(l);
      }
      newlines.add(username+",0,0");
      String[] addednewlines=new String[newlines.size()];
      for (int i=0; i<newlines.size();i++) {
        addednewlines[i]=newlines.get(i);
      }
      saveStrings("UserData.txt", addednewlines);
    }
  }
  // funktion til at tilføje penge, eller trække penge fra brugerens beløb
  void moneyRefresh(float addmoney) {
    money = money + addmoney;
  }
  void nextround() {
    round++;
  }
}
