class TripleButton extends Button
{
  // den valgte mulighed er enten 0, 1 eller 2
  public int selectedOption = -1;
  
  color selectedCol;
  String[] texts;
  
  public TripleButton(PVector position, PVector dimensions, String[] texts, color col, color hoverCol, color selectedCol)
  {
    super(position, dimensions, texts[0], col, hoverCol);
    
    this.texts = texts;
    this.selectedCol = selectedCol;
  }
  
  public void update()
  {
    // tegner hver af de tre knapper
    for (int i = 0; i < 3; i++)
    {
      // sætter farven alt efter om knappen er valgt og om musen er over den eller ej
      if (i == selectedOption)
        fill(selectedCol);
      else if (mouseX >= position.x + i*dimensions.x/3 && mouseX <= position.x + (i+1)*dimensions.x/3 && 
               mouseY >= position.y && mouseY <= position.y + dimensions.y)
        fill(hoverCol);
      else
        fill(col);
      rect(position.x + i*dimensions.x/3, position.y, dimensions.x/3, dimensions.y);
      
      // text på hver af knapperne
      fill(textCol);
      textAlign(CENTER, CENTER);
      text(texts[i], position.x + i*dimensions.x/3 + dimensions.x/6, position.y + dimensions.y/2);
    }
  }
  
  // forsøger at trykke på knappen. Returnerer true hvis musen er inden for knappen
  public boolean tryPress()
  {
    for (int i = 0; i < 3; i++)
    {
      if (mouseX >= position.x + i*dimensions.x/3 && mouseX <= position.x + (i+1)*dimensions.x/3 && 
        mouseY >= position.y && mouseY <= position.y + dimensions.y)
      {
        if (selectedOption == i)
          selectedOption = -1;
        else
          selectedOption = i;
          
        return true;
      }
    }
    return false;
    
  }
  
}
