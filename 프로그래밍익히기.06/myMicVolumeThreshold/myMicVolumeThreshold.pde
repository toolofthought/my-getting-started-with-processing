//myMicVolumeThreshold
import processing.sound.*;

AudioIn input;
Amplitude analyzer;

FloatList volumes;
float original;
float volume;

float silince = 0.01;

void setup() {
  size(800, 600);
  smooth();
  background(255);

  //마지막 100개의 volume을 저장할 FloatList를 만듭니다.
  volumes = new FloatList();

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
  if (original < silince) {
    volume = 100;
  }
  else {
    volume = 100 + original * 2000;
  }

  volumes.append(volume);
  if (volumes.size() > 100) {
    volumes.remove(0);
  }

  for (float vol : volumes) {
    ellipse(width / 2, height / 2, vol, vol);
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("myMicVolumeThreshold####.png");
  }
}