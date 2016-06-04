//calendar
import java.text.SimpleDateFormat;
import java.util.Date;

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

String URL = "http://www.kobis.or.kr/kobis/business/stat/boxs/findDailyBoxOfficeList.do";
//String DATE = "2016-05-30";
Date now;
SimpleDateFormat sdf;
Elements table;

ArrayList<String> titles = new ArrayList<String>();
ArrayList<String> revenues = new ArrayList<String>();

void setup() {
  now = new Date();
  sdf = new SimpleDateFormat("yyyy-MM-dd");
  
  table = getTable();
  getMovieTitle();
  getMovieRevenue();
  for (int i = 0; i < titles.size(); i++) {
      println(titles.get(i) + ": " + revenues.get(i));
  }
  
}

void getMovieTitle() {
  Elements movies = table.select("tr");
  for (Element movie : movies) {
    titles.add(movie.select("td.title a").text());
  }
}

void getMovieRevenue() {
  Elements movies = table.select("tr");
  for (Element movie : movies) {
    revenues.add(movie.select("td.figureR").first().text());
  }
}

Elements getTable() {

  WebDriver driver = new FirefoxDriver();
  driver.get(URL);

  //date input 
  WebElement inputDate = driver.findElement(By.xpath("//input[@id='sSearchTo']"));
  for (int i = 0; i< 10; i++) inputDate.sendKeys(Keys.BACK_SPACE);
  inputDate.sendKeys(sdf.format(now));
  
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

  Elements table = doc.select("#tbody_0");
  driver.quit();
  return table;
}