import processing.pdf.*;
boolean savePDF = false;

void draw(){
  if(savePDF)
  {
    beginRecord(PDF, "floating_diagram_resize.pdf");
  }
  
  ellipse(mouseX, mouseY, mouseX, mouseY);
    
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