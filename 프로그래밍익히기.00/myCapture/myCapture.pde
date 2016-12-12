//myCapture
import processing.video.*;
Capture cam;

int patternScale = 16;

void setup() {
	size(2560, 1440);
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
    cam.loadPixels();
  }
  	image(cam, 0, 0);
    noFill();
      for (int x = 0; x <cam.width; x += patternScale) {
            for (int y = 0; y < cam.height; y += patternScale) {
           int location = (cam.width - x - 1) + y * cam.width;
            color c = cam.pixels[location];
             fill(c);
             triangle(x-patternScale, y + patternScale * 2, x, y, x + patternScale, y + patternScale * 2);
        }
      }
    }
  



void keyPressed()
{
	if (key == 's' || key == 'S') {
		saveFrame("myCapture.png");
	}
}