  //myWebSourceCode
  String URL = "http://highelementryuniv.tistory.com/143";
  
  String sourceCode;
  
  void setup() {
    sourceCode = join(loadStrings(URL), "");
    println(sourceCode);
  }