import processing.sound.*;
Amplitude analyzer;
AudioIn mic;

float threshold = 0.10;
Bird b;
ArrayList<Pipe> pipes = new ArrayList<Pipe>();

int wid;
int rez = 20;
int score = 0;

void setup() {
  	fullScreen();
  	wid = width * 3 / 4;
  	b = new Bird();
  	//pixelDensity(2);
  	pipes.add(new Pipe());

  	// 마이크 입력을 받을 객체를 만듭니다.
    // input이 마이크 입력을 받은 객체이고, 마이크의 첫번째 채널(0번째 채널)을 입력으로 받습니다.
    mic = new AudioIn(this, 0);

    // 마이크 입력을 시작합니다.
    mic.start();

    // 소리 크기를 분석할 객체를 만듭니다.
    analyzer = new Amplitude(this);

    // 소리 크리를 분석할 객체와 마이크의 소리입력을 연결합니다.
    analyzer.input(mic);
}

void draw() {
  	background(0);

  	if (frameCount % 150 == 0) {
    	pipes.add(new Pipe());
  	}
  

  	if (keyPressed) {
    	PVector up = new PVector(0, -5);
    	b.applyForce(up);
  	}
    
    float volume = analyzer.analyze();
    volume = constrain(volume, 0, 0.4);
    if (volume > threshold) {
      PVector up = new PVector(0, -5);
      b.applyForce(up);
    }

  	b.move();
  	b.display();

  	boolean safe = true;

  	for (int i = pipes.size()-1; i>=0; i--) {
    	Pipe p = pipes.get(i);
    	p.move();
    	
    	if (p.hits(b)) {
      		p.display(true);
      		safe = false;
    	}
    	else {
      		p.display(false);
    	}

    	if (p.x < -p.w) {
      		pipes.remove(i);
    	}
  	}
  
  	if (safe) {
    	score++; 
  	}
  	else {
    	score -= 50;
  	}
  
  	fill(255, 0, 255);
  	textSize(64);
  	text(score, width/2,50);
  
  	score = constrain(score, 0, score);
  
  //volume bar
  float vh = map(volume, 0, 0.4, height, 0);
  fill(0, 255, 0);
  noStroke();
  rect(width - 50, vh, 50, vh);
  
  //thresholdTop line
  float tt = map(threshold, 0, 0.4, height, 0);
  stroke(255, 0, 0);
  line(width - 50, tt, width, tt);
  
}