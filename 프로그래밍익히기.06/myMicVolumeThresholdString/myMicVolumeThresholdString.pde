//myMicVolumeThresholdString
import processing.sound.*;

AudioIn input;
Amplitude analyzer;

float original;

float silince = 0.01;

int countdown = 0;

void setup() {
  size(800, 600);
  smooth();
  background(255);

  // 마이크 입력을 받을 객체를 만듭니다.
  // input이 마이크 입력을 받은 객체이고, 마이크의 첫번째 채널(0번째 채널)을 입력으로 받습니다.
  input = new AudioIn(this, 0);

  // 마이크 입력을 시작합니다.
  input.start();

  // 소리 크기를 분석할 객체를 만듭니다.
  analyzer = new Amplitude(this);

  // 소리 크리를 분석할 객체와 마이크의 소리입력을 연결합니다.
  analyzer.input(input);
}

void draw() {
  background(255);

  original = analyzer.analyze(); 

  // 경계처리
  if (original > silince) {
    countdown = 100;
    
  }

  if (countdown > 0) {
    rectMode(CENTER);
    fill(0, 102, 153, map(countdown, 0, 100, 0, 255));
    textSize(48);
    textAlign(CENTER, CENTER);
    text("Be quiet!", width / 2, height / 2);
    countdown--;
  }
  else {
    countdown = 0;
  }

}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myMicVolumeThresholdString####.png");
  }
}