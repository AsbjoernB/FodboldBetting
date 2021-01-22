class Button
{
  PVector position;
  PVector dimensions;
  String text;
  color col;
  color hoverCol;
  color textCol;
  
  public Button(PVector position, PVector dimensions, String text, color col, color hoverCol)
  {
    this.position = position;
    this.dimensions = dimensions;
    this.text = text;
    this.col = col;
    this. hoverCol = hoverCol;
    
    if ((red(col)+green(col)+blue(col))/3 > 127)
      textCol = color(0);
    else
      textCol = color(255);
  }
  public Button(PVector position, PVector dimensions, String text, color col, color hoverCol, color textCol)
  {
    this.position = position;
    this.dimensions = dimensions;
    this.text = text;
    this.col = col;
    this. hoverCol = hoverCol;
  }
  
  public void update()
  {
    if (mouseX >= position.x && mouseX <= position.x + dimensions.x && 
      mouseY >= position.y && mouseY <= position.y + dimensions.y)
      fill(hoverCol);
    else
      fill(col);
    rect(position.x, position.y, dimensions.x, dimensions.y);
    
    fill(textCol);
    textAlign(CENTER, CENTER);
    text(text, position.x+(dimensions.x/2), position.y+(dimensions.y/2));
    
  }
  public boolean tryPress()
  {
    if (mouseX >= position.x && mouseX <= position.x + dimensions.x && 
        mouseY >= position.y && mouseY <= position.y + dimensions.y)
        return true;
        
    return false;
  }
  
}

/* gammel button
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
*/
