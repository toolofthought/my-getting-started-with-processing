//myFirstSelenium
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

void setup() {
  WebDriver driver = new FirefoxDriver();
  driver.get("http://www.naver.com");
}