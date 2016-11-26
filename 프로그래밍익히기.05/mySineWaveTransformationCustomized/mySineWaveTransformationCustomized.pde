//mySineWaveTransformationCustomized

PImage source;
PShape target;

int stepX = 3;
int stepY = 20;
int myBrightness;
int inverseMyBrightness;
float frequency;
float amplitude;
float theta;

void setup() {
	source = loadImage("Rachel-Carson.jpg");
	source.filter(GRAY);
	source.filter(BLUR, 2);
	noFill();
	stroke(100, 20, 20);
	background(255);

	target = createShape(GROUP);
}

void draw() {
	 //size()함수 대신 surface.setsize()
	 surface.setSize(source.width, source.height);
	 //image(source, 0, 0);


	 strokeWeight(1);
	 for (int y = 0; y < height; y += stepY) {
		 PShape line = createShape(PShape.PATH);
		 line.beginShape();
		 theta = 0.0;
		 for (int x = 0; x < width; x += stepX) {
			 myBrightness = (int)brightness(source.get(x, y));
			 inverseMyBrightness = 255 - myBrightness;
			 frequency = map(inverseMyBrightness, 0, 255, 0, 3);
			 amplitude = map(inverseMyBrightness, 0, 255, 0, stepY);
			 theta += frequency;
			 line.vertex(x, y + sin(theta) * amplitude);
		 }
		 line.endShape();
		 target.addChild(line);
	 }

	 shape(target, 0, 0);
}

void keyPressed() {
	if (key == 's' || key == 'S') {
		saveFrame("mySineWaveTransformationCustomized.png");
	}
}