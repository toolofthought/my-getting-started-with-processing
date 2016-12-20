//myMosaic
import java.io.File;
File folder;
File[] files;
String fileName;
PImage img;

int patternScale = 100;
int currentImg = 0;

float screenX;
float screenY;
float screenW;
float screenH;

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

  float w2h = (float)img.width / (float)img.height;
  if (img.width > img.height) {
    screenX = 0;
    screenY = height / 2 - width / w2h / 2;
    screenW = width;
    screenH = width / w2h;
  }
  else {
    screenX = width / 2 - height * w2h / 2;
    screenY = 0;
    screenW = height * w2h;
    screenH = height;
  }
  
  if (patternScale <= 0) {
    frameRate(0.2);
    image(img, screenX, screenY, screenW, screenH);
    patternScale = 100;
    currentImg++;
  }
  else {
    frameRate(1);
    for (int y = (int)screenY; y < screenY + screenH; y += patternScale) {
      for (int x = (int)screenX; x < screenX + screenW; x += patternScale) {
        int imgX = (int)map(x, screenX, screenX + screenW, 0, img.width);
        int imgY = (int)map(y, screenY, screenY + screenH, 0, img.height);
        color c = img.get(imgX, imgY);
        fill(c);
        noStroke();
        rect(x, y, patternScale, patternScale);
      }
    }
  }
  patternScale -= 5;
	
	if (currentImg == files.length) {
		currentImg = 0;
	}

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