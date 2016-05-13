//myCelebrities
  import java.io.File;
  String[] names = new String[]{"xavier","magneto","wolverine","rogue","storm","burn_gorman","charlie_day","idris_elba","rinko_kikuchi","mads_mikkelsohn","hugh_dancy","gillian_anderson","scarlett_johansson","sebastian_stan","chris_evans","anthony_mackie","hayley_atwell","lucy_liu","sendhil_ramamurthy","orlando_jones","benedict_cumberbatch","chris_pine","zachary_quinto","zoe_saldana","anton_yelchin","karl_urban","john_cho","simon_pegg"};
  
  String BASE_URL = "http://psychomorph.facelab.org/demo/celebs/";
  
  File[] files;
  File folder;
  
  void setup() {
    getImages();
    folder = new File(dataPath(""));
    files = folder.listFiles();
    size(600, 400);
    background(255);
    frameRate(1);
  }
    
  void draw() {
    PImage img = loadImage(files[frameCount % files.length].getName());
    tint(255, 20);
    image(img, 0, 0, 300, 400);
    noTint();
    image(img, 300, 0, 300, 400);
    if (frameCount > files.length) {
      noLoop();
    }
  }
  
  void keyPressed() {
    if (key == 's' || key == 'S') {
      saveFrame("myCelebrities####.jpg");
    }
  }
  
  void getImages() {
    for (int i = 0; i < names.length; i++) {
      PImage img = loadImage(BASE_URL + names[i], "jpg");
      img.save("data/" + names[i] + ".jpg");
    }
  }