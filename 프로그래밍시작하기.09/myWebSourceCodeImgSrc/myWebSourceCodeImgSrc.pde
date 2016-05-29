//myWebSourceCodeImgSrc
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

String URL = "http://ejya.tistory.com/38";

String sourceCode;

void setup() {
  sourceCode = join(loadStrings(URL), "");
  Document doc = Jsoup.parse(sourceCode);
  Elements imgLinks = doc.select("img");
  
  for (Element imgLink : imgLinks) {
    String imgURL = imgLink.attr("src");
    println(imgURL);
    //PImage img = loadImage(imgURL, "jpg");
    //img.save("data/" + imgLink.attr("filename"));
  }
}

void keyPressed() {
    if (key == 's' || key == 'S') {
        saveFrame("myGettingFaceImages####.jpg");
    }
}