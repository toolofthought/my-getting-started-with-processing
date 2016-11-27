//myRectPatternOnCapture
import processing.video.*;
Capture cam;

int patternScale = 10;
int nX;
int nY;

void setup() {
	size(640, 480);
	smooth();
	nX = width / patternScale;
	nY = height / patternScale;

	noFill();

	//String[] cameras = Capture.list();
	//println(cameras[0]);
	//cam = new Capture(this, cameras[0]);
	cam = new Capture(this);
	cam.start();
}

void draw() {
	if (cam.available()) {
		cam.read();
	}
	image(cam, 0, 0);

	stroke(0, 100);

	for (int y = 0; y < nY; y++){
		for (int x = 0; x < nX; x++) {
			rect(x * patternScale, y * patternScale, patternScale, patternScale);
		}
	}


}

void keyPressed()
{
	if (key == 's' || key == 'S') {
		saveFrame("myRectPatternOnCapture.png");
	}
}