//myGetMovie
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

String URL = "http://www.kobis.or.kr/kobis/business/stat/boxs/findDailyBoxOfficeList.do";
String DATE = "2016-05-26";

void setup() {
  getMovie();
}

void getMovie() {
  Elements movies = getTable();
  for (Element movie : movies) {
    println(movie.select("td.title a").text());
  }
}

Elements getTable() {

  WebDriver driver = new FirefoxDriver();
  driver.get(URL);

  //date input 
  WebElement inputDate = driver.findElement(By.xpath("//input[@id='sSearchTo']"));
  for (int i = 0; i< 10; i++) inputDate.sendKeys(Keys.BACK_SPACE);
  inputDate.sendKeys((DATE));
  
  //click search button
  WebElement searchButton = driver.findElement(By.xpath("//a[@onclick=\"chkform('search'); return false;\"]"));
  searchButton.click();
  
  //click button to expand list
  WebElement moreButton = driver.findElement(By.id("btn_0"));
  while (moreButton.getAttribute("class").equals("btn_on")) {
    moreButton.click();
  }
  
  //pass html source to Jsoup
  Document doc = Jsoup.parse(driver.getPageSource());

  Elements movies = doc.select("#tbody_0");
  
  return movies;
}