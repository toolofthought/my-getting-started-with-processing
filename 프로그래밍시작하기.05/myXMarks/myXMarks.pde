import processing.pdf.*;
boolean savePDF = false;

void setup() {
    size(480, 360);
    smooth();
    background(255);

}

int grid = 40;

void draw() {
    if(savePDF) {
      beginRecord(PDF, "myXMarks.pdf");
    }
    
    for (int y = grid; y + 2 * grid <= height; y = y + 2 * grid) {
        for (int x = grid; x + 2 * grid <= width; x = x + 2 * grid) {
          line(x, y, x + grid, y + grid);
          line(x + grid, y, x, y + grid);
        }
   }


    
    if(savePDF) {
        savePDF = false;
        endRecord();
    }
}

void mousePressed() {
    savePDF = true;
    saveFrame("myXMarks.jpg");
}