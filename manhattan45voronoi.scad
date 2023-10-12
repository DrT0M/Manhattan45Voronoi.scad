module manhattan45voronoi(points, infinity=100, gap_size=1) 
{
	t = gap_size/2;
	s = t*tan(22.5);

	for(p0 = points)	//each point
	{
		translate(p0)
		intersection_for(p1 = points)	//check every neighbor
		{
			v = p1-p0;	//vector from p0 to p1
			mp = v/2;	//mid-point
			narrow2 = min([abs(mp[0]),abs(mp[1])]);	//half the narrower side
			ne = mp + [ narrow2	, narrow2];
			nw = mp + [-narrow2	, narrow2];
			sw = mp + [-narrow2	,-narrow2];
			se = mp + [ narrow2	,-narrow2];
			/*	-->  <	narrow2
				nw  ne
				  mp
				sw  se
				>  <--	narrow2
			 */
			//Lee 1980 Two-Dimensional Voronoi Diagrams in the Lp-Metric (Figure1)
			if		(mp[0]==0 &&	mp[1]==0)	//pts same
			{
			}
			else if	(mp[0] >0 &&	mp[1]==0)	//along x+
			{
				polygon([	[-infinity, infinity],
							[mp[0] - t, infinity],
							[mp[0] - t,-infinity],
							[-infinity,-infinity]]);
			}
			else if	(mp[0] >0 &&	mp[1] >0 &&	abs(mp[0]) >abs(mp[1]))	//octant 1
			{
				polygon([	//clockwise
					[se[0] - t,se[1] - s],
					[se[0] - t,-infinity],
					[-infinity,-infinity],
					[-infinity, infinity],
					[nw[0] - t, infinity],
					[nw[0] - t,nw[1] - s]
				]);
			}
			else if	(mp[0] >0 &&	mp[1] >0 &&	abs(mp[0])==abs(mp[1]))	//diag  NE
			{
				translate(mp)	rotate([0,0, 45])	translate([-infinity,-infinity])
					square([infinity-t,infinity*2]);
			}
			else if	(mp[0] >0 &&	mp[1] >0 &&	abs(mp[0])< abs(mp[1]))	//octant 2
			{
				polygon([	//clockwise
					[se[0] - s,se[1] - t],
					[ infinity,se[1] - t],
					[ infinity,-infinity],
					[-infinity,-infinity],
					[-infinity,nw[1] - t],
					[nw[0] - s,nw[1] - t]
				]);
			}
			else if	(mp[0]==0 &&	mp[1] >0)	//along y+
			{
				polygon([	[-infinity,mp[1] - t],
							[ infinity,mp[1] - t],
							[ infinity,-infinity],
							[-infinity,-infinity]]);
			}
			else if	(mp[0]< 0 &&	mp[1] >0 &&	abs(mp[0])< abs(mp[1]))	//octant 3
			{
				polygon([	//clockwise
					[ne[0] + s,ne[1] - t],
					[ infinity,ne[1] - t],
					[ infinity,-infinity],
					[-infinity,-infinity],
					[-infinity,sw[1] - t],
					[sw[0] + s,sw[1] - t]
				]);
			}
			else if	(mp[0]< 0 &&	mp[1] >0 &&	abs(mp[0])==abs(mp[1]))	//diag  NW
			{
				translate(mp)	rotate([0,0,135])	translate([-infinity,-infinity])
					square([infinity-t,infinity*2]);
			}
			else if	(mp[0]< 0 &&	mp[1] >0 &&	abs(mp[0]) >abs(mp[1]))	//octant 4
			{
				polygon([	//clockwise
					[ne[0] + t,ne[1] - s],
					[ne[0] + t, infinity],
					[ infinity, infinity],
					[ infinity,-infinity],
					[sw[0] + t,-infinity],
					[sw[0] + t,sw[1] - s]
				]);
			}
			else if	(mp[0]< 0 &&	mp[1]==0)	//along x-
			{
				polygon([	[ infinity,-infinity],
							[mp[0] + t,-infinity],
							[mp[0] + t, infinity],
							[ infinity, infinity]]);
			}
			else if	(mp[0]< 0 &&	mp[1]< 0 &&	abs(mp[0]) >abs(mp[1]))	//octant 5
			{
				polygon([	//clockwise
					[nw[0] + t,nw[1] + s],
					[nw[0] + t, infinity],
					[ infinity, infinity],
					[ infinity,-infinity],
					[se[0] + t,-infinity],
					[se[0] + t,se[1] + s]
				]);
			}
			else if	(mp[0]< 0 &&	mp[1]< 0 &&	abs(mp[0])==abs(mp[1]))	//diag  SW
			{
				translate(mp)	rotate([0,0,225])	translate([-infinity,-infinity])
					square([infinity-t,infinity*2]);
			}
			else if	(mp[0]< 0 &&	mp[1]< 0 &&	abs(mp[0])< abs(mp[1]))	//octant 6
			{
				polygon([	//clockwise
					[nw[0] + s,nw[1] + t],
					[-infinity,nw[1] + t],
					[-infinity, infinity],
					[ infinity, infinity],
					[ infinity,se[1] + t],
					[se[0] + s,se[1] + t]
				]);
			}
			else if	(mp[0]==0 &&	mp[1]< 0)	//along y-
			{
				polygon([	[-infinity, infinity],
							[-infinity,mp[1] + t],
							[ infinity,mp[1] + t],
							[ infinity, infinity]]);
			}
			else if	(mp[0] >0 &&	mp[1]< 0 &&	abs(mp[0])< abs(mp[1]))	//octant 7
			{
				polygon([	//clockwise
					[sw[0] - s,sw[1] + t],
					[-infinity,sw[1] + t],
					[-infinity, infinity],
					[ infinity, infinity],
					[ infinity,ne[1] + t],
					[ne[0] - s,ne[1] + t]
				]);
			}
			else if	(mp[0] >0 &&	mp[1]< 0 &&	abs(mp[0])==abs(mp[1]))	//diag  SE
			{
				translate(mp)	rotate([0,0,315])	translate([-infinity,-infinity])
					square([infinity-t,infinity*2]);
			}
			else if	(mp[0] >0 &&	mp[1]< 0 &&	abs(mp[0]) >abs(mp[1]))	//octant 8
			{
				polygon([	//clockwise
					[sw[0] - t,sw[1] + s],
					[sw[0] - t,-infinity],
					[-infinity,-infinity],
					[-infinity, infinity],
					[ne[0] - t, infinity],
					[ne[0] - t,ne[1] + s]
				]);
			}
		}
	}
//	manhattan45voronoi is licensed under
//	MIT License
//
//	Copyright (c) 2023 DrT0M
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//	
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//	SOFTWARE.
}

points=[
	[0,0],
	[-35.765,-1*31.143],
	[143.88,-1*-5.9296],
	[164.18,-1*9.9779],
	[180.18,-1*53.104],
	[32.863,-1*154.67],
	[22.826,-1*212.14],
	[8.9523,-1*253.02],
	[70.055,-1*204.11],
	[246.07,-1*156.85],
	[451.98,-1*262.06],
	[509.12,-1*277.11],
	[484.12,-1*429.39],
	[255.19,-1*452.06],
	[205.01,-1*345],
	[76.017,-1*291.04],
	[96,-1*356.89],
	[139.8,-1*463.01],
	[149.07,-1*519.77],
	[-22.954,-1*635.98]
];//https://en.wikipedia.org/wiki/File:Manhattan_Voronoi_Diagram.svg
//matches with 
//test_Manhattan45Voronoi_Diagram.png
//generated by
manhattan45voronoi(points, infinity=700, gap_size=4);
for(p=[0:len(points)-1])	translate(points[p]) color("black") cylinder(h=4,r=3);	//mark the points
//tab stop @ 4
