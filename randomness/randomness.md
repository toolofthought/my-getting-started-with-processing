## 두가지 무작위 함수 ##

항상 같은 도형을 그리는 것을 지루합니다. 실행시킬 때마다 무언가 달라지고 정해진 움직임을 벗어나는 것을 보고 있으면 이전에는 생각지 못한 영감을 얻기도 합니다. 이제 화면을 자유롭게 "헤메는" 도형을 그리는 프로그램을 짜봅시다. 

그러려면 우선 무작위(randomness)에 대해 이해를 해야 합니다. 무작위를 만드는 두가지 함수 random()과 noise()에 대해 차례로 알아봅시다.

### random() 함수 ###
이전에도 간단히 언급하고 지나갔지만 이제 본격적으로 살펴봅시다.

random() 함수는 임의의 값을 반환합니다.

기본 형식
* random(high); //[0, high) 구간의 수 중 임의의 수를 반환합니다. high는 포함하지 않습니다.
* random(low, high); //[low, high) 구간의 수 중 임의의 수를 반환합니다. high는 포함하지 않습니다.

void setup() {
	size(480, 360);
	smooth();
	strokeWeight(5);
	noLoop();
}

void draw() {
	float posX;
	float posY;

	beginShape();
	for (int i = 0; i < 24; i++) {
		posX = 120 + i * 10;
		posY = random(120, 240);
		vertex(posX, posY);
	}
	endShape();
}

#### randomSeed() 함수 ####
random() 함수는 임의의 값을 구합니다. 그런데 이런 임의의 값을 다른 사람과 나눌 수 있는 방법은 없을까요? 내가 만든 프로그램을 돌렸을 때 매번 다른 임의의 수가 나오는 것은 가끔 불편합니다.

예를 들어 임의의 수 그래프가 항상 같은 임의의 수를 뽑았으면 좋겠습니다. 어떻게 하면 될까요?

randomSeed() 함수를 사용합니다. 

기본 형식: randomSeed(seed);

가령 randomSeed(100)을 random() 함수를 사용하기 전에 실행하면 random() 실행할 때마다 언제나 동일한 임의의 수열을 얻을 수 있습니다.

어디에 써먹을까요? 위의 그래프의 꼭지점에 점을 찍어 데이터가 잘 보이도록 수정해봅시다.

int randomSeed = 100;

void setup() {
	size(480, 360);
	smooth();
}

void draw() {
	float posX;
	float posY;

	randomSeed(randomSeed);
  	stroke(99, 68, 42);
  	strokeWeight(5);

	//line
	beginShape();
	for (int i = 0; i < 24; i++) {
		posX = 120 + i * 10;
		posY = random(120, 240);
		vertex(posX, posY);
	}
	endShape();

	//dots
	randomSeed(randomSeed);
	stroke(0);
	strokeWeight(20);
	for (int i = 0; i < 24; i++) {
		posX = 120 + i * 10;
		posY = random(120, 240);
		point(posX, posY);
	}
}

void mouseReleased() {
	randomSeed = int(random(1000));
}

randomSeed() 함수를 실행한 이후에 실행되는 random() 함수는 다시 같은 임의의 값 수열을 생성합니다.

마우스를 클릭하면 매번 새로운 randomSeed를 이용해 새롭게 임의의 값을 추출합니다.

### noise() 함수 ###
그런데 random() 함수 그래프는 너무 뾰족하고 너무 부지런하게 위아래로 뛰어다닙니다. 이건 무언가 마음에 들지 않습니다.

연못의 잉어를 본 적이 있으신가요? 잉어의 움직임을 떠올려 봅시다. 가만히 있는 듯 조금씩 움직이다가 다시 획 돌아서 급히 그늘 속으로 숨어버리는 움직임이 떠오르시나요? 이런 움직임을 컴퓨터로 재현할 수 있을까요?

네! 가능합니다. noise() 함수를 사용합시다. noise() 함수에 대해 설명을 더 하기 전에 우선 그래프를 그려보고 특징을 살펴봅시다. 그리고 추가로 noise() 함수의 특성을 조금 더 알아볼까요?

float xoff = random(1000);

void setup() {
	size(480, 360;
	smooth();
	noLoop();
}

void draw() {
	
	float posX;
	float posY;
	
	stroke(99, 68, 42);
  	strokeWeight(5);

	beginShape();
	for (int i = 0; i < 24; i++) {
		posX = 120 + i * 10;
		posY = map(noise(xoff), 0, 1, 120, 240);
		vertex(posX, posY);
		xoff = xoff + 0.1;
	}
	endShape();
}

noise() 함수는 입력값에 대해 (0, 1)사이의 값을 반환합니다. 주의할 점은 noise() 함수는 같은 입력값에 대해 항상 같은 값을 반환합니다. random() 함수는 입력이 같아도 항상 다른 값을 반환한 것과 비교되는 대목입니다.

항상 같은 값을 반환하는 noise() 함수가 어떻게 임의값을 구하는 작업에 사용된다고 할까요? 왜냐하면 noise() 함수는 같은 입력값에 대해서는 항상 같은 값을 반환하지만, 입력값이 조금 커진다고 해서 출력값도 입력값에 정확히 비례해서 커지지는 않기때문입니다. 입력값이 0.1 커질 때 출력값은 이전값 언저리에서 머무르지만 정확히 0.1에 대응해 커지지는 않습니다.

비슷한 입력은 비슷한 출력을 보이는 경향은 있지만 실제로 정확하게 비례하지는 않습니다. 다만 비슷할 것이라는 짐작만 할 수 있을 뿐이지요.

xoff가 증가하는 크기에 따라 그래프의 평평한 정도가 달라지는 것을 확인해보세요. 증가하는 스텝크기가 커질수록 그래프의 y값은 급격하게 변화합니다. 반대로 스텝크기가 작아질수록 그래프는 변화의 폭이 적어 직선에 가까워집니다.

#### xoff = xoff + 0.1 ####
#### xoff = xoff + 1 ####
#### xoff = xoff + 0.01 ####

시간이 얼마 지나지 않았을 때(stepSize가 작을 때) 잉어의 위치는 이전 위치와 비슷한 곳에 있을 확률이 높습니다. 정확히 같은 자리에 위치하는 것은 아니지만 근처에 있을 거라는 것을 알 수 있습니다. 하지만 시간이 오래 지나면(stepSize가 커지면) 처음 위치에서 멀리 벗어날 확률이 높습니다.

이제 noise() 함수의 기본 형식을 설명할 수 있을 것 같습니다. noise() 함수는 여러 기본 형식이 있습니다.

기본 형식:	noise(xoff); // 1차원
			noise(xoff, yoff); // 2차원
			noise(xoff, yoff, zoff); // 3차원

보통 증가값의 크기는 0.005에서 0.03 사이의 값을 사용합니다. 커지면 큰 움직임을 작아지면 작은 움직임을 보입니다.

### 움직이는 random() 그래프 ###
random()과 noise() 함수가 시간에 따라 어떻게 움직이는지 알고싶지 않으십니까? 움직이는 그래프를 만들어 봅시다.

아이디어는 간단합니다. random() 함수를 이용해 뽑은 수를 history에 보관하고 매 프레임마다 가장 오래된 값을 history 머리에서 제거하고 꼬리에 새로운 값을 추가합니다.

float posX;
float posY;

FloatList history;

void setup() {
  	size(480, 360);
  	smooth();
  
  	history = new FloatList();
  	for(int i = 0; i < 24; i++) {
    	posY = random(120, 240);
    	history.append(posY);
  	}
  
  	frameRate(5);
}

void draw() {
  	background(255);
	stroke(99, 68, 42);
	strokeWeight(5);
  
  	beginShape();
  	for (int i = 0; i < 24; i++) {
    	posX = 120 + i * 10;
   		posY = history.get(i);
    	vertex(posX, posY);
  	}
  	endShape();
  
  	history.remove(0);
  	history.append(random(120, 240));
  
}

#### FloatList ####
FloatList는 프로세싱이 제공하는 편리한 리스트입니다. 이름이 의미하듯 float을 저장할 수 있는 FloatList는 필요에 따라 숫자를 계속 추가하거나 필요없는 숫자를 제거할 수 있습니다.

FloatList를 사용할 때는 배열을 사용하는 것과  마찬가지로 세단계를 거칩니다.

선언: 우선 FloatList 변수를 선언합니다.

FloatList myLists;

생성: 메모리에 공간을 할당합니다.
history = new FloatList();

초기화: FloatList에 값을 채웁니다.
for(int i = 0; i < 24; i++) {
    	posY = random(120, 240);
    	history.append(posY);
}

추가: 원소를 append()를 사용합니다.
history.append(posY);

제거: 필요없는 원소를 FloatList에서 제거할 때는 remove(i)를 사용합니다. i는 리스트의 인덱스로 i = 0 일 때는 가장 첫번째 원소를 지칭합니다.
history.remove(0);

#### frameRate() 함수 ####
frameRate() 함수를 이용해 초당 처리할 프레임 수를 사용자가 정할 수 있습니다. 기본값은 60(초당 60프레임)이지만 화면이 너무 빨리 바뀔 경우 프레임 값을 낮추면 좀 더 편안하게 화면을 관찰할 수 있습니다.

### 움직이는 noise() 그래프 ###
비슷한 방법으로 noise() 함수에 대해서도 같은 그래프를 그려봅시다.

추가로 왼쪽 방향키를 누를 때마다 xoff가 증가하는 스텝사이즈가 줄어들고, 오른쪽 방향키를 누를 때마다 스텝사이즈가 커지도록 코드를 추가하겠습니다.

float posX;
float posY;
float xoff = random(1000);
float stepSize = 0.1;

FloatList history;

void setup() {
    size(480, 360);
    smooth();
  
    history = new FloatList();
    for(int i = 0; i < 24; i++) {
      	posY = map(noise(xoff), 0, 1, 120, 240);
      	history.append(posY);
    	xoff = xoff + stepSize;
    }
  
    frameRate(5);
}

void draw() {
  	background(255);
  	stroke(99, 68, 42);
  	strokeWeight(5);
  
    noFill();
    beginShape();
    for (int i = 0; i < 24; i++) {
      	posX = 120 + i * 10;
       	posY = history.get(i);
      	vertex(posX, posY);
    }
    endShape();
  
    history.remove(0);
    history.append(map(noise(xoff), 0, 1, 120, 240));
    xoff = xoff + stepSize;
    
    fill(0);
    textSize(18);
    text("stepSize: " + stepSize, 50, 50);
}

void keyPressed() {
  	if (key ==  CODED) {
    	if (keyCode == LEFT) {
      		stepSize = stepSize - 0.01;
      		stepSize = max(0.01, stepSize);
    	}
    else if (keyCode == RIGHT) {
      	stepSize = stepSize + 0.01;
      	stepSize = min(1.0, stepSize);
    }
  }
}

### random color ###
임의의 수는 도형의 움직임을 정의하는데만 사용되지 않습니다. 색을 칠하는 작업에도 활용할 수 있습니다. 사실 noise() 함수가 개발된 애초의 목적이 이런 것이었습니다. 이제 화면을 random() 함수와 noise() 함수를 이용해 칠해봅시다.

한 픽셀 한 픽셀 장인의 손길로 칠해 봅시다. 그러기 위해 몇 가지 프로세싱 함수를 배워야 합니다. 먼저 pixels[] 배열에 대해 알아봅시다.
#### pixels[] 배열 ####
pixels[] 배열은 화면의 모든 픽셀의 color를 담고 있습니다. 프로세싱은 color라는 특별한 데이터 타입을 픽셀을 표현하는데 사용합니다. 2차원 화면을 pixels[] 배열에 담기 위해 픽셀 정보를 특별한 규칙에 따라 배열에 저장합니다. 화면의 (x, y) 픽셀의 color는 pixels[x + width * y]에 저장됩니다. 

화면
1 2 3
4 5 6
7 8 9

pixels[] 배열
1 2 3 4 5 6 7 8 9

예를 들어 화면 정가운데 픽셀의 color값 5는 pixels[1 + 3 * 1]에 저장되어 있습니다. 같은 방법으로 화면의 color 8은 pixels[1 + 3 * 2]에 저장되어 있습니다.

이제 남은 것은 pixels[] 배열의 color값을 수정하는 것 뿐입니다. 그러기 전에 한가지 사전작업이 필요합니다.

#### loadPixels() ####
pixels[] 배열을 이용하려면 항상 loadPixels() 함수를 먼저 실행해야 합니다. loadPixels() 함수가 실행되면 화면의 픽셀 데이터가 pixels[] 배열에 읽어 오게 됩니다. 

#### updatePixels() ####
pixels[] 배열의 데이터가 업데이트 되었다고 해도 화면에 변화가 바로 반영되지 않습니다. 화면에 변화를 반영하려면 updatePixels() 함수를 실행해야 합니다.

updatePixels() 함수는 pixels[] 배열의 정보를 바탕으로 화면을 다시 구성합니다.

다시 한 번 정리할까요? 픽셀을 단위로 작업할 때는 우선 loadPixels()을 실행합니다. pixels[] 배열에서 작업을 마친 후 updatePixels()을 실행해 화면을 업데이트 합니다.

#### random() 함수를 이용해 화면 칠하기 ####
아이디어는 간단합니다. random(255)로 임의의 수를 구한 다음 color() 함수를 이용해 color 타입으로 바꿉니다. 픽셀마다 이런 작업을 pixels[] 배열에 반복해 적용한 다음 updatePixels() 함수로 화면에 띄웁니다.

마우스를 클릭할 때마다 random()의 seed가 바뀌도록 수정해 바뀐 randomSeed를 바탕으로 새로운 그림을 그리도록 합니다.

int myRandomSeed = 100; 

void setup() {
  size(480, 360);
}

void draw() {
  randomSeed(myRandomSeed);
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      pixels[x + width * y] = color(random(255));
    }
  }
  updatePixels();
}

