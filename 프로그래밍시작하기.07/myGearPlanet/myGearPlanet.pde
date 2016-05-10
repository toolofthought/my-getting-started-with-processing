//myGearPlanet
  PShape planet;
  float theta = 0.0;
  
  void setup() {
    size(480, 360);
    planet = loadShape("planet.svg");
    planet.disableStyle();
  }
  
  void draw() {
    background(255);
    translate(width / 2.0, height / 2.0);
    rotate(theta);
    fill(#a1d99b);
    shape(planet, 0, 0);
  
    theta += 0.01;
  }
  
void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myGearPlanet.jpg");
  }
}
  
 
 