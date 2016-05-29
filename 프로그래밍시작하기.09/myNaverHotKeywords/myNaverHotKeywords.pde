//myNaverHotKeywords
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

String URL = "http://www.naver.com";
ArrayList<String> keywords;
void setup() {
  String sourceCode = join(loadStrings(URL), "");
  Document doc = Jsoup.parse(sourceCode);
  keywords = new ArrayList<String>();
  Elements lists = doc.select("#realrank li a");

  for (Element list : lists) {
    String keyword = list.attr("title");
    keywords.add(keyword);
  }
  println(keywords);
}