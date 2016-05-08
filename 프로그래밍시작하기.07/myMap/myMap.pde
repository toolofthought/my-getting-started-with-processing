//myMap

PShape map;
float posX;
float posY;

void setup() {
  size(509, 717);
  map = loadShape("Administrative_divisions_map_of_South_Korea.svg");
}

void draw() {
  shape(map, 0, 0);

}

void keyPressed(){
     if (key == 's' || key=='S') {
       saveFrame("myTetrisRevisit.jpg");
     }
}