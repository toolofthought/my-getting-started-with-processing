//myMaze
PImage maze;
int posX;
int posY;

void setup() {
  size(324, 324);
  posX = width / 2;
  posY = height / 2;
  maze = loadImage("20 cells diameter theta maze.png");
}

void draw() {
  image(maze, 0, 0);
  fill(255, 0, 0);
  ellipse(posX, posY, 15, 15);

  println("(" + posX + ", " + posY + ")");

  if (red(maze.get(posX, posY)) < 255) {
    posX = width / 2;
    posY = height / 2;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      posY--;
    }
    else if (keyCode == DOWN) {
      posY++;
    }
    else if (keyCode == LEFT) {
      posX--;
    }
    else if (keyCode == RIGHT) {
      posX++;
    }
  }
  constrain(posX, 0, width);
  constrain(posY, 0, height);
}