void mousePressed() {
  myRandomSeed = int(random(1000));
}


#### noise() 함수를 이용해 화면 칠하기 ####
noise() 함수를 이용해 텍스쳐를 만들어 봅시다. noise() 함수가 두 개의 입력값 (xoff, yoff)를 받는 것에 주의하세요. 하나만 사용할 경우에는 제대로 된 그림이 나오지 않습니다.

다른 유의사항은 y에 대한 for 반복문을 실행하기 전 항상 y를 초기화 하는 점입니다. 이 두 가지 유의사항만 지킨다면 원하는 결과를 볼 수 있을 것입니다. 

int myNoiseSeed = 100;

void setup() {
  size(480, 360);
}

void draw() {
  noiseSeed(myNoiseSeed);

  loadPixels();
  float xoff = 0.0;
  float step = 0.01;
  for (int x = 0; x < width; x++) {
    float yoff = 0.0;
    for (int y = 0; y < height; y++) {
      pixels[x + width * y] = color(map(noise(xoff, yoff), 0, 1, 0, 255));
      yoff = yoff + step;
    }
    xoff = xoff + step;
  }
  updatePixels();
}

void mousePressed() {
  myNoiseSeed = (int) random(1000);

아래의 코드처럼 noise() 함수를 사용하면 원하는 그림을 얻을 수 없습니다. yoff가 초기화되는 위치를 주의깊게 살펴주세요.

int myNoiseSeed = 100;

void setup() {
  size(480, 360);
}

void draw() {
  noiseSeed(myNoiseSeed);

  loadPixels();
  float xoff = 0.0;
  float yoff = 0.0;
  float step = 0.01;
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      pixels[x + width * y] = color(map(noise(xoff, yoff), 0, 1, 0, 255));
      yoff = yoff + step;
    }
    xoff = xoff + step;
  }
  updatePixels();
}

void mousePressed() {
  myNoiseSeed = (int) random(1000);
}

### random texture ###
noise() 함수는 쓸모가 많습니다. 


## Random Walk ##
이제 noise() 함수를 이용해 연못 속 잉어의 움직임을 모사해봅시다.

float xoff = random(1000);
float yoff = random(1000);
float step = 0.01;
float radius = 30;

void setup() {
	size(480, 360);
	smooth();
	ellipseMode(RADIUS);
}

void draw() {
	float posX = map(noise(xoff), 0, 1, 0, width);
	float posY = map(noise(yoff), 0, 1, 0, heght);
	
	background(255);
	strokeWeight(5);
	ellipse(posX, posY, radius, radius);
	
	xoff = xoff + 0.01;
	yoff = yoff + 0.01;
}

좀 더 힘좋은 잉어를 보시고 싶으시면 step 변수값을 늘이세요. 그렇게 하면 noise() 함수값의 변화가 더 커져 움직임이 빨라집니다.

반대로 평온한 움직임을 보고 싶으시면 step값을 줄이세요.

#### 잉어 한 마리 추가합니다 ####
한 마리 더 그려볼까요? 어떻게 하면 될까요?

float x1off = random(1000);
float y1off = random(1000);
float step1 = 0.01;
float radius1 = 30;

float x2off = random(1000);
float y2off = random(1000);
float step2 = 0.005;
float radius2 = 50;

void setup() {
	size(480, 360);
	smooth();
	ellipseMode(RADIUS);
}

void draw() {
	float posX1 = map(noise(x1off), 0, 1, 0, width);
	float posY1 = map(noise(y1off), 0, 1, 0, height);

	float posX2 = map(noise(x2off), 0, 1, 0, width);
	float posY2 = map(noise(y2off), 0, 1, 0, height);

	background(255);
	//fish1
	strokeWeight(5);
	ellipse(posX1, posY1, radius1, radius1);

	//fish2
	strokeWeight(10);
	ellipse(posX2, posY2, radius2, radius2);
	
	x1off = x1off + step1;
	y1off = y1off + step1;

	x2off = x2off + step2;
	y2off = y2off + step2;
}
#### 잉어 세 마리 ####
다시 한 마리 더 추가해서 세 마리를 그려보려고 합시다. 변수들을 한 묶음 더 정의해야 하고 이것 저것 부가적인 작업이 잔뜩 필요합니다.

한 마리를 추가할 때마다 코드는 몇 줄씩 늘어나고 변수를 제대로 관리하는 것이 점점 힘들어집니다. 정말 이런 방법 밖에 없을까요? 이게 최선인가요? 

우리는 이미 함수를 이용해 반복되는 코드를 묶는 법을 살펴보았습니다. 반복문을 이용해서 복잡한 도형을 간단히 처리하는 법을 연습했습니다. 새로운 방법이 등장할 때마다 이해하고 익숙해지는데 많은 품이 듭니다. 하지만 품을 들일 가치가 있는 경우가 대부분입니다. 이제 새로운 개념과 기술을 익혀 이 문제를 더 바람직하게 프로그래머처럼 풀어봅시다.

객체지향 프로그래밍을 배울 시간입니다.
## 객체지향 프로그래밍 ##
### 절차형 프로그래밍 & 객체지향 프로그래밍 ###
지금까지 우리가 한 프로그래밍 방식을 절차형 프로그래밍(Procedural Programming)이라고 지칭합니다. 지금까지의 문제해결이란 주어진 데이터 혹은 변수를 어떻게 처리하는지 규칙을 컴퓨터에게 알려주는 것을 지칭했습니다. if 문을 사용해 조건에 따라 변수처리가 달라지기도 하고 for 반복문을 사용해 반복되어 구문을 실행하기도 하는 등 주어진 데이터를 어떻게 처리할 것인지 프로그래머가 모든 권한을 가지고 세세한 부분까지 신경을 써야 합니다.

이와는 다르게 객체지향 프로그래밍은 전체 프로그램을 작은 객체의 모임으로 이해합니다. 객체는 자율성을 가지고 동작하기 때문에 프로그래머가 세세한 부분까지 신경쓸 필요가 없습니다. 객체에게 메세지를 전달하면 객체가 알아서 해석할 뿐 객체가 실제로 어떻게 동작하는지 신경쓰지 않고 객체를 믿고 맡깁니다.

