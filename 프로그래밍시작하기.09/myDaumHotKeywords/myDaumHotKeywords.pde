//myDaumHotKeywords
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

String URL = "http://www.daum.net";
ArrayList<String> keywords;
void setup() {
  String sourceCode = join(loadStrings(URL), "");
  Document doc = Jsoup.parse(sourceCode);
  keywords = new ArrayList<String>();
  //daum 프로그래머는 왜 rank_dummy를 넣었을까요? 어디에 사용하는 것인지 잘 모르겠습니다. 이렇게 구분하지 않으면 키워드가 두 번씩 반복됩니다.
  Elements lists = doc.select("#realTimeSearchWord li div.rank_dummy span.txt_issue");
  
  for (Element list : lists) {
    String keyword = list.text();
    keywords.add(keyword);
  }
  println(keywords);
}