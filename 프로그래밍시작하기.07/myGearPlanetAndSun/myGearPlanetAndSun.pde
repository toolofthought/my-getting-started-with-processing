  //myGearPlanetAndSun
  PShape sun;
  PShape planet;
  PShape annulus;
  PShape solarSystem;
  float theta = 0.0;
  
  void setup() {
    size(480, 360);
    solarSystem = loadShape("solarSystem.svg");
    solarSystem.disableStyle();
    planet = solarSystem.getChild("planet");
    sun = solarSystem.getChild("sun");
  }
  
  void draw() {
    background(255);

    translate(width / 2.0, height / 2.0);

    rotate(theta);
    fill(#31a354);
    shape(sun, 0, 0);

    translate(240, 0);    
    fill(#a1d99b);
    rotate(-theta * 16 / 32);
    shape(planet, 0, 0);
    
    theta += 0.01;
  }
  
void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myGearPlanetAndSun####.jpg");
  }
}
  
 
 