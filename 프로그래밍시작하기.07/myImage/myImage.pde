PImage img;

float centerX;
float centerY;
float imageWidth;
float imageHeight;
float clickX;
float clickY;
float offsetX;
float offsetY;
float targetX;
float targetY;

float zoom = 1.0;

void setup() {
  size(480, 360);
  img = loadImage("image.jpg");
  imageWidth = img.width;
  imageHeight = img.height;

  centerX = width / 2.0;
  centerY = height / 2.0;
  imageMode(CENTER);
}

void draw() {
  translate(centerX, centerY);
  scale(zoom);
  image(img, 0, 0);
}

void mousePressed() {
  clickX = mouseX;
  clickY = mouseY;
}

void mouseDragged() {
  offsetX = mouseX - clickX;
  offsetY = mouseY - clickY;
  targetX = clickX + offsetX;
  targetY = clickY + offsetY;
  centerX += (targetX - centerX);
  centerY += (targetY - centerY);
  println("(" + centerX + ", " + centerY + ")");
}

void mouseWheel(MouseEvent e) {
  println(e.getCount());
}

void keyPressed() {
  if (key == 'i' || key == 'I') {
    zoom += 0.2;
  }
  if (key == 'o' || key == 'O') {
    zoom -= 0.2;
  }
  constrain(zoom, 0.1, 4.0);
  
  if (key == 's' || key == 'S') {
      saveFrame("myImage####.jpg");
  }
}

  
  