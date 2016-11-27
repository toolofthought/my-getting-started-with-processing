//myRectPatternOnCaptureRevisited
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

	String[] cameras = Capture.list();
	println(cameras[0]);
	cam = new Capture(this, cameras[0]);
	//cam = new Capture(this, width, height);
	cam.start();
	//noLoop();
}

void draw() {
	if (cam.available()) {
		cam.read();
		cam.loadPixels();
		noStroke();
		for (int x = 0; x < cam.width; x += patternScale) {
			for (int y = 0; y < cam.height; y += patternScale) {
				int location = (cam.width - x - 1) + y * cam.width;
				color c = cam.pixels[location];
				fill(c);
				rect(x, y, patternScale, patternScale);
			}
		}
	}
}

void keyPressed()
{
	if (key == 's' || key == 'S') {
		saveFrame("myRectPatternOnCaptureRevisited.png");
	}
}