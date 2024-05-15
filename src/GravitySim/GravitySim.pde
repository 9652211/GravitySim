boolean start = true;
boolean pressed;
boolean lastPressed;
boolean click;
boolean release;
char o;
PImage saturn;
ArrayList<PVector> positions;

void setup() {
  size(900, 900);
  background(255);
  textAlign(CENTER);
  saturn = loadImage("Saturn.jpg");
  positions = new ArrayList<PVector>();
  o = 'n';
  imageMode(CENTER);
}

void draw() {
  background(50);
  pressed = mousePressed;
  if(pressed) {
    start = false;
  }
  click = pressed&&!lastPressed;
  release = !pressed&&lastPressed;
  if(click) {
    if(dist(mouseX, mouseY, 750, 300)<100) {
      o = 'b';
    } else if(dist(mouseX, mouseY, 750, 400)<50) {
      o = 's';
    } else if(dist(mouseX, mouseY, 750, 500)<20) {
      o = 'p';
    } else if(dist(mouseX, mouseY, 800, 500)<20) {
      o = 'a';
    }
  }
  if(o=='b') {
    fill(0);
    circle(mouseX, mouseY, 100);
  }
  if(click) {
    
  }
  textSize(30);
  fill(255);
  text("Here's an image of Saturn until the project is developed further!", 450, 200);
  text(o, 700, 600);
  fill(0);
  circle(750, 300, 100);
  fill(255, 255, 50);
  circle(750, 400, 50);
  fill(165, 42, 42);
  circle(750, 500, 20);
  fill(150, 150, 150);
  circle(800, 500, 10);
  image(saturn, 450, 550, 323, 156);
  if(start) {
    fill(0, 0, 50);
    rect(0, 0, 900, 900);
    startScreen();
  }
  lastPressed = mousePressed;
}

void startScreen() {
  fill(255);
  textSize(30);
  text("Welcome to the ...", 450, 100);
  textSize(100);
  text("GRAVITY", 450, 300);
  text("SIMULATOR!", 450, 400);
  textSize(30);
  text("Click anywhere to begin!", 450, 600);
}
