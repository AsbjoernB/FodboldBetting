// laver en arrayliste af typen button. button input (x-koorinat til placering, y-koordinat til placering, tekst på knap)
ArrayList<Button> button = new ArrayList<Button>();
TextBox txt = new TextBox(new PVector(300, 300), new PVector(200, 30), true);
void setup()
{
  size(600, 400);
  background(0);
  button.add(new Button(100, 50, "KnapKnap"));
  button.add(new Button(100, 120, "Knap"));
  
  Team FCN = new Team("FCN");
  println(FCN.points, FCN.dubs, FCN.goals);
}

void draw()
{  
  background(200);
  for (Button knap : button) { 
    knap.update();
  }
  txt.update();
  
}
void keyPressed()
{
  txt.keyPressed();
}
void mousePressed()
{
  txt.mousePressed();
}
