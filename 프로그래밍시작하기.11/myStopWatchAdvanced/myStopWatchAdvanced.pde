//myStopWatchAdvanced
int last = 0;
int begin = 0;
int current = 0;
boolean isCounting = false;

void setup() {
  size(480, 360);
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(#F08040);
}

void draw() {
  background(255);
  current = isCounting ? last + millis() - begin : last;
  int seconds = current / 1000;
  int subseconds = current % 1000;
  text(seconds + "." + subseconds, width / 2, height /2);
}

void keyPressed() {
  if (isCounting) {
    isCounting = false;
    last += millis() - begin;
  }
  else {
    isCounting = true;
    begin = millis();
  }
}