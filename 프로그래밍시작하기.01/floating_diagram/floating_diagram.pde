import processing.pdf.*;
boolean savePDF = false;

void draw(){
  if(savePDF)
  {
    beginRecord(PDF, "floating_diagram.pdf");
  }
  
  ellipse(mouseX, mouseY, 60, 60);
    
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