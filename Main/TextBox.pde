public class TextBox
{
  public PVector position;
  public PVector dimensions;
  public boolean numbersOnly;
  public String value;
  public boolean isSelected = false;
  
  public TextBox(PVector position, PVector dimensions, boolean numbersOnly, String intialValue)
  {
    this.position = position;
    this.dimensions = dimensions;
    this.numbersOnly = numbersOnly;
    this.value = intialValue;
  }
  public TextBox(PVector position, PVector dimensions, boolean numbersOnly)
  {
    this.position = position;
    this.dimensions = dimensions;
    this.numbersOnly = numbersOnly;
    value = "";
  }
  
  public void update()
  {
    textAlign(LEFT, CENTER);
    
    if (isSelected)
      fill(255);
    else
      fill(210);
    rect(position.x, position.y, dimensions.x, dimensions.y);
    
    fill(0);
    text(value, position.x + 5, position.y + dimensions.y/2);
  }
  
  public void keyPressed()
  {
    if (isSelected)
    {
      if (key == BACKSPACE)
      {
        if (value.length() <= 0)
          return;
        value = value.substring(0, value.length()-1);
      }
      
      else if (key != CODED)
      {
        if (numbersOnly)
        {
          
          if (str(key).matches("[0-9]"))
            value += key;
            
        }
         
        else if (key != ENTER && key != RETURN)
          value += key;
      }
    }
    
  }
  
  public void mousePressed()
  {
    if (mouseX > position.x && mouseX < position.x + dimensions.x &&
        mouseY > position.y && mouseY < position.y + dimensions.y)
    {
      isSelected = true;
    }
    else
      isSelected = false;
  }
}