실제 코드를 보면서 이야기해 볼까요? fish라는 객체가 있습니다. 매 프레임마다 "움직여라"는 메세지를 fish에게 전달합니다. 그리고 객체 자신의 위치를 "표시하라"는 메세지를 전합니다. 아마 아래와 같은 모습을 띌 것입니다. 

fish.move();
fish.display();

우리가 이전에 작성한 코드와 비교해보세요. 어떤가요? 절차형 프로그래밍이라고 말했던 코드에서는 아래처럼 fish의 위치를 일일이 지정하고 매번 우리가 화면에 위치를 그리라는 명령을 내려야 하는 것과 차이가 있습니다.

float posX = map(noise(xoff), 0, 1, 0, width);
float posY = map(noise(yoff), 0, 1, 0, height);

ellipse(posX, posY, radius, radius);

어떻게 보면 객체지향 프로그래밍은 프로그래머에게 더 큰 역할과 권한을 주는 것처럼 느껴집니다. 도형 하나하나가 어떻게 움직이는지 세세한 부분까지 신경써야 하는 실무진이 아니라 전화나 이메일로 일하는 높으신 분들이 되어 객체에게 메세지를 전달하고 객체는 그 메세지를 자율적으로 처리하는 식으로 프로그래머의 역할이 바뀌는 것입니다.

객체지향 프로그래밍의 또 다른 장점은 캡슐화입니다. fish 객체는 자신의 위치를 저장하는 변수를 가지고 있을 테지만 객체 내부에 변수를 품고 있을 뿐 변수를 바깥에 드러내지 않습니다. 

posX와 posY 변수를 일일이 설정할 필요없이 객체가 필요로 하는 변수를 객체가 모두 캡슐화해서 가지고 있다면 다루기가 쉬워집니다.

posX1, posY1, posX2, posY2를 일일이 설정할 필요없이 아래와 같은 코드로 간단히 처리할 수 있는 것입니다.

fish1.move();
fish1.display();

fish2.move();
fish2.display();

이런 식으로 접근하면 세 마리가 무엇이랍니까? n마리도 처리할 수 있을 것 같습니다.

### 클래스란? ###
지금까지 객체의 특성과 객체를 이용해 프로그램을 하면 어떤 이점이 있는지 살펴보았습니다. 이제 객체지향 프로그래밍을 실제로 해 볼 차례입니다. 객체지향을 지원하는 프로그래밍 언어는 각자 다른 방식으로 객체를 구현합니다. 프로세싱은(프로세싱의 기반이 되는 자바도 마찬가지로) 클래스를 이용해 객체를 구현합니다.

거칠게 말해 클래스는 객체를 찍어내는 붕어빵 틀과 같습니다. 객체가 주어진 메세지에 어떻게 반응하고 다른 객체와 어떻게 협력하는지가 서술된 명세서와 같은 역할을 합니다. 프로세싱에서 객체의 구현은 클래스를 선언하는 것에서 시작합니다.

코드를 먼저 접한 다음 이야기를 계속 이어갑시다.

class Fish {
	float posX = random(0, width);
	float posY = random(0, height);

	float xoff = random(1000);
	float yoff = random(1000);
	
	float step = 0.01;
	float radius = 30;

	Fish() {
	}

	void move() {
		posX = map(noise(xoff), 0, 1, 0, width);
		posY = map(noise(yoff), 0, 1, 0, height);
		xoff = xoff + step;
		yoff = yoff + step;
	}

	void display() {
		strokeWeight(5);
		ellipseMode(RADIUS);
		ellipse(posX, posY, radius, radius);
	}
}

Fish fish;

void setup() {
	size(480, 360);
	fish = new Fish();
}

void draw() {
	background(255);
	fish.move();
	fish.display();
}

#### class 선언 ####
가장 먼저 눈에 띄는 것은 class라는 키워드입니다. class라는 키워드 다음에 위치하는 것이 지금 정의하는 클래스의 이름입니다. 

```class Fish {...}```

는 Fish라는 클래스를 {...} 에서 정의하겠다는 의미입니다. 관용적으로 클래스의 이름은 대문자로 시작합니다. 앞으로 대문자로 시작하는 이름이 나오면 클래스가 아닌지 생각해보세요. 많은 경우 그럴 것입니다.

#### 멤버변수 ####
class Fish {...} 블록 안을 보시면 낯익은 변수이름들이 보입니다. posX, posY, xoff, yoff, step, radius와 같은 변수는 Fish 클래스에 의해 생성된 각각의 객체가 사용할 고유의 변수입니다. 각 객체가 원하는 행동을 하기 위한 기본 정보를 가지고 있습니다. 이렇게 클래스에서 정의된 변수를 따로 멤버변수라고 부르기도 합니다. 

float posX = random(0, width);
float posY = random(0, height);

float xoff = random(1000);
float yoff = random(1000);
	
float step = 0.01;
float radius = 30;

#### 생성자(constructor) ####
멤버변수의 정의 다음으로 Fish() 함수가 위치합니다. 유심히 살펴보면 일반적인 함수와 모습이 다른 점이 있습니다. 우선 클래스 이름 Fish와 Fish()는 같은 이름을 사용합니다. 그리고 Fish()는 반환형(return type)을 가지고 있지 않습니다. 이런 함수를 생성자(constructor)라고 부릅니다. 명칭에서 유추할 수 있듯이 객체를 만들 때 사용하는 함수입니다.

객체의 생성은 다음과 같은 문법을 따릅니다.

Fish fish = new Fish();

사실 이런 문법은 배열을 선언할 때 이미 접한 적이 있습니다. 정수 다섯 개를 원소로 가지는 배열을 선언할 때 아래과 같이 실행한 것을 기억하실 것입니다.

int[] integers = new int[5];

생성자 Fish()가 int[5] 대신 사용되었을 뿐 동일한 문법이라는 것을 금방 확인할 수 있습니다.

Fish() 생성자가 실행되면 Fish() {...} 블록 내부의 구문이 실행됩니다. fish 객체가 생성되면서 객체가 사용할 멤버변수가 모두 생성됩니다. 비어있는 Fish() 생성자는 특별한 일을 하지 않습니다.

Fish() {
}

#### 멤버함수 혹은 메소드 ####
생성자 Fish()의 정의 다음으로 멤버함수의 정의가 따릅니다. 메소드라고 부르기도 하는 멤버함수는 객체가 어떤 메세지를 받을 때 어떤 행동을 하는지를 정의합니다.

void move() {
	posX = map(noise(xoff), 0, 1, 0, width);
	posY = map(noise(yoff), 0, 1, 0, height);
	xoff = xoff + step;
	yoff = yoff + step;
}

fish에게 '움직여라'는 메시지를 아래와 같이 전합니다.

fish.move();

그러면 fish 객체는 move() 메서드 내부에 정의된 행동을 합니다. move() 메서드는 fish 객체의 posX, posY, xoff, yoff를 업데이트 합니다.

move() 메서드 다음으로 display() 메서드가 정의됩니다.

fish에게 '지금 있는 위치를 나타내라'라는 메시지를 아래와 같이 전합니다.

fish.display();

그려면 fish 객체는 원으로 자신의 위치를 나타냅니다.

void display() {
	strokeWeight(5);
	ellipseMode(RADIUS);
	ellipse(posX, posY, radius, radius);
}

### fish1, fish2 and fish3 ###
이제 여러 마리를 그려볼까요? 객체지향 프로그래밍이 정말 코드를 간결하게 유지할 수 있도록 도움을 줄까요?

class Fish {
	float posX = random(0, width);
	float posY = random(0, height);

	float xoff = random(1000);
	float yoff = random(1000);
	
	float step = 0.01;
	float radius = 30;

	Fish() {
	}

	void move() {
		posX = map(noise(xoff), 0, 1, 0, width);
		posY = map(noise(yoff), 0, 1, 0, height);
		xoff = xoff + step;
		yoff = yoff + step;
	}

	void display() {
		strokeWeight(5);
		ellipseMode(RADIUS);
		ellipse(posX, posY, radius, radius);
	}
}

Fish fish1;
Fish fish2;
Fish fish3;

void setup() {
	size(480, 360);
	fish1 = new Fish();
	fish2 = new Fish();
	fish3 = new Fish();
}

void draw() {
	background(255);

	fish1.move();
	fish1.display();

	fish2.move();
	fish2.display();

	fish3.move();
	fish3.display();

}

도움이 되는 것 같습니다. Fish 클래스를 활용하니 여러 객체를 손쉽게 만들고 이용할 수 있습니다.

#### 객체가 객체 내부에서 스스로를 지칭하기: this()와 this ####
이전에 절차형 프로그래밍 스타일로 같은 프로그램을 만들 때는 원의 크기를 radius값으로 조절하고, step 크기도 각각 따로 정해 서로 구분할 수 있게 했습니다. 어디를 고쳐야 이런 것이 가능할까요?

Fish 클래스는 현재 하나의 생성자를 가지고 있습니다.

Fish() {
}

이제 생성자를 추가합니다. 만약 생성자가 아무런 입력값을 받지 않으면 기본값을 사용하고, 입력값을 하나 받으면  radius값, 두 개를 받으면 radius, strokeWeight값으로, 세 개를 받으면 radius, strokeWeight와 noise() 함수를 위한 step값으로 사용하도록 수정하겠습니다. 클래스 정의를 먼저 수정합니다.

class Fish {
	...	
	float step;
	float radius;
	float strokeW;

	Fish() {
		this(30, 5, 0.01);
	}

	Fish(float radius) {
		this(radius, 5, 0.01);
	}

	Fish(float radius, float strokeW) {
		this(radius, strokeW, 0.01);
	}

	Fish(float radius, float strokeW, float step) {
		this.radius = radius;
		this.strokeW = strokeW;
		this.step = step;
	}
	...
}

this()는 생성자 내부에서 다른 생성자를 지칭하는 메서드입니다. 항상 생성자 {...} 블록 첫 줄에서 사용해야 합니다. 생성자 Fish()가 세 개의 입력값을 받을 경우 가장 아래쪽 생성자를 사용합니다. 두 개의 입력값을 받을 경우 아래에서 두번째 생성자를 사용하며, 아래쪽에서 두번째 생성자는 내부에서 this()를 이용해 가장 아래쪽 생성자를 다시 호출합니다. 이런 식으로 계속해 생성자 Fish()가 입력값을 가지지 않을 때에도 기본값을 (30, 5, 0.01)을 사용하도록 처리합니다.

