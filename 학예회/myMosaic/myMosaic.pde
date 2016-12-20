//myMosaic
import java.io.File;
File folder;
File[] files;
String fileName;
PImage img;

int patternScale = 100;
int currentImg = 0;

void setup() {
	fullScreen();
	smooth();

	folder = new File(dataPath(""));
    files = folder.listFiles();
    printArray(files);

}

void draw() {
	background(255);
	fileName = files[currentImg].getName();
	img = loadImage(fileName);
	showImage(img);
	showMosaic(img, patternScale);

}

void keyPressed()
{
	if (key == 's' || key == 'S') {
		saveFrame("myMosaic.png");
	}
}

void showImage(PImage img) {
	float w2h = (float)img.width / (float)img.height;

	imageMode(CENTER);
	if (img.width > img.height) {
		image(img, width / 2, height / 2, width, width / w2h);
	}
	else {
		image(img, width / 2, height / 2, height * w2h, height);
	}
	imageMode(CENTER);
}

void showMosaic(PImage img, int ps) {
	float w2h = (float)img.width / (float)img.height;

	if (img.width > img.height) {
		for (int y = 0; y < height; y += ps) {
			for (int x = 0; x < width; x += ps) {
				float diff = (img.height - img.width / w2h) / 2;
				int imgX = (int)map(x, 0, width, 0, img.width);
				int imgY = (int)map(y, 0, height, diff, img.height - diff);
				color c = img.get(imgX, imgY);
				fill(c);
				rect(x, y, ps, ps);
			}
		}
	}
	else {
		for (int y = 0; y < height; y += ps) {
			for (int x = 0; x < width; x += ps) {
				float diff = (img.height * w2h - img.width) / 2;
				int imgX = (int)map(x, 0, width, diff, img.width - diff);
				int imgY = (int)map(y, 0, height, 0, img.height);
				color c = img.get(imgX, imgY);
				fill(c);
				rect(x, y, ps, ps);
			}
		}
	}
}