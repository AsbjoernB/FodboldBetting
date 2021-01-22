class TripleButton extends Button
{
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
    for (int i = 0; i < 3; i++)
    {
      if (i == selectedOption)
        fill(selectedCol);
      else if (mouseX >= position.x + i*dimensions.x/3 && mouseX <= position.x + (i+1)*dimensions.x/3 && 
               mouseY >= position.y && mouseY <= position.y + dimensions.y)
        fill(hoverCol);
      else
        fill(col);
      rect(position.x + i*dimensions.x/3, position.y, dimensions.x/3, dimensions.y);
      
      fill(textCol);
      textAlign(CENTER, CENTER);
      text(texts[i], position.x + i*dimensions.x/3 + dimensions.x/6, position.y + dimensions.y/2);
    }
    /*
    if (mouseX >= position.x && mouseX <= position.x + dimensions.x && 
      mouseY >= position.y && mouseY <= position.y + dimensions.y)
      fill(hoverCol);
    else
      fill(col);
    rect(position.x, position.y, dimensions.x, dimensions.y);
    
    fill(textCol);
    textAlign(CENTER, CENTER);
    text(text, position.x+(dimensions.x/2), position.y+(dimensions.y/2));
    */
  }
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
