//myRectPattern

int patternScale = 10;
int nX;
int nY;

void setup() {
	size(480, 360);
	smooth();
	noFill();
	background(255);
	nX = width / patternScale;
	nY = height / patternScale;
}

void draw() {
	for (int y = 0; y < nY; y++){
		for (int x = 0; x < nX; x++) {

			rect(x * patternScale, y * patternScale, patternScale, patternScale);
		}
	}

}

void keyPressed()
{
	if (key == 's' || key == 'S') {
		saveFrame("myRectPattern.png");
	}
}