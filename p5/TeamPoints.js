class Team
constructor(TeamName)
{
	this.TeamName = TeamName;
	this.points;
	this.goals;
	this.dubs;
}


function points()
{
	for(let i = 0; i < list.length; i++)
	{
		if(TeamName == Match_hometeam)
		{
			if(Match.homegoals > Match.awaygoals)
			{
				dubs = ++;
			}
			goals = goals + match.goalcount;
		}
		if(TeamName == Match_awayteam)
		{
			if(Match.awaygoals > Match.homegoals)
			{
				dubs = ++;
			}
			goals = goals + match.goalcount;
		}
	}
	points = (goals*0.5 + dubs*2)
}