import processing.pdf.*;
boolean savePDF = false;

void draw(){
  if(savePDF)
  {
    beginRecord(PDF, "squashed_ellipse_rect.pdf");
  }
  
  ellipse(50, 50, 60, 30);
  rect(30, 30, 40, 20);
  
  if(savePDF)
  {
    savePDF = false;
    endRecord();
  }
}

void keyReleased()
{
  if (key == 'p' || key == 'P')
  {
    savePDF = true;
  }
}