this는 객체 내부에서 스스로를 지칭할 때 사용합니다. 객체가 자신의 멤버변수를 지칭할 때는 this 키워드를 사용해 외부의 변수와 구별합니다. 아래의 코드는 객체가 외부의 변수를 내부의 멤버변수에 복사하는 과정을 보여줍니다.

Fish(float radius, float strokeW, float step) {
	this.radius = radius;
	this.strokeW = strokeW;
	this.step = step;
}

멤버변수 strokeW를 이용하려면 display() 메서드도 수정해야 합니다. this 키워드를 사용해 객체 각각의 strokeW를 사용하도록 업데이트 합니다.

void display() {
    strokeWeight(this.strokeW);
    ellipseMode(RADIUS);
    ellipse(posX, posY, radius, radius);
}

이제 여러가지 생성자를 이용해 객체를 만들어 봅시다.

class Fish {
  	float posX = random(0, width);
  	float posY = random(0, height);

  	float xoff = random(1000);
  	float yoff = random(1000);
  
  	float step;
  	float radius;
  	float strokeW;

  	Fish() {
   		this(30, 5, 0.01);
  	}

  	Fish(float radius) {
    	this(radius, 5, 0.01);
  	}

  	Fish(float radius, float strokeW) {
    	this(radius, strokeW, 0.01);
  	}

  	Fish(float radius, float strokeW, float step) {
    	this.radius = radius;
    	this.strokeW = strokeW;
    	this.step = step;
  	}

  	void move() {
    	posX = map(noise(xoff), 0, 1, 0, width);
    	posY = map(noise(yoff), 0, 1, 0, height);
    	xoff = xoff + step;
    	yoff = yoff + step;
  	}

  	void display() {
    	strokeWeight(this.strokeW);
    	ellipseMode(RADIUS);
    	ellipse(posX, posY, radius, radius);
  	}
}

Fish fish1;
Fish fish2;
Fish fish3;
Fish fish4;

void setup() {
  	size(480, 360);
  	fish1 = new Fish();
	fish2 = new Fish(40);
	fish3 = new Fish(50, 10);
	fish4 = new Fish(60, 15, 0.005);
}

void draw() {
  	background(255);

  	fish1.move();
  	fish1.display();

	fish2.move();
	fish2.display();

	fish3.move();
	fish3.display();

	fish4.move();
	fish4.display();
}

#### class 정의를 다른 파일로 떼어내기 ####
이제 새로운 기능이 필요할 때면 클래스 정의를 수정하는 것으로 충분합니다. setup() 함수나 draw() 함수는 큰 변화가 없는 반면 클래스 정의는 자꾸만 길어집니다. 이렇게 되면 나중에 코드를 읽기가 힘듭니다. 코드를 간결하게 유지하고 싶지만 길어지는 클래스 정의가 고민입니다. 어떻게 해야 할까요?

클래스 정의를 다른 파일로 떼어냅시다. 단축키 Ctrl + Shift + N을 누르거나 현재 편집창 오른쪽의 삼각형을 클릭해 새 탭을 클릭하세요.

새 탭의 이름은 클래스의 이름으로 합니다. 새 탭의 이름은 클래스 이름과 동일하게 합시다.

이제 원래 탭으로 돌아가 다시 프로그램을 실행합니다. 이전과 동일하게 움직이는 프로그램을 확인하셨나요? `Ctrl + K`를 눌러 현재 프로그램의 폴더를 열어 보세요. 원래 파일에 추가해  Fish.pde 파일이 저장되어 있는 것을 확인할 수 있습니다. 이런 식으로 클래스 정의 파일을 분리해서 작업하는 것을 추천합니다.

## 클래스의 예 ##
객체지향 프로그래밍을 처음 접하면서 우선 우리가 원하는 기능을 가진 클래스를 정의하는 것을 배웠습니다. 이제 객체지향 프로그래밍이 무언지 조금 알 것 같습니다.

그런데 사실 우리가 새로운 클래스를 처음부터 만드는 경우는 많지 않습니다. 클래스를 새로 정의하는 일보다는 다른 사람이 만들어 놓은 클래스를 활용하는 경우가 더 많습니다. 그리고 이미 여러분들은 다른 사람이 만들어 놓은 클래스를 사용해 왔습니다. 그런 클래스가 어떤 것들이 있는지 살펴보고 좀 더 깊은 이야기를 나눠봅시다.
### String 클래스 ###
문자열을 사용할 때 등장했던 String 타입은 사실 String 클래스입니다.

String str = "This is String Type.";
println(str);

위의 구문은 아래와 같이 고쳐쓸 수 있습니다.

String str = new String("This is String Type.");
println(str);

toUpperCase()나 length()는 String 클래스의 메서드입니다.

String str = new String("This is String class style!.");
println(str);
println(str.toUpperCase());
println(str.length());

### PImage 클래스 ###
이미지를 다룰 때 사용했던 PImage 타입도 사실 PImage 클래스입니다.

PImage 클래스는 pixels[] 배열과 width 그리고 height를 멤버변수로 가지고 있고 get(), filter()와 같은 메소드를 가지고 있습니다. 

단 `PImage img = new PImage()`처럼 클래스의 생성자로 PImage를 만드는 것은 권장하지 않습니다. 이미지를 불러들일 때는 언제나 loadImage()함수를 사용하세요. 아래 예제 결과를 확인하고 콘솔창의 출력도 함께 보세요.

PImage img;
void setup() {
  	size(100, 200);
  	img = loadImage("https://www.processing.org/reference/images/PImage.png");
  	println("image width: " + img.width);
 	println("image height: " + img.height);
  	noLoop();
}

void draw() {
  	image(img,0, 0, width, 100);
  	image(img.get(0, 50, width, 50), 0, 100, width, 50);
  	img.filter(BLUR, 6);
  	image(img.get(0, 50, width, 50), 0, 150, width, 50);
}

이 외에도 프로세싱은 사용자가 유용하게 사용할 수 있는 클래스를 많이 가지고 있습니다. 폰트와 관련된 PFont, SVG 이미지 파일과 관련된 PShape 등 여러 기능이 클래스를 통해서 구현되어 있습니다.

### ArrayList 클래스: 객체 묶음 다루기 ###
객체를 다루다 보면 여러 개의 객체 묶음을 관리해야 할 때가 있습니다. 이런 때 첫번째로 생각해 볼 해법은 배열의 사용입니다.

#### 객체 배열 ####
예를 들어 평면 위의 위치를 기록하기 위해 다음과 같이 Point 클래스를 정의했다고 합시다.

class Point {
	float x;
	float y;
	
	Point() {
		this.x = random(width);
		this.y = random(height);
	}
}

Point 클래스 배열을 정의하려면 다음과 같이 코드를 작성합니다. points 배열의 인덱스를 통해 각 객체에 접근할 수 있습니다.

Point[] points;
void setup() {
	points = new Point[5];
	for (int i = 0; i < points.length; i++) {
		points[i] = new Point();
	}

	for (int i =0; i < points.length; i++) {
		println("(" + points[i].x + ", " + points[i].y + ")");
	}
}

객체 다섯 개를 배열 points에 담았습니다. for 반복문을 이용해 객체를 생성하고 객체에 접근했습니다. 이런 식으로 객체를 한 덩어리로 묶어서 사용할 수 있음을 알았습니다.

그런데 객체가 몇 개 필요한지 사전에 알고 있을 때는 배열을 사용할 수 있지만 사실 그런 경우는 드물지 않을까요? 예를 들어 마우스를 클릭할 때마다 Fish 객체를 추가한다고 하면 배열을 사용해서는 원하는 기능을 만족할 수 없습니다. 프로그램을 실행하기 전에 마우스 클릭을 몇 번을 할 지 알 수 없는 노릇입니다.

그래서 준비했습니다. ArrayList 클래스. ArrayList 클래스를 활용하면 프로그램이 동작하는 중에 새로운 원소를 계속 추가할 수 있습니다.

#### 크기를 바꿀 수 있는 ArrayList ####
ArrayList는 프로세싱 프로그래밍을 할 때 요긴하게 자주 사용되는 일종의 데이터 저장 관련 클래스입니다. 프로그램이 시작하기 전에 크기가 정해져야 하는 배열과는 다르게 ArrayList는 프로그램이 돌아가는 중에도 원소를 추가할 수 있습니다.

게다가 ArrayList 클래스는 쓸모많은 여러 메서드를 제공하기 때문에 매우 편리하게 사용할 수 있습니다.

ArrayList 클래스를 사용하는 방법을 살펴볼까요?

먼저 ArrayList 객체를 가리키는 변수를 선업합시다.

ArrayList<Point> points;

ArrayList 다음의 <...> 사이에 ArrayList가 담고 있을 타입을 입력합니다. 우리는 Point 클래스의 객체를 담으려고 하니 <...> 사이에 Point를 입력합니다.

그리고 아래와 같이 setup() 함수 내부에서 ArrayList 객체를 생성합니다. <...>가 있어 조금 어색하지만 눈에 익지 않아 그럴 뿐 사용하다 보면 익숙해질 것 같습니다. 앞으로 ArrayList는 자주 등장하니 자연스럽게 익숙해질 것입니다.

void setup() {
...
points = new ArrayList<Point>();
...}

이제 ArrayList 클래스가 어떤 것인지 알았으니 실제 코드를 보며 ArrayList가 어떻게 사용되는지 살펴봅시다. 아래의 코드는 마우스 왼쪽 버튼을 클릭을 하면 마우스 포인터 위치에 원이 생기고 마우스 오른쪽 버튼을 클릭하면 마지막 원이 사라지는 작은 프로그램입니다.

class Point {
	float x;
	float y;
	
	Point() {
		this.x = mouseX;
		this.y = mouseY;
	}
	
