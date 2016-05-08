  //myTetrisRevisit
  void setup() {
    size(480, 360);
  }
  
  void draw() {
    background(255);
    translate(mouseX - 240, mouseY - 180);

    beginShape();
    vertex(240, 180);
    vertex(240, 120);
    vertex(300, 120);
    vertex(300, 240);
    vertex(180, 240);
    vertex(180, 180);
    endShape(CLOSE);
  }

void keyPressed(){
     if (key == 's' || key=='S') {
       saveFrame("myTetrisRevisit.jpg");
     }
}