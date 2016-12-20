//myMosaic
import java.io.File;
File folder;
File[] files;
String fileName;
PImage img;

int patternScale = 100;
int currentImg = 0;

void setup() {
	smooth();

	folder = new File(dataPath(""));
    files = folder.listFiles();
	frameRate(5);

}

void draw() {
	noStroke();
	fileName = files[currentImg].getName();
	img = loadImage(fileName);
	surface.setSize(img.width, img.height);

	if (patternScale <= 0) {
		frameRate(0.5);
		image(img, 0, 0);
		patternScale = 100;
		currentImg++;
	}
	else {
		frameRate(5);
		for (int x = 0; x < width; x += patternScale) {
			for (int y = 0; y < height; y += patternScale) {
				int imgX = (int)map(x, 0, width, 0, img.width);
				int imgY = (int)map(y, 0, height, 0, img.height);
				color c = img.get(imgX, imgY);
				fill(c);
				rect(x, y, patternScale, patternScale);
			}
		}
	}
	patternScale -= 5;

	if (currentImg == files.length) {
		currentImg = 0;
	}

	println("patternScale: " + patternScale + ", currentImg: " + currentImg);

}

void keyPressed()
{
	if (key == 's' || key == 'S') {
		saveFrame("myMosaic.png");
	}
}