	void display() {
		strokeWeight(5);
		ellipseMode(RADIUS);
		ellipse(this.x, this.y, 30, 30);
	}
}

ArrayList<Point> points;
void setup() {
	size(480, 360);
	points = new ArrayList<Point>();
}
	
void draw() {
	background(255);
	for (int i = points.size() - 1 ; i > 0; i--) {
		Point p = points.get(i);
		p.display();
	}
}

void mousePressed() {
	if (mouseButton == LEFT) {
		points.add(new Point());
	}
	else if (mouseButton == RIGHT && (!points.isEmpty())) {
		points.remove(points.size() - 1);
	}
}

먼저 눈에 띄는 것은 draw() 함수 내부의 for 반복문입니다. for 반복문은 ArrayList 객체 points를 거꾸로 순회하며 points.get(i)를 실행합니다. points.size()는 points 객체의 길이를 구합니다. 인덱스가 0부터 시작하니 points 객체의 마지막 원소의 인덱스는 points.size() - 1 이 됩니다. 

ArrayList의 메서드 get(i)는 인덱스 i에 해당하는 원소를 찾아줍니다. 그리고 이 원소(Point 객체를)를 p에 할당합니다. 그리고 Point 객체 p의 메서드 display()를 실행합니다.

마우스를 클릭하면 마우스 관련 이벤트 핸들러 mousePressed() 함수 내부의 구문이 실행됩니다.

왼쪽 버튼이 클릭되면 points.add(new Point()) 구문을 통해 Point 객체가 points의 마지막에 추가됩니다.

