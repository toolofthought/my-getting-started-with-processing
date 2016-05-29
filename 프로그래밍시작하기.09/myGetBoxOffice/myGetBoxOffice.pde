//myGetBoxOffice
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

String URL = "http://www.kobis.or.kr/kobis/business/stat/boxs/findDailyBoxOfficeList.do";
String DATE = "2016-05-26";

void setup() {
  WebDriver driver = new FirefoxDriver();
  driver.get(URL);

  //date input 
  WebElement inputDate = driver.findElement(By.xpath("//input[@id='sSearchTo']"));
  for(int i = 0; i < 10; i++) inputDate.sendKeys(Keys.BACK_SPACE);
  inputDate.sendKeys((DATE));
  
  //click search button
  driver.executeScript("chkform('search')");

}