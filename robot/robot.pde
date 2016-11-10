void setup() {
  size(800, 600);
  background(255);
}

void draw() {
  background(255);
  //face
  rect(80, 80, 100, 100);
  //eyes
  rect(100, 100, 20, 40);
  rect(140, 100, 20, 40);
  //neck
  ellipse(130, 190, 20, 20);
  //body
  triangle(130, 200, 80, 280, 180, 280);
  //arm
  ellipse(112, 210, 20, 20);
  rect(80, 205, 20, 20);
  rect(60, 210 ,20, 20);
  triangle(60, 215, 40, 230, 60, 230);
  ellipse(150, 210, 20, 20);
  rect(160, 205, 20, 20);
  rect(180, 210, 20, 20);
  triangle(200, 215, 220, 230, 200, 230);
  //leg
  rect(90, 280, 20, 80);
  rect(150, 280, 20, 80);
}

  void keyPressed() {
    saveFrame("Robot####.jpg");
  }