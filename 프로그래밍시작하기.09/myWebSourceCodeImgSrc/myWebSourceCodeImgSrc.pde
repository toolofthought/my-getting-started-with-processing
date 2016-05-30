  //myWebSourceCodeImgSrc
  import org.jsoup.Jsoup;
  import org.jsoup.nodes.Document;
  import org.jsoup.nodes.Element;
  import org.jsoup.select.Elements;
  
  String URL = "http://highelementryuniv.tistory.com/143";
  String sourceCode;
  ArrayList<String> links = new ArrayList<String>();
  ArrayList<PImage> images = new ArrayList<PImage>();
  
  void setup() {
    size(720, 1280);
    frameRate(1);
    sourceCode = join(loadStrings(URL), "");
    Document doc = Jsoup.parse(sourceCode);
    Elements imgLinks = doc.select("div.tt_article_useless_p_margin img");
    
    for (Element image : imgLinks) {
      links.add(image.attr("src"));
      images.add(loadImage(image.attr("src"), "jpg"));
    }
  }
  
  void draw() {
    image(images.get(frameCount % images.size()), 0, 0);
  }
  
  void keyPressed() {
      if (key == 's' || key == 'S') {
         saveFrame("myWebSourcecodeImgSrc####.jpg");
      }
  }