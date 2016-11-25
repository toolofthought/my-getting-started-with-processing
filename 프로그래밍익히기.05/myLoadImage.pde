//myLoadImage

PImage source;
PImage target;

void setup() {
	size(800, 600);
	background(255);

	source = loadImage("Rachel-Carson.jpg");
}

void draw() {
  image(source, 0, 0);

}