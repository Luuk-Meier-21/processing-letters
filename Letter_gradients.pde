
PImage img;
PFont myFont;

color colorBg = color(0, 0, 0);
color colorText = color(255, 255, 255);

CharGrid gridA;

void setup() {
  img = loadImage("test5.png");
  
  size(800, 500);
  img.resize(width * 2, height * 2);

  myFont = createFont("Helvetica", 32);
  textFont(myFont);
  Pos initialPos = new Pos(10, 20);
  gridA = new CharGrid("ABC", 0, 20, initialPos);
}

void draw() {
  background(colorBg);
  fill(0);
  noStroke();
  gridA.cells = mouseX / 3;
  gridA.maxFontSize = mouseY / 10;
  gridA.render();
}
