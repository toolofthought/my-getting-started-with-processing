//myGearSolarSystem
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
    annulus = solarSystem.getChild("annulus");
  }
  
  void draw() {
    background(255);

    translate(width / 2.0, height / 2.0);
    scale(0.4);
    
    //sun
    pushMatrix();
      rotate(theta);
      fill(#31a354);
      shape(sun, 0, 0);
    popMatrix();

    //planet01    
    pushMatrix();
      translate(240 * cos(PI / 6), 240 * sin(PI / 6));
      fill(#a1d99b);
      rotate(-theta * 16 / 32);
      shape(planet, 0, 0);
    popMatrix();

    //planet02    
    pushMatrix();
      translate(240 * cos(PI * 5 / 6), 240 * sin(PI * 5 / 6));
      fill(#a1d99b);
      rotate(-theta * 16 / 32);
      shape(planet, 0, 0);
    popMatrix();

    //planet03    
    pushMatrix();
      translate(240 * cos(PI * 9 / 6), 240 * sin(PI * 9 / 6));
      fill(#a1d99b);
      rotate(-theta * 16 / 32);
      shape(planet, 0, 0);
    popMatrix();

    //annulus
    pushMatrix();
      fill(#e5f5e0);
      rotate(-theta * 16 / 80);
      shape(annulus, 0, 0);
    popMatrix();

    theta += 0.01;
  }

  
void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myGearSolarSystem####.jpg");
  }
}
  
 
 