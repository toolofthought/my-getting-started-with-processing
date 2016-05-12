//myMap
float mouseWheelMove = 0.1;
float zoom = 1.0;
PShape map;
float centerX;
float centerY;

void setup() {
  map = loadShape("Administrative_divisions_map_of_South_Korea_no_viewBox.svg");
  shapeMode(CENTER);
  size(509, 717);
  centerX = width / 2.0;
  centerY = height / 2.0;
}

void draw() {
  background(#B9B9B9);
  scale(zoom);
  shape(map, centerX, centerY);
  println(zoom);
  
}

void mouseWheel(MouseEvent event) {
  zoom -= mouseWheelMove * event.getCount();
  zoom = constrain(zoom, 0.2, 3.0);
}

void keyPressed() {
    if (key == 's' || key == 'S') {
        saveFrame("myMap####.jpg");
    }
}