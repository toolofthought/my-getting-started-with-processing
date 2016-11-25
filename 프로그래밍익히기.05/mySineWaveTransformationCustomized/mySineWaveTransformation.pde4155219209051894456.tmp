//myDetectBrightness

PImage source;
int sizeX = 30;
int sizeY = 30;
int myAlpha;

void setup() {
	source = loadImage("Rachel-Carson.jpg");
	source.filter(BLUR, 2);
}

void draw() {
	//size()함수 대신 surface.setsize()
 	surface.setSize(source.width, source.height);
 	image(source, 0, 0);
 	for (int y = 0; y < height; y += sizeX) {
 		for (int x = 0; x < width; x += sizeY) {
 			myAlpha = (int)brightness(source.get(x, y));
 			textSize(10);
 			fill(0);
		 	text(str(myAlpha), x, y);
 		}
 	}
}

void keyPressed() {
	if (key == 's' || key == 'S') {
		saveFrame("myDetectBrightness.png");
	}
}