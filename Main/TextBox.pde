public class TextBox
{
  public PVector position;
  public PVector dimensions;
  public boolean numbersOnly;
  public String value;
  
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
    if (keyPressed)
    {
      if (key == BACKSPACE)
        value = value.substring(0, value.length()-2);
      
      else if (numbersOnly && str(key).matches("[0-9]"))
      {
        value += key;
      }
      
      else
        value += key;
        
      print(value);
    }
  }
}
