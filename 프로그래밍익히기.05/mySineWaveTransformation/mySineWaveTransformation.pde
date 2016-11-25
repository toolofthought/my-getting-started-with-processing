//mySineWaveTransformation

PImage source;
PShape target;

int stepX = 1;
int stepY = 30;
int myAlpha;
int inverseMyAlpha;
float frequency;
float amplitude;

void setup() {
	source = loadImage("Rachel-Carson.jpg");
	source.filter(BLUR, 2);
	tint(255, 50);
	background(255);

	target = createShape(GROUP);
}

void draw() {
	//size()함수 대신 surface.setsize()
 	surface.setSize(source.width, source.height);
 	image(source, 0, 0);


 	strokeWeight(0.1);
 	for (int y = 0; y < height; y += stepX) {
 		PShape line = createShape(PShape.PATH);
 		line.beginShape();
 		for (int x = 0; x < width; x += stepY) {
 			myAlpha = (int)brightness(source.get(x, y));
 			inverseMyAlpha = 255 - myAlpha;
 			frequency = map(inverseMyAlpha, 0, 255, 1, 5);
 			amplitude = map(inverseMyAlpha, 0, 255, 1, 30);
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