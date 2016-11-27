//myCapture
import processing.video.*;
Capture cam;

void setup() {
	size(640, 480);
	smooth();
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
}

void keyPressed()
{
	if (key == 's' || key == 'S') {
		saveFrame("myCapture.png");
	}
}