반대로 오른쪽 버튼이 클릭되면 points 가 비어있지 않을 때만(!points.isEmpty()) points 객체의 꼬리쪽 마지막 원소를 제거합니다(points.remove(points.size() - 1).

어떻습니까? ArrayList 어렵지 않지요? 

### ArrayList 실습: 도형의 궤적 ###
도형이 움직일 때 지금 위치를 나타내는 것 뿐만 아니라 이전 움직임의 궤적을 보여주는 클래스를 만들어 봅시다.

우선 posX와 posY를 따로 관리하는 방법 대신 하나의 클래스로 묶어서 사용합시다.

class Point {
	float x;
	float y;

	Point() {
		this(width / 2, height / 2);
	}

	Point(float x, float y) {
		this.x = x;
		this.y = y;
	}

	void display() {
		strokeWeight(10);
		point(this.x, this.y);
	}
}

제대로 동작하는지 테스트를 해볼까요?

Point point;
void setup() {
	size(480, 360);
	point = new Point();
}

void draw() {
	point.display();
}

화면 한가운데 점이 나타나는 걸 보니 잘 돌아가는 것 같습니다.
### Walker 클래스 ###
random() 함수와 noise() 함수를 설명하며 화면을 배회하는 도형을 그린 적이 있습니다. 이제 같은 행동을 하는 도형을 객체로 구현해 봅시다.
#### 화면을 배회하는 Walker 클래스: 균등분포 ####
거창하게 들리지만 사실 뭐 별 거 없습니다. Walker 클래스를 만들어 봅시다. Walker 객체는 세 가지 메세지를 제대로 처리하면 됩니다. 첫번째가 생성자, 두번째는 다음 지점으로 이동하라는 walk(), 그리고 마지막으로 화면에 자신의 지점을 표시하라는 display()를 잘 처리하는 클래스를 정의하면 됩니다. 실제로 어떻게 처리될는지 클래스를 정의하기 전에 먼저 적어봅시다.

Walker walker = new Walker();
walker.walk();
walker.display();

어떤 행동을 해야 하는지 명확해졌으니 Walker 클래스를 정의해봅시다.

class Walker {
	float posX;
	float posY;
	float stepSize = 5.0;
	
	Walker() {
		posX = random(width);
		posY = random(height);
	}

	void walk() {
		float r = random(1);
		if (r < 0.25) {
			posX = posX - stepSize;
		}
		else if (r < 0.5) {
			posX = posX + stepSize;
		}
		else if (r < 0.75) {
			posY = posY - stepSize;
		}
		else {
			posY = posY + stepSize;
		}
			
		posX = constrain(posX, 0, width);
		posY = constrain(posY, 0, height);
	}

	void display() {
		strokeWeight(5);
		stroke(0, 50);
		point(posX, posY);
	}
}

Walker walker;
void setup() {
	size(480, 360);
	smooth();
	background(255);
	frameRate(240);

	walker = new Walker();
}

void draw() {
	walker.walk();
	walker.display();
}

walker객체는 각각 1/4 확률로 위, 아래, 왼쪽, 오른쪽 중 한 방향으로 이동합니다. display() 메서드에 투명도를 적용해 자주 방문할수록 색이 진해지는 것을 관찰할 수 있습니다.

#### 화면을 배회하는 Walker 클래스: 가우시안 분포 ####
균등분포 Walker 객체는 위/아래/왼쪽/오른쪽으로 움직일 확률이 0.25로 동일합니다. 하지만 이런 경우는 굉장히 예외적인 상황입니다. 균등분포 대신 정규분포(가우시안분포)를 사용해 Walker 클래스를 재정의합시다.

수정할 부분은 walk() 메서드입니다. 다음 위치를 업데이트 하는 부분만 간단히 수정합니다.

class Walker {
	float posX;
	float posY;
	float sigma = 5.0;
	
	Walker() {
		posX = random(width);
		posY = random(height);
	}

	void walk() {
		posX = posX + sigma * randomGaussian();
		posY = posY + sigma * randomGaussian();
	
		posX = constrain(posX, 0, width);
		posY = constrain(posY, 0, height);
	}

	void display() {
		strokeWeight(5);
		stroke(0, 50);
		point(posX, posY);
	}
}

Walker walker;
void setup() {
	size(480, 360);
	smooth();
	background(255);
	frameRate(240);

	walker = new Walker();
}

void draw() {
	walker.walk();
	walker.display();
}

#### 화면을 배회하는 Walker 클래스: noise() 함수 ####
noise() 함수를 사용하면 어떨까요? 코드를 조금만 수정해서 noise() 함수를 따라 이동하는 모습을 확인해 봅시다.

class Walker {
	float posX;
	float posY;
	float stepSize = 1.0;
	float xoff = random(1000);
	float yoff = random(1000);
	
	Walker() {
		posX = random(width);
		posY = random(height);
	}

	void walk() {
		posX = posX + map(noise(xoff), 0, 1, -stepSize, stepSize);
    	posY = posY + map(noise(yoff), 0, 1, -stepSize, stepSize);
	
		posX = constrain(posX, 0, width);
		posY = constrain(posY, 0, height);

		xoff = xoff + 0.01;
		yoff = yoff + 0.01;
	}

	void display() {
		strokeWeight(5);
		stroke(0, 50);
		point(posX, posY);
	}
}

Walker walker;
void setup() {
	size(480, 360);
	smooth();
	background(255);
	
	walker = new Walker();
}

void draw() {
	walker.walk();
	walker.display();
}

# PVector와 운동 #
## PVector ##
지금까지 화면 위의 지점을 특정하는 여러 방법을 살펴봤습니다. (posX, posY)처럼 두 개의 변수를 따로 사용하는 법을 제일 먼저 살펴보았습니다. 

객체지향 프로그래밍을 배운 이후  posX와 posY를 Point 클래스의 멤버변수로 사용하는 방법을 알아보았고 이 방법을 활용해 Fish 클래스나 Walker 클래스에도 동일하게 적용했습니다.

이제 화면 위의 위치를 특정하는 세 번째 방법을 알아볼 차례입니다. 프로세싱은 PVector 클래스를 기본으로 제공합니다. PVector는 2차원이나 3차원에서의 위치를 지정하는데 편리하며 속도나 가속도 그리고 움직이는 방향 등을 계산하는데 편리한 많은 메소드를 제공합니다. 워낙 많이 사용되는 클래스라서 인터넷에서 찾을 수 있는 많은 프로세싱 작업에 빠지지 않고 등장하고 있습니다. 이번 기회를 PVector 클래스에 익숙해지는 기회로 삼아봅시다.

### PVector 객체 생성과 멤버변수 ###
PVector 클래스는 x, y, z 세 개의 멤버변수를 가집니다. 평면에 도형을 표현한다면 z를 사용할 필요는 없습니다.

일반적인 클래스 사용법을 따라 새로운 PVector 객체를 만들어 봅시다. 

PVector walker;

void setup() {
	size(480, 360);
	background(255);
  	walker = new PVector(100, 200);

	strokeWeight(5);
  	ellipse(walker.x, walker.y, 30, 30);
}



#### PVector를 멤버변수로 가지는 Point 클래스 ####
PVector는 단독으로 쓰이기 보다는 다른 클래스의 멤버변수로 사용되는 경우가 많습니다. 예를 들어 이전에 정의했던 Point 클래스를 PVector 클래스를 활용해 다시 정의해 봅시다.

class Point {
	PVector location;
	
	Point() {
		location = new PVector(width / 2, height / 2);
	}

	void display() {
		strokeWeight(5);
		ellipse(location.x, location.y, 30, 30);
	}
}

Point point;
void setup() {
	size(480, 360);
	smooth();
	background(255);
	point = new Point();
}

void draw() {
	point.display();
}

### Pvector의 메서드 add() ###
PVector 객체는 서로 더할 수 있습니다. add() 메서드를 사용하면 PVector 객체끼리 깔끔하게 더할 수 있습니다. 원래 위치 original은 흰 색으로 칠해져 있습니다. original.add(movement)를 실행해 original과 movement를 더한 새로운 위치가 회색 원으로 표시되고 있습니다.

PVector origin;
PVector movement;

void setup() {
	size(480, 360);
	smooth();
	background(255);
	
	origin = new PVector(120, 120);
	movement = new PVector(120, 120);
	
	strokeWeight(5);
	
	noFill();
	ellipse(origin.x, origin.y, 30, 30);
	
	origin.add(movement);
	
	fill(100, 100);
	ellipse(origin.x, origin.y, 30, 30);
}

#### add()를 활용해 등속운동 표현하기 ####
등속운동이라는 말은 너무 거창합니다. 한자어에 두려워 마세요. 등속운동은 같은 속도로 움직이는 운동을 말합니다. 얼음 위를 미끄러지는 물체를 생각해 보세요. 그래비티 같은 영화에서 주인공이 우주를 유영할 때 보여주는 움직임을 생각해 보세요. 천천히 같은 방향을 향해 같은 속도로 움직이는 경우 등속운동을 한다고 말합니다.

프로세싱에서 등속운동을 어떻게 표현할 수 있을까요? 등속운동을 하는 도형의 위치는 프레임마다 바뀝니다. 매 프레임마다 PVector 객체 velocity를 location 객체에 더하는 것은 어떻까요? 매 프레임마다 velocity만큼 이동하는 것이지요.

아래 코드 중 핵심은 move() 메서드 안의 `location.add(velocity);` 입니다. move()가 메세지를 처리할 때마다 현재 위치 location에 velocity 객체를 더해 갑니다. 

class Point {
	PVector location;
	PVector velocity;
	float radius = 30;
	
	Point() {
		location = new PVector(width / 2, height / 2);
		velocity = new PVector(random(5), random(5));
	}

	void move() {
		location.add(velocity);

		//오른쪽 벽을 넘어가면
		if (location.x > width + radius) {
			location.x = 0;
		}
		//왼쪽 벽을 넘어가면
		else if (location.x < 0 - radius) {
			location.x = width;
		}
		//아래쪽 바닥을 넘어가면
		if (location.y > height + radius) {
			location.y = 0;
		}
		//위쪽 천장을 넘어가면
		else if (location.y < 0 - radius) {
			location.y = height;
		}
	}

	void display() {
		strokeWeight(5);
		ellipseMode(RADIUS);
		ellipse(location.x, location.y, radius, radius);
	}
}

Point point;
void setup() {
	size(480, 360);
	smooth();
	background(255);
	point = new Point();
}

void draw() {
	background(255);
	point.move();
	point.display();
}


혹은 원이 화면 안에서 움직이도록 move() 메서드를 수정할 수도 있습니다. 원이 화면 가장자리에 닿이면 당구대에 공이 튕기듯 원이 반대방향으로 움직이도록 수정합니다. 무언가 복잡해 보이지만 사실 별 것 아닙니다. velocity의 부호를 반대로 바꾸는 것이 핵심 아이디어입니다.  이렇게 처리하면 원이 탱탱 볼처럼 사방으로 튀기는 것처럼 보입니다. 

class Point {
	PVector location;
	PVector velocity;
	float radius = 30;
	
	Point() {
		location = new PVector(width / 2, height / 2);
		velocity = new PVector(random(10), random(10));
	}

	void move() {
		location.add(velocity);

		//오른쪽 벽에 닿이면
		if (location.x > width - radius) {
			velocity.x = - velocity.x;
		}
		//왼쪽 벽에 닿이면
		else if (location.x < 0 + radius) {
			velocity.x = - velocity.x;
		}
		//아래쪽 바닥에 닿이면
		if (location.y > height - radius) {
			velocity.y = - velocity.y;
		}
		//위쪽 천장에 닿이면
		else if (location.y < 0 + radius) {
			velocity.y = - velocity.y;
		}
	}

	void display() {
		strokeWeight(5);
		ellipseMode(RADIUS);
		ellipse(location.x, location.y, radius, radius);
	}
}

Point point;
void setup() {
	size(480, 360);
	smooth();
	background(255);
	point = new Point();
}

void draw() {
	background(255);
	point.move();
	point.display();
}

어떤 것이 더 마음에 드세요?

#### add()를 활용해 가속도운동 표현하기 ####
등속운동은 특별한 경우입니다. 속도의 변화가 없는 움직이라는 것은 일상에서는 보기 힘든 경우이지요. 버스가 출발하면 속도가 빨라지고 정류장에 가까워지면 속도를 줄여야 합니다. 바람에 움직이는 깃발은 바람의 방향을 따라 이리로 저리로 휘날립니다. 이처럼 속도가 변화하는 운동을 가속도 운동이라고 합니다.

속도 velocity에 변화를 주려면 velocity에 acceleration을 더하면 됩니다. velocity는 다시 location에 더해져 위치의 변화를 표현합니다.

코드로 정리할까요?

velocity.add(acceleration);
location.add(velocity);

이렇게 acceleration, velocity 그리고 location을 더해가면 속도가 변화는 물체의 위치를 계산할 수 있습니다. 

아래의 코드에서 확인해 봅시다. acceleration을 (-0.1, 0)으로 정하면 도형이 왼쪽으로 힘을 받게 됩니다. 왼쪽으로 속도가 계속 붙으면 더 빠른 속도로 벽에서 튕기게 됩니다. 다시 왼쪽으로 가속을 받고... 결국 도형이 화면이 왼쪽에 치우쳐서 운동합니다.

class Point {
	PVector location;
	PVector velocity;
	PVector acceleration;
	float radius = 30;
	
	Point() {
		location = new PVector(width / 2, height / 2);
		velocity = new PVector(random(10), random(10));
		acceleration = new PVector(-0.1, 0);
	}

	void move() {
		velocity.add(acceleration);
		location.add(velocity);

		//오른쪽 벽에 닿이면
		if (location.x > width - radius) {
			velocity.x = - velocity.x;
		}
		//왼쪽 벽에 닿이면
		else if (location.x < 0 + radius) {
			velocity.x = - velocity.x;
		}
		//아래쪽 바닥에 닿이면
		if (location.y > height - radius) {
			velocity.y = - velocity.y;
		}
		//위쪽 천장에 닿이면
		else if (location.y < 0 + radius) {
			velocity.y = - velocity.y;
		}
	}

	void display() {
		strokeWeight(5);
		ellipseMode(RADIUS);
		ellipse(location.x, location.y, radius, radius);
	}
}

Point point;
void setup() {
	size(480, 360);
	smooth();
	background(255);
	point = new Point();
}

void draw() {
	background(255);
	point.move();
	point.display();
}

#### random()로 가속도 정하기 ####
가속도가 늘 같을 필요도 없습니다. 임의의 가속도를 사용했을 때 도형이 어떤 움직임을 보일까요?

임의의 값을 가지는 PVector를 만들 때 PVector.random2D()를 사용하면 편리합니다.

class Point {
	PVector location;
	PVector velocity;
	PVector acceleration;
	float radius = 30;
	
	Point() {
		location = new PVector(width / 2, height / 2);
		velocity = new PVector(0, 0);
		acceleration = PVector.random2D();
	}

	void move() {
		acceleration = PVector.random2D();
		velocity.add(acceleration);
		location.add(velocity);

		//오른쪽 벽에 닿이면
		if (location.x > width - radius) {
			velocity.x = - velocity.x;
		}
		//왼쪽 벽에 닿이면
		else if (location.x < 0 + radius) {
			velocity.x = - velocity.x;
		}
		//아래쪽 바닥에 닿이면
		if (location.y > height - radius) {
			velocity.y = - velocity.y;
		}
		//위쪽 천장에 닿이면
		else if (location.y < 0 + radius) {
			velocity.y = - velocity.y;
		}
	}

	void display() {
		strokeWeight(5);
		ellipseMode(RADIUS);
		ellipse(location.x, location.y, radius, radius);
		println("acceleration:" + acceleration.x + ", " + acceleration.y);
	}
}

Point point;
void setup() {
	size(480, 360);
	smooth();
	background(255);
	point = new Point();
}

void draw() {
	background(255);
	point.move();
	point.display();
}


#### ArrayList ####
궤적을 그리려면 Point 객체가 여러개 필요합니다. 객체를 하나씩 만드는 대신 ArrayList 객체를 이용해 여러 개의 객체를 묶음으로 관리합시다.

먼저 코드를 볼까요?

class Point {
...
}

ArrayList<Point> points;

void setup() {
  size(480, 360);

  points = new ArrayList<Point>();
  points.add(new Point(100, 200));
  points.add(new Point(200, 300));
}

void draw() {
  points.get(0).display();
  points.get(1).display();
}




#### move() ####
#### display() ####
삼각형
previousLocation과 currentLocation 차이를 이용해 방향 구하기

### ArrayList<Fish> fishes ###
여러 물고기가 헤엄치도록 수정하기

#### 클릭하면 물고기가 늘어난다 ####


## processing in 3D ##
지금까지는 평면 위의 도형만 다루었습니다. 평면을 충분히 다루었으니 이제 3D 공간에 진출해 봅시다. 2D와 3D 사이는 생각보다 큰 차이가 없습니다. 아주 조금만 추가하면 3D 공간에 도형을 그릴 수 있습니다.

[[:TODO:]] formulated body
### 3D의 좌표체계 ###
3D 좌표시스템은 2D 좌표시스템에 기반하고 있습니다. 가로를 x축으로 삼고 세로를 y축으로 삼는 것이 기본입니다. 한가지 차이가 있다면 3D인 만큼 z 좌표 축이 추가됩니다. 모니터에서  여러분 방향으로 가까워지면 양의 z 값을 가지고 반대로 여러분에게서 멀어지면 음의 z 값을 가집니다.


![](http://i.imgur.com/rtj1NDz.png)


3D를 배경으로 도형을 배치하려 할 때 반드시 거쳐야 하는 설정이 하나 있습니다. size() 함수의 세번째 입력값으로 P3D를 넣습니다. 이렇게 설정을 한 후에야 공간에 도형의 위치를 특정할 수 있습니다.

2D에서 사용했던 point(), line(), vertex()와 같은 기본도형 함수는 3D에서도 여전히 유효합니다. z축 값만 추가로 제공하면 바로 공간 위에서 기본도형을 그릴 수 있습니다.

간단한 코드를 실행해 본 다음 이야기를 계속해 갈까요?

![](http://i.imgur.com/3uD85yb.jpg)

void setup() {
	size(480, 360, P3D);
}

void draw() {
	strokeWeight(10);
	background(255);

	//위
	beginShape();
	vertex(120, 180, 0);
	vertex(240, 180, 0);
	vertex(240, 60, 0);
	vertex(360, 60, 0);
	vertex(360, 300,0);
	vertex(120, 300, 0);
	endShape(CLOSE);

	//아래
	beginShape();
	vertex(120, 300, -120);
	vertex(360, 300, -120);
	vertex(360, 60, -120);
	vertex(240, 60, -120);
	vertex(240, 180, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);

	//스커트01
	beginShape();
	vertex(120, 180, 0);
	vertex(240, 180, 0);
	vertex(240, 180, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);

	//스커드02
	beginShape();
	vertex(240, 180, 0);
	vertex(240, 60, 0);
	vertex(240, 60, -120);
	vertex(240, 180, -120);
	endShape(CLOSE);

	//스커트03
	beginShape();
	vertex(240, 60, 0);
	vertex(360, 60, 0);
	vertex(360, 60, -120);
	vertex(240, 60, -120);
	endShape(CLOSE);

	//스커트04
	beginShape();
	vertex(360, 60, 0);
	vertex(360, 300, 0);
	vertex(360, 300, -120);
	vertex(360, 60, -120);
	endShape(CLOSE);

	//스커드05
	beginShape();
	vertex(120, 300, 0);
	vertex(360, 300, 0);
	vertex(360, 300, -120);
	vertex(120, 300, -120);
	endShape(CLOSE);

	//스커트06
	beginShape();
	vertex(120, 180, 0);
	vertex(120, 300, 0);
	vertex(120, 300, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);
}


3D에 도형을 그리는 것을 의도했지만 프로그램을 실행하면 평면 도형이 나타날 뿐입니다. 왜 이럴까요? 어디가 잘못된 것일까요?

잘못된 것은 없습니다. 지극히 정상적으로 작동하고 있는 결과입니다. 잘못은 우리가 3D를 제대로 이해하지 못한 데 있을 뿐입니다.

3D 공간에 도형을 그린다 하더라도 우리가 보는 도형은 모니터 평면에 랜더링된 모습에 불과합니다. 3D공간을 다룰 때는 항상 이 점에 주의해야 합니다. 3D 공간 위의 도형은 반드시 평면 위에 다시 표현되어야 합니다.

마치 영화를 촬영을 하는 것과 비슷합니다. 무대를 만들고 배우가 연기를 하는 것은 3D 공간이지만 이런 공간을 우리가 직접 볼 수는 없습니다. 우리가 볼 수 있는 것은 카메라로 촬영한 평면 이미지입니다. 같은 무대나 배우를 두고 카메라의 위치에 따라 다른 구도로 촬영하는 것과 마찬가지로 프로세싱에서도 카메라의 위치나 방향에 따라 같은 도형이 다른 모습으로 평면에 투사됩니다.

카메라가 바라보는 풍경을 결정하는 데는 세가지 요소가 필요합니다.

1. 카메라의 위치
	1. eyeX: 커질수록 카메라의 위치가 오른쪽으로 이동합니다.
	2. eyeY: 커질수록 카메라의 위치가 아래쪽으로 이동합니다.
	3. eyeZ: 커질수록 카메라가 줌아웃합니다.
2. 카메라가 바라보는 지점
	1. centerX: 커질수록 화면의 오른쪽으로 카메라의 시선이 이동합니다.
	2. centerY: 커질수록 화면의 아래쪽으로 카메라의 시선이 이동합니다.
	3. centerZ: 커질수록 카메라에 가까운 위치로 카메라의 시선을 이동합니다.
3. 카메라의 머리가 향하는 방향
	1. upX
	2. upY: 1인 경우 카메라를 수직으로 합니다. 보통 upY를 1로 정하고 upX와 upZ를 0으로 삼습니다. 이 값이 우리가 일상에서 카메라를 사용하는 방법에 대응됩니다.
	3. upZ

camera() 함수는 세가지 정보를 입력받아 모니터 평면에 3D 도형을 랜더링합니다.

기본 형식: camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
				

카메라의 위치를 바꿔서 위의 도형을 다시 랜더링해볼까요?

void setup() {
  	size(480, 360, P3D);
	//오른쪽 위에 카메라를 위치하고
	//도형의 중심을 바라봅니다
	//카메라는 y축 방향으로 수직을 유지합니다.
  	camera(480, 60, 360, 240, 180, 0, 0, 1, 0);
}

void draw() {
	strokeWeight(3);
	background(255);

	//위
	beginShape();
	vertex(120, 180, 0);
	vertex(240, 180, 0);
	vertex(240, 60, 0);
	vertex(360, 60, 0);
	vertex(360, 300,0);
	vertex(120, 300, 0);
	endShape(CLOSE);

	//아래
	beginShape();
	vertex(120, 300, -120);
	vertex(360, 300, -120);
	vertex(360, 60, -120);
	vertex(240, 60, -120);
	vertex(240, 180, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);

	//스커트01
	beginShape();
	vertex(120, 180, 0);
	vertex(240, 180, 0);
	vertex(240, 180, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);

	//스커드02
	beginShape();
	vertex(240, 180, 0);
	vertex(240, 60, 0);
	vertex(240, 60, -120);
	vertex(240, 180, -120);
	endShape(CLOSE);

	//스커트03
	beginShape();
	vertex(240, 60, 0);
	vertex(360, 60, 0);
	vertex(360, 60, -120);
	vertex(240, 60, -120);
	endShape(CLOSE);

	//스커트04
	beginShape();
	vertex(360, 60, 0);
	vertex(360, 300, 0);
	vertex(360, 300, -120);
	vertex(360, 60, -120);
	endShape(CLOSE);

	//스커드05
	beginShape();
	vertex(120, 300, 0);
	vertex(360, 300, 0);
	vertex(360, 300, -120);
	vertex(120, 300, -120);
	endShape(CLOSE);

	//스커트06
	beginShape();
	vertex(120, 180, 0);
	vertex(120, 300, 0);
	vertex(120, 300, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);
}

camera() 함수의 기본값은

* eyeX: width / 2.0
* eyeY: height / 2.0
* eyeZ: height / 2.0 / tan(PI * 30.0 / 180.0)
* centerX: width / 2.0
* centerY: height / 2.0
* centerZ: 0
* upX: 0
* upY: 1
* upZ: 0

입니다. 간단히 말하면 카메라가 화면을 정면으로 바라보는 위치입니다. 기본값 설정이 이렇게 되어 있으니 카메라가 이렇게 정면을 바라보게 되고 이런 이유로 공간도형을 그려도 화면에는 2D와 다름없이 나왔던 것입니다.

![camera 기본값](http://i.imgur.com/vq6xqUE.jpg)

카메라가 나왔으니 한가지 활용을 해볼까요? mouseX, mouseY와 camera()함수를 이용해 마우스의 움직임에 따라 도형을 둘러볼 수 있도록 수정합시다.

void setup() {
  	size(480, 360, P3D);
	//오른쪽 위에 카메라를 위치하고
	//도형의 중심을 바라봅니다
	//카메라는 y축 방향으로 수직을 유지합니다.
  	camera(480, 60, 360, 240, 180, 0, 0, 1, 0);
}

void draw() {
	float eyeX = map(mouseX, 0, width, 0, width * 2);
	float eyeY = map(mouseY, 0, height, 0, height * 2);
	camera(eyeX, eyeY, 360, 240, 180, 0, 0, 1, 0);
	strokeWeight(3);
	background(255);

	drawBlock();

}

void drawBlock() {

	//위
	beginShape();
	vertex(120, 180, 0);
	vertex(240, 180, 0);
	vertex(240, 60, 0);
	vertex(360, 60, 0);
	vertex(360, 300,0);
	vertex(120, 300, 0);
	endShape(CLOSE);

	//아래
	beginShape();
	vertex(120, 300, -120);
	vertex(360, 300, -120);
	vertex(360, 60, -120);
	vertex(240, 60, -120);
	vertex(240, 180, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);

	//스커트01
	beginShape();
	vertex(120, 180, 0);
	vertex(240, 180, 0);
	vertex(240, 180, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);

	//스커드02
	beginShape();
	vertex(240, 180, 0);
	vertex(240, 60, 0);
	vertex(240, 60, -120);
	vertex(240, 180, -120);
	endShape(CLOSE);

	//스커트03
	beginShape();
	vertex(240, 60, 0);
	vertex(360, 60, 0);
	vertex(360, 60, -120);
	vertex(240, 60, -120);
	endShape(CLOSE);

	//스커트04
	beginShape();
	vertex(360, 60, 0);
	vertex(360, 300, 0);
	vertex(360, 300, -120);
	vertex(360, 60, -120);
	endShape(CLOSE);

	//스커드05
	beginShape();
	vertex(120, 300, 0);
	vertex(360, 300, 0);
	vertex(360, 300, -120);
	vertex(120, 300, -120);
	endShape(CLOSE);

	//스커트06
	beginShape();
	vertex(120, 180, 0);
	vertex(120, 300, 0);
	vertex(120, 300, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);
}

카메라가 도형을 보며 회전하도록 합시다. 이렇게 하면 도형의 전경을 바라볼 수 있습니다. 카메라의 위치 중 y축을 고정하고 x축과 z축의 위치를 바꾸면 도형의 측면을 입체로 볼 수 있습니다.

float r = 0.0;
float cameraDistance = 480;

void setup() {
  	size(480, 360, P3D);
}

void draw() {
	float centerX = width / 2;
	float centerY = height / 2;
	float centerZ = -120 / 2;

	float eyeX = centerX + cameraDistance * cos(r);
	float eyeZ = centerZ + cameraDistance * sin(r);
	camera(eyeX, centerY, eyeZ, centerX, centerY, centerZ, 0, 1, 0);
	strokeWeight(3);
	background(255);

	drawBlock();
	r = r + 0.01;
}

void drawBlock() {

	//위
	beginShape();
	vertex(120, 180, 0);
	vertex(240, 180, 0);
	vertex(240, 60, 0);
	vertex(360, 60, 0);
	vertex(360, 300,0);
	vertex(120, 300, 0);
	endShape(CLOSE);

	//아래
	beginShape();
	vertex(120, 300, -120);
	vertex(360, 300, -120);
	vertex(360, 60, -120);
	vertex(240, 60, -120);
	vertex(240, 180, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);

	//스커트01
	beginShape();
	vertex(120, 180, 0);
	vertex(240, 180, 0);
	vertex(240, 180, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);

	//스커드02
	beginShape();
	vertex(240, 180, 0);
	vertex(240, 60, 0);
	vertex(240, 60, -120);
	vertex(240, 180, -120);
	endShape(CLOSE);

	//스커트03
	beginShape();
	vertex(240, 60, 0);
	vertex(360, 60, 0);
	vertex(360, 60, -120);
	vertex(240, 60, -120);
	endShape(CLOSE);

	//스커트04
	beginShape();
	vertex(360, 60, 0);
	vertex(360, 300, 0);
	vertex(360, 300, -120);
	vertex(360, 60, -120);
	endShape(CLOSE);

	//스커드05
	beginShape();
	vertex(120, 300, 0);
	vertex(360, 300, 0);
	vertex(360, 300, -120);
	vertex(120, 300, -120);
	endShape(CLOSE);

	//스커트06
	beginShape();
	vertex(120, 180, 0);
	vertex(120, 300, 0);
	vertex(120, 300, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);
}

사실 카메라를 회전하는 것과 도형을 회전하는 것은 같은 효과를 만듭니다. 이번에는 도형을 회전해 볼까요?

2D와 다르게 3D 환경에서는 각각의 축을 기준으로 도형을 회전시키는 함수가 따로 있습니다. rotateX()함수는 x축을 기준으로로, rotateY()는 y축을 기준으로 도형을 회전시킵니다. rotateZ()는 이름에서 알 수 있듯 z축을 기준으로 도형을 회전시킵니다.

위의 예제와 같은 효과를 내려면 y축을 기준으로 도형이 회전해야 합니다. rotateY()를 사용해서 같은 효과를 만들어 봅시다.

float r = 0.0;
float cameraDistance = 480;

void setup() {
  	size(480, 360, P3D);
}

void draw() {
	float centerX = width / 2;
	float centerY = height / 2;
	float centerZ = -120 / 2;

	camera(centerX, centerY, cameraDistance, centerX, centerY, centerZ, 0, 1, 0);

	rotateY(r);
	strokeWeight(3);
	background(255);

	drawBlock();
	r = r + 0.01;
}

void drawBlock() {

	//위
	beginShape();
	vertex(120, 180, 0);
	vertex(240, 180, 0);
	vertex(240, 60, 0);
	vertex(360, 60, 0);
	vertex(360, 300,0);
	vertex(120, 300, 0);
	endShape(CLOSE);

	//아래
	beginShape();
	vertex(120, 300, -120);
	vertex(360, 300, -120);
	vertex(360, 60, -120);
	vertex(240, 60, -120);
	vertex(240, 180, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);

	//스커트01
	beginShape();
	vertex(120, 180, 0);
	vertex(240, 180, 0);
	vertex(240, 180, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);

	//스커드02
	beginShape();
	vertex(240, 180, 0);
	vertex(240, 60, 0);
	vertex(240, 60, -120);
	vertex(240, 180, -120);
	endShape(CLOSE);

	//스커트03
	beginShape();
	vertex(240, 60, 0);
	vertex(360, 60, 0);
	vertex(360, 60, -120);
	vertex(240, 60, -120);
	endShape(CLOSE);

	//스커트04
	beginShape();
	vertex(360, 60, 0);
	vertex(360, 300, 0);
	vertex(360, 300, -120);
	vertex(360, 60, -120);
	endShape(CLOSE);

	//스커드05
	beginShape();
	vertex(120, 300, 0);
	vertex(360, 300, 0);
	vertex(360, 300, -120);
	vertex(120, 300, -120);
	endShape(CLOSE);

	//스커트06
	beginShape();
	vertex(120, 180, 0);
	vertex(120, 300, 0);
	vertex(120, 300, -120);
	vertex(120, 180, -120);
	endShape(CLOSE);
}

무언가 이상합니다. 제자리에서 회전을 해야 하는데 도형의 크기가 달라지는 것을 보니 무언가 잘못된 모양입니다. 혹시 짐작하셨나요? 2D에서 rotate()를 사용했을 때를 생각해보세요. rotate()는 항상 원점을 기준으로 좌표체계를 회전시킵니다. 3D에서도 달라질 것은 없습니다. rotateY()도 y축 원점을 중심으로 좌표체계를 회전시킵니다. 원점을 원하는 위치에 이동시키려면 3D에서도 2D와 마찬가지로 translate()함수를 사용합니다. 

이번 기회에 drawBlock() 함수도 정리합시다. 테트리스 블럭을 그리는 drawBlock()함수 내부에서  translate() 함수를 이용하도록 수정합니다.

이제 수정된 코드를 실행해볼까요??

float r = 0.0;
float cameraDistance = 480;

void setup() {
  	size(480, 360, P3D);
}

void draw() {
	
	float centerX = width / 2;
	float centerY = height / 2;
	float centerZ = -60;

	background(255);
	camera(centerX, centerY, cameraDistance, centerX, centerY, centerZ, 0, 1, 0);

	pushMatrix();
	
	rotateY(r);
	
	
	drawTetris(centerX, centerY, centerZ);
	popMatrix();

	r = r + 0.01;
}

void drawTetris(float posX, float posY, float posZ) {

	strokeWeight(3);
	float step = 120;
	float thickness = 60;
	translate(posX, posY, posZ);

	beginShape();
	pushMatrix();
	translate(0, 0, thickness);
	vertex(-step, 0, 0);
	vertex(0, 0, 0);
	vertex(0, -step, 0);
	vertex(step, -step, 0);
	vertex(step, step, 0);
	vertex(-step, step, 0);
	vertex(-step, 0, 0); 
	popMatrix();
	pushMatrix();
	translate(0, 0, -thickness);
	vertex(-step, 0, 0);
	vertex(0, 0, 0);
	vertex(0, -step, 0);
	vertex(step, -step, 0);
	vertex(step, step, 0);
	vertex(-step, step, 0);
	vertex(-step, 0, 0); 
	popMatrix();
	endShape(CLOSE);	
}

## formulated body ##
### grid 그리기 ###

3D 환경에서 도형을 그릴 때 vertex()를 사용하면 편리합니다. beginShape() 함수와 함께 사용하면 vertex를 나열하는 것만으로도 도형을 그릴 수 있습니다. 예를 들어 beginShape(QUAD_STRIP)은 긴 사각형 조각을 이어 붙이는 방법으로 도형을 묘사합니다.

void setup() {
  	size(480, 360, P3D);
}

void draw() {
  	int xCount = 12;
  	int yCount = 9;
  
  	scale(40);
  	strokeWeight(1/ 80.0);
  
  	background(255);
  	for (int y = 0; y < yCount; y++) {
    	beginShape(QUAD_STRIP);
    	for (int x = 0; x <= xCount; x++) {
     		vertex(x, y, 0);
      	vertex(x, y + 1, 0);
    	}
    	endShape();
  	}
}

위의 예제는 가로축 하나를 단위로 도형을 그리는 모습을 보여줍니다. beginShape(QUAD_STRIP) 이후에 vertex()를 나열하면 특정 순서로 beginShape(QUAD_STRIP) 함수는 특수한 순서로 입력되기를 기대합니다.

![](http://i.imgur.com/proKZHY.jpg)

[[:TODO:]] TRIANGLE_STRIP 예제

beginShape(TRIANGLE_STRIP) 함수도 도형을 쉽게 드릴 수 있는 편리한 함수입니다. beginShape(TRIANGLE_STRIP) 함수 이후에 입력되는 vertex는 특정한 순서로 해석됩니다.

![](http://i.imgur.com/uAch26d.jpg)

void setup() {
	size(480, 360, P3D);
}

void draw() {
	int xCount = 10;
	int yCount = 4;
	background(255);

	scale(40);
	strokeWeight(1 / 120.0);

	for (int y = 0; y < yCount; y++) {
		beginShape(TRIANGLE_STRIP);
		for (int x = 0; x <= xCount; x++) {
			vertex(x, y + 1, 0);
			vertex(x + 0.5, y, 0);
		}
		endShape();
	}
}

### grid 휘기 ###

평면에서 grid를 만들었다면 3D 그리드를 만드는 것은 생각보다 간단합니다.

x와 y값에서 z값을 계산할 수 있도록 함수를 하나 선택하세요.

예를 들어 z = sin(x)라는 관계식을 고르겠습니다. 이 관계식을 이용해 grid를 3D 화면에 그려봅시다.


	void setup() {
    	size(480, 360, P3D);	
	}

	void draw() {
    	int xCount = 10;
    	int yCount = 10;
    	background(255);

  		translate(50, 50);

	    scale(25);
	    strokeWeight(1 / 50.0);
	
	    for (int y = 0; y < yCount; y++) {
	      beginShape(QUAD_STRIP);
	      for (int x = 0; x <= xCount; x++) {
	          float z = sin(x);
	          vertex(x, y, z);
	          vertex(x, y + 1, z);
	      }
	      endShape();
	    }
	}

마우스를 움직여 시점을 조정할 수 있도록 수정합시다.

주의할 점이 있습니다. 저도 자주 실수하는 부분인데 translate()와 같이 좌표체계를 바꾸는 함수는 draw() 내부에서 매번 실행시켜야 합니다. 좌표체계는 draw() 함수가 마칠 때 다시 기본값으로 돌아갑니다.

	void setup() {
	  size(480, 360, P3D);
	}
	
	void draw() {
	  translate(width * 0.2, height * 0.1);
	  int xCount = 48;
	  int yCount = 36;
	  background(255);
	  
	  scale(10);
	  strokeWeight(1 / 20.0);
	
	  for (int y = 0; y < yCount; y++) {
	    beginShape(QUAD_STRIP);
	    for (int x = 0; x <= xCount; x++) {
	      float z = sin(sqrt(x*x + y * y));
	      vertex(x, y, z);
	      z = sin(sqrt(x*x + (y + 1) * (y + 1)));
	      vertex(x, y+1, z);
	    }
	    endShape();
	  }
	}





	
			


























