import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(200,200); 
 
}


void draw() {
  if (savePDF) {
    beginRecord(PDF, "skull.pdf");
  }
  background(0,0,0);
  
  noStroke();
  fill(188,13,168);
  rect(40,50,10,10); 
  rect(30,60,20,10);
  rect(50,70,10,10);
  rect(70,70,50,20);
  rect(130,70,10,10);
  rect(140,60,20,10);
  rect(140,50,10,10);
  rect(60,80,10,30);
  rect(120,80,10,30);
  rect(90,90,10,10);
  rect(80,100,30,10);
  rect(60,110,30,10);
  rect(100,110,30,10);
  rect(50,120,10,10);
  rect(70,120,50,10);
  rect(130,120,10,10);
  rect(30,130,20,10);
  rect(40,140,10,10);
  rect(140,130,20,10);
  rect(140,140,10,10);
  rect(70,130,10,10);
  rect(90,130,10,10);
  rect(110,130,10,10);

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased(){
  if (key == 'p' || key == 'P') savePDF = true;
}