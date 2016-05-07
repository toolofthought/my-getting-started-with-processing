import processing.pdf.*;

boolean savePDF = false;
void draw(){
  if(savePDF)
  {
    beginRecord(PDF, "ellipse.pdf");
  }
  
  ellipse(50, 50, 60, 60);
  
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