//myGettingFaceImages
import java.util.ArrayList;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

String BASE_URL = "http://www.faceresearch.org";
String web_page_url = BASE_URL + "/demos/average";

ArrayList<String> imageURLs= new ArrayList<String>();
PImage img;

void setup() {

  String html = join(loadStrings(web_page_url), "");
  Document doc = Jsoup.parse(html);
  Elements inputs = doc.select("input[type=checkbox]");
  
  for (Element input : inputs) {
    String imageURL = trim(BASE_URL + input.attr("value"));
    imageURLs.add(imageURL);
    println(imageURL);
    PImage image = loadImage(imageURL);
    image.save(imageURL.substring(46, 57));
    
  }
}
  

void keyPressed() {
    if (key == 's' || key == 'S') {
        saveFrame("myGettingFaceImages####.jpg");
    }
}