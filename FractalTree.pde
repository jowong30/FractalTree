private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  


public void setup() 
{   
	size(1200,700);    
	noLoop(); 
} 
public void draw() 
{   
	translate(0, 150);
	//background(242 ,72,15); 
	background(0);
	
	pond(600,550,600,300);
	
	for(int i=0; i<300;i++){
		noStroke();
		fill(600-i*2,400-i*2,10 , i);
		rect(-200,200,1500-(i*3),700);
	}

	rotate(PI/6);
	translate(100,-300);
	for(int i=0; i<300;i++){
		noStroke();
		fill(242 ,72,15, i);
		rect(-200,-200,1500,600- (i*7));
	}

	translate(-100, 300);
	rotate(-PI/6);

	

	drawBranches(600,500,150,3*Math.PI/2);  

	
	
} 

public void pond(int x,int y,int xx,int yy){
	
		
	for(int i=0; i<300; i++){
		
		



		noStroke();
		fill(i+150 ,0 + (i/3),15 ,100);
		ellipseMode(CENTER);
		ellipse(600+i/2,550,600-i,300-i);
	}
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle -  branchAngle;

	branchLength = branchLength*fractionLength;

	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);

	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);

	stroke(x-350,(x-300)/3,y/2);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);

	

	if(branchLength> smallestBranch){
		drawBranches(endX1,endY1, branchLength, angle1);
		drawBranches(endX2,endY2, branchLength, angle2);
	}else{
		return;
	}	
} 
