//myStopWatch
int begin;
int current = 0;
boolean isCounting = false;

void setup() {
  size(480, 360);
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(#F08040);
  
  begin = millis();
}

void draw() {
  background(255);
  current = millis() - begin;
  int seconds = current / 1000;
  int subseconds = current % 1000;
  text(seconds + "." + subseconds, width / 2, height /2);
}

void keyPressed() {
  noLoop();
}