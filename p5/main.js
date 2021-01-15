let json = {}; // new  JSON Object

json.id = 0;
json.species = 'Panthera leo';
json.name = 'Lion';

function setup() {
createCanvas(100, 100);
background(200);
text('click here to save', 10, 10, 70, 80);
}

function mousePressed() {
	if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
	  saveJSON(json, 'lion.json');
	}
}
/*
function setup() {
  createCanvas(400, 400);
  //MatchDatabase.loadMatches();
}

function draw() {
  background(0);
  //text(MatchDatabase.allMatches[0], 100, 100)
  fill(255);
  //text(MatchDatabase.loadMatches(), 100, 100);
}
/*
class Bruh
{
	static foo()
	{
		return "yo";
	}
}
*/