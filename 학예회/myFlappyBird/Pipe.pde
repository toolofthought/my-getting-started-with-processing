class Pipe {
  	float x;
  	float top;
  	float bottom;
  	float w = 40;

  	Pipe() {
    	x = wid + w;
    	top = random(100, height/2);
    	bottom = random(100, height/2);
  	}

  	boolean hits(Bird b) {
    	if (b.location.x > x && b.location.x < x + w) {
      		if ((b.location.y < top+b.radius) || (b.location.y > (height-bottom-b.radius))) {
        		return true;
      		}
    	}
    	return false;
  	}

  	void move() {
    	x-=3;
  	}

  	void display(boolean hit) {
    	stroke(255);
    	if (hit) {      
      		fill(255, 0, 0);
    	} 
    	else {
      		fill(255);
    	}
    	rect(x, 0, w, top); 
    	rect(x, height-bottom, w, bottom);
  	}
}
