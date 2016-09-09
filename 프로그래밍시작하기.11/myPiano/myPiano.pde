//myPiano
import ddf.minim.*;
Minim minim;
AudioSample c;
AudioSample d;
AudioSample e;
AudioSample f;
AudioSample g;
AudioSample a;
AudioSample b;

void setup() {
  minim = new Minim(this);
  c = minim.loadSample("c48.mp3", 512);
  d = minim.loadSample("d50.mp3", 512);
  e = minim.loadSample("e52.mp3", 512);
  f = minim.loadSample("f53.mp3", 512);
  g = minim.loadSample("g55.mp3", 512);
  a = minim.loadSample("a57.mp3", 512);
  b = minim.loadSample("b59.mp3", 512);
}

void draw() {
}

void keyPressed() {
  if (key == 'c' || key == 'C') {
    c.trigger();
  }
  else if (key == 'd' || key == 'D') {
    d.trigger();
  }
  else if (key == 'e' || key == 'E') {

  }
  else if (key == 'f' || key == 'F') {
    f.trigger();
  }
  else if (key == 'g' || key == 'G') {
    g.trigger();
  }
  else if (key == 'a' || key == 'A') {
    a.trigger();
  }
  else if (key == 'b' || key == 'B') {
    b.trigger();
  }
}  