boolean start = true;
PImage saturn;

void setup() {
  size(900, 900);
  background(0);
  textAlign(CENTER);
  saturn = loadImage("Saturn.jpg");
  imageMode(CENTER);
}

void draw() {
  background(0);
  if(mousePressed) {
    start = false;
  }
  
  textSize(30);
  fill(255);
  text("Here's an image of Saturn until the project is developed further!", 450, 200);
  image(saturn, 450, 550, 323, 156);
  if(start) {
    fill(0, 0, 50);
    rect(0, 0, 900, 900);
    startScreen();
  }
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
