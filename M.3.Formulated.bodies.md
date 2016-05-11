# mesh 그리기 #
입체 도형을 만드는 기본은 mesh입니다. 우선 mesh를 3D 공간에서 그리는 법을 익혀봅시다.

mesh를 그릴 때 beginShape(TRIANGLE_STRIP)이나 beginShape(QUAD_STRIP)을 사용하면 편리합니다. 입력할 때는 반드시 아래의 순서를 따라야 합니다.

![](http://i.imgur.com/83DaoGh.jpg)

## 기본 도형: 고정된 도형 ##

	//M_3_1_01.pde
	float rotationX = 0.0;
	float rotationY = 0.0;
	float offsetX = 0.0;
	float offsetY = 0.0;
	float clickRotationX;
	float clickRotationY;
	float targetRotationX;
	float targetRotationY;
	float clickX;
	float clickY;
	int nX = 3;
	int nY = 3;
	
	void setup() {
		size(480, 360, P3D);
		strokeWeight(1 / 80.0);
	}
	
	void draw() {
		setView();
		scale(40);
		for (int y = 0; y < nY; y++) {
			beginShape(QUAD_STRIP);
			for (int x = 0; x <= nX; x++) {
				vertex(x, y, 0);
				vertex(x, y + 1, 0);
			}
			endShape();
		}
	}
	
	void mousePressed() {
		clickRotationX = rotationX;
		clickRotationY = rotationY;
		clickX = mouseX;
		clickY = mouseY;
	}
	
	void setView() {
		translate(width / 2.0, height / 2.0);
		rotateX(rotationY);
		rotateY(rotationX);
	}

### 오답노트 ###
setView()가 scale() 이전에 실행되어야 합니다.

## 기본 도형: 마우스 따라 회전하는 도형 ##

	//M_3_1_01.pde
	float rotationX = 0.0;
	float rotationY = 0.0;
	float offsetX = 0.0;
	float offsetY = 0.0;
	float clickRotationX;
	float clickRotationY;
	float targetRotationX;
	float targetRotationY;
	float clickX;
	float clickY;
	int nX = 3;
	int nY = 3;
	
	void setup() {
		size(480, 360, P3D);
		strokeWeight(1 / 80.0);
	}
	
	void draw() {
		background(255);
		setView();
		scale(40);
		for (int y = 0; y < nY; y++) {
			beginShape(QUAD_STRIP);
			for (int x = 0; x <= nX; x++) {
				vertex(x, y, 0);
				vertex(x, y + 1, 0);
			}
			endShape();
		}
	}
	
	void mousePressed() {
		clickRotationX = rotationX;
		clickRotationY = rotationY;
		clickX = mouseX;
		clickY = mouseY;
	}
	
	void setView() {
		translate(width / 2.0, height / 2.0);
		if (mousePressed) {
			offsetX = mouseX - clickX;
			offsetY = mouseY - clickY;
			targetRotationX = clickRotationX + offsetX / float(width) * TWO_PI;
			targetRotationY = clickRotationY + offsetY / float(height) * TWO_PI;
		}
		rotationX += (targetRotationX - rotationX);
		rotationY += (targetRotationY - rotationY);
		rotateX(-rotationY);
		rotateY(rotationX);
	}

## sin() 함수로 mesh 휘기: 고정 버전 ##

	//M_3_2_01.pde에 기초한 내용입니다.
	
	int nX = 10;
	int nY = 4;
	
	void setup() {
		size(480, 360, P3D);
		strokeWeight(1/80.0);
	}
	
	void draw() {
		background(255);
		setView();
		scale(40);
		for (int y = 0; y < nY; y++) {
			beginShape(QUAD_STRIP);
			for (int x = 0; x <= nX; x++) {
				vertex(x, y, sin(x));
				vertex(x, y + 1, sin(x));
			}
			endShape();
		}
	}
	
	void setView() {
		translate(100, 100, 0);
	}


## sin() 함수로 mesh 휘기: 회전 버전 ##
	//M_3_2_01.pde에 기초한 내용입니다.
	
	int nX = 10;
	int nY = 4;
	
	void setup() {
		size(480, 360, P3D);
		strokeWeight(1/80.0);
	}
	
	void draw() {
		background(255);
		setView();
		scale(40);
		for (int y = 0; y < nY; y++) {
			beginShape(QUAD_STRIP);
			for (int x = 0; x <= nX; x++) {
				vertex(x, y, sin(x));
				vertex(x, y + 1, sin(x));
			}
			endShape();
		}
	}
	
	void setView() {
		translate(30, 30, 0);
		if (mousePressed) {
			offsetX = mouseX - clickX;
			offsetY = mouseY - clickY;
			targetRotationX = clickRotationX + offsetX / float(width) * TWO_PI;
			targetRotationY = clickRotationY + offsetY / float(height) * TWO_PI;
			rotationX += targetRotationX - rotationX;
			rotationY += targetRotationY - rotationY;
		}
		rotateX(-rotationY);
		rotateY(rotationX);
	}
	
	float clickX;
	float clickY;
	float clickRotationX;
	float clickRotationY;
	float targetRotationX;
	float targetRotationY;
	float offsetX;
	float offsetY;
	float rotationX;
	float rotationY;
	
	
	void mousePressed() {
		clickX = mouseX;
		clickY = mouseY;
		clickRotationX = rotationX;
		clickRotationY = rotationY;
	}

## sin(sqrt(x^2 + y^2))  함수로 mesh 휘기: 회전 버전 ##

	//M_3_2_02.pde에 기초한 내용입니다.

	

	








