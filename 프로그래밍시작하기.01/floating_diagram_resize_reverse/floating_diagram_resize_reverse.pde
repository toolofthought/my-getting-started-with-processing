import processing.pdf.*;
boolean savePDF = false;

void draw(){
  if(savePDF)
  {
    beginRecord(PDF, "floating_diagram_reverse.pdf");
  }
  
  ellipse(mouseX, mouseY, 100 - mouseX, 100 - mouseY);
    
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