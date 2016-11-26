//mySineWaveTransformation

PImage source;
PShape target;

int stepX = 1;
int stepY = 50;
int myAlpha;
int inverseMyAlpha;
float frequency;
float amplitude;

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


	 strokeWeight(0.1);
	 for (int y = 0; y < height; y += stepY) {
		 PShape line = createShape(PShape.PATH);
		 line.beginShape();
		 for (int x = 0; x < width; x += stepX) {
			 myAlpha = (int)brightness(source.get(x, y));
			 inverseMyAlpha = 255 - myAlpha;
			 frequency = map(inverseMyAlpha, 0, 255, 1, 3);
			 amplitude = map(inverseMyAlpha, 0, 255, 0, stepY / 2);
			 line.vertex(x, y + sin(x * frequency) * amplitude);
		 }
		 line.endShape();
		 target.addChild(line);
	 }

	 shape(target, 0, 0);
}

void keyPressed() {
	if (key == 's' || key == 'S') {
		saveFrame("mySineWaveTransformation.png");
	}
}