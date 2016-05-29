//myWebSourceCode
String URL = "http://2968175.tistory.com/127";

String sourceCode;

void setup() {
  sourceCode = join(loadStrings(URL), "");
  println(sourceCode);
}

void keyPressed() {
    if (key == 's' || key == 'S') {
        saveFrame("myGettingFaceImages####.jpg");
    }
}