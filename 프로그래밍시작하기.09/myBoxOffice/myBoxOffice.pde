//myBoxOffice
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

String URL = URL = "http://www.kobis.or.kr/kobis/business/stat/boxs/findDailyBoxOfficeList.do";
String DATE = "2016-05-28";

void setup() {
  WebDriver driver = new FirefoxDriver();
  driver.get(URL);
  driver.close();
  
}