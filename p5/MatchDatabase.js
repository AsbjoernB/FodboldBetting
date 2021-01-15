class MatchDatabase
{
	static loadMatches()
	{
		MatchDatabase.allMatches = [];
		let result = loadStrings('data/results.txt');
		//append(MatchDatabase.allMatches, "hej");
	}
}