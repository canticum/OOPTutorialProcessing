/**
 *
 * @author Jonathan Chang, Chun-yien <ccy@cctcc.art>
 */
static int AMOUNT = 1000;
static float MIN_SIZE = 5;
static float MAX_SIZE = 50;
static float DELTA_MOVE = 3.0f; // in pixel
float DELTA_SIZE = 0.01f; // in ratio

MyObject[] pool= new MyObject[AMOUNT];
int bgColor = 255;
PImage img;
boolean isClicked;

void settings() {
  fullScreen();
}  

void setup() {
  System.out.println(width);
  System.out.println(height);
  colorMode(RGB);
  for (int i = 0; i < AMOUNT; i++) {
    float x = random(1);
    float y = random(1);
    float size = random(MIN_SIZE, MAX_SIZE);
    color c = color(random(150, 250), random(150, 250), random(150, 250));
    pool[i] = MyObject.getInstance(this, x, y, size, c);
  }
  img = loadImage("nctu.png");
}

void draw() {
  background(bgColor);
  for (MyObject obj : pool) {
    obj.paint(this);
    obj.move(random(-DELTA_MOVE / width, DELTA_MOVE / width), 
      random(-DELTA_MOVE / height, DELTA_MOVE / height));
    obj.resize(random(-DELTA_SIZE, DELTA_SIZE));
  }
  if (mousePressed) {
    fill(255);
    circle(width/2, height/2, img.pixelWidth*1.5);
    image(img, (width - img.pixelWidth) / 2, (height - img.height) / 2);
    if (mouseButton == RIGHT) {
      noLoop();
    } else if (isClicked == false) {
      isClicked = true;
      bgColor = color(random(200, 255), random(200, 255), random(200, 255));
    }
  }
}

public void mouseReleased() {
  isClicked = false;
}
