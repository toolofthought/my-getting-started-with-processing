import processing.sound.*;
AudioIn mic;
Amplitude analyzer;

Bird b;
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
float thresholdTop = 0.05;
float thresholdBottom = 0.02;

int wid = 400;
int rez = 20;
int score = 0;
boolean clapping = false;

void setup() {
  	size(800, 800);
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

  	if (frameCount % 75 == 0) {
    	pipes.add(new Pipe());
  	}
  

  	if (keyPressed) {
    	PVector up = new PVector(0, -5);
    	b.applyForce(up);
  	}

  	float volume = map(analyzer.analyze(), 0, 1, height, 0);

  	if (volume > thresholdTop && !clapping) {
  		clapping = true;
    	PVector up = new PVector(0, -5);
    	b.applyForce(up);
  	}

  	if (volume < thresholdBottom) {
  		clapping = false;
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

  	//녹색 볼륨바
  	fill(0, 255, 0);
  	println(volume);
  	rect(width - 50, volume, 50, volume);
  	//빨간 thresholdTop
  	stroke(255, 0, 0);
  	float ytTop = map(thresholdTop, 0, 1, height, 0);
  	line(width - 50, ytTop, width, ytTop);

  	//빨간 thresholdBottom
  	stroke(255, 0, 0);
  	float ytBottom = map(thresholdBottom, 0, 1, height, 0);
  	line(width - 50, ytBottom, width, ytBottom);
    
  
}