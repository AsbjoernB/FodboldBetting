class Button {
  PVector placement = new PVector(0, 0); //---- koordinater til knap
  PVector unPressed = new PVector(10, 10); //-- forskydning af den lyse del af knappen (toppen af knappen)
  PVector buttonSize; //----------------------- en vektor der angiver højde og bredde på knappen
  String text; //------------------------------ den tekst der skal stå på knappen
  float tw; //--------------------------------- bredden på teksten på knappen ('tw' kort for 'textwidth')
  boolean buttonPressed; //-------------------- tjekker om knappen lige er blevet sluppet
  int numButtonPress; //----------------------- tæller 1 op når knappen lige er blevet sluppet (tæller hvor mange kanppen den er blevet trykket på)
  //-------------------------------------------------------------------
  Button(float px, float py, String t) { //---- Constructor der henter 1: x-koordinat til knap, 2: y-koordinat til knap, 3: tekst på knap
    placement.x = px;
    placement.y = py;
    text = t;
    tw = text.length()*10;
    print(tw);
    buttonSize = new PVector(50+tw, 50);
  }
  void update() {
    textSize(20);
    textAlign(CENTER);
    fill(100, 160, 160);
    rect(placement.x, placement.y, buttonSize.x, buttonSize.y, 10);
    fill(160, 230, 230);
    rect(placement.x+unPressed.x, placement.y-unPressed.y, buttonSize.x, buttonSize.y, 10);
    fill(100, 160, 160);
    text(text, placement.x+unPressed.x+buttonSize.x/2, placement.y-unPressed.y+buttonSize.y/2+10);
    if (mousePressed) {
      if (mouseX>placement.x && mouseX<placement.x+buttonSize.x && mouseY>placement.y && mouseY<placement.y+buttonSize.y) {
        unPressed.x=0;
        unPressed.y=0;
        buttonPressed = true;
      }
    }
    if (mousePressed==false) {
      unPressed.x=10;
      unPressed.y=10;
      if (buttonPressed) {
        numButtonPress++;
        buttonPressed=false;
      }
    }
    text (numButtonPress, 400, placement.y+buttonSize.y/2);
  }
} 
