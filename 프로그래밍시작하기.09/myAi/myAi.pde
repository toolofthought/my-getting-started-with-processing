//myGetMovieTitleAndRevenue
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

String URL = "http://www.todayhumor.co.kr/board/view.php?table=bestofbest&no=249457&s_no=249457&page=2";
//String URL = "http://www.naver.com";
void setup() {
  WebDriver driver = new FirefoxDriver();
  driver.get(URL);
  Document doc = Jsoup.parse(driver.getPageSource());
  Elements images = doc.select("div.viewContent img");
  println(images);
  for (Element image : images) {
    String location = image.attr("src");
    String alt = image.attr("alt");
    PImage img = loadImage(location);
    img.save(alt);
  }
}