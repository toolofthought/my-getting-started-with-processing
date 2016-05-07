import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(640, 480);
  smooth();
  strokeWeight(2);
  background(204);

}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "p5.pdf");
  }
  
  //neck
  stroke(102);
  line(266, 257, 266, 162);
  line(276, 257, 276, 162);
  line(286, 257, 286, 162);
  
  //antenna
  line(276, 155, 246, 112);
  line(276, 155, 306, 56);
  line(276, 155, 342, 170);
  
  //body
  noStroke();
  fill(102);
  ellipse(264, 377, 70, 70);
  fill(0);
  rect(219, 257, 90, 120);
  fill(102);
  rect(219, 274, 90, 6);
  
  //head
  fill(0);
  ellipse(276, 155, 80, 80);
  fill(255);
  ellipse(288, 150, 30, 30);
  fill(0);
  ellipse(288, 150, 10, 10);
  fill(153);
  ellipse(263, 148, 10, 10);
  ellipse(296, 130, 5, 5);
  ellipse(305, 162, 5, 5);

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}