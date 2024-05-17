boolean start = true;
boolean pressed;
boolean lastPressed;
boolean click;
boolean clicked;
boolean dragging;
boolean release;
boolean goTime;
boolean clickable;
boolean isStart;
float g;
char o;
PImage saturn;
PVector pos;
PVector posFinal;
PVector v;
ArrayList<Astro> astros;
ArrayList<BlackHole> blackholes;
ArrayList<Asteroid> asteroids;
ArrayList<Planet> planets;
ArrayList<Star> stars;
ArrayList<PVector> positions;

void setup() {
  size(900, 900);
  background(255);
  textAlign(CENTER);
  saturn = loadImage("Saturn.jpg");
  g = 0.001;
  clicked = false;
  dragging = false;
  goTime = false;
  isStart = true;
  astros = new ArrayList<Astro>();
  blackholes = new ArrayList<BlackHole>();
  asteroids = new ArrayList<Asteroid>();
  planets = new ArrayList<Planet>();
  stars = new ArrayList<Star>();
  positions = new ArrayList<PVector>();
  o = 'n';
  imageMode(CENTER);
  noStroke();
}

void draw() {
  background(50);
  pressed = mousePressed;
  clickable = !(clicked||dragging||goTime);
  if(pressed) {
    start = false;
  }
  click = pressed&&!lastPressed&&!isStart;
  release = !pressed&&lastPressed&&!isStart;
  /*for(Astro astro : astros) {
    for(Astro alt : astros) {
      if(alt!=astro) {
        PVector r = astro.position.sub(alt.position);
        PVector direction = r.div(r.mag());
        println(r.mag());
        astro.acceleration = astro.acceleration.add(direction.mult((g*alt.mass)/(r.magSq())));
        
      }
      //astro.velocity = astro.velocity.add(astro.acceleration);
      
      astro.acceleration.x = 0;
      astro.acceleration.y = 0;
      
      //println(astro.velocity.mag());
    }
  }*/
  
  if(blackholes.size()>1) {
    PVector r = blackholes.get(0).position.sub(blackholes.get(1).position);
  }
  for(BlackHole blackhole : blackholes) {
    blackhole.drawBH();
    blackhole.position = PVector.add(blackhole.position, blackhole.velocity);
  }
  for(Star star : stars) {
    star.drawS();
    star.position = PVector.add(star.position, star.velocity);
  }
  for(Planet planet : planets) {
    planet.drawP();
    planet.position = PVector.add(planet.position, planet.velocity);
  }
  for(Asteroid asteroid : asteroids) {
    asteroid.drawA();
    asteroid.position = PVector.add(asteroid.position, asteroid.velocity);
  }
  if(click) {
    if(clickable) {
      if(dist(mouseX, mouseY, 750, 300)<50) {
        o = 'b';
      } else if(dist(mouseX, mouseY, 750, 400)<25) {
        o = 's';
      } else if(dist(mouseX, mouseY, 750, 500)<10) {
        o = 'p';
      } else if(dist(mouseX, mouseY, 800, 500)<5) {
        o = 'a';
      }
    }
    if(clicked) {
      
      clicked = false;
      pos = new PVector(mouseX, mouseY);
      dragging = true;
    }
  }
  if(o=='b') {
    fill(0);
    circle(mouseX, mouseY, 100);
  } else if(o=='s') {
    fill(255, 255, 0);
    circle(mouseX, mouseY, 50);
  } else if(o=='p') {
    fill(165, 42, 42);
    circle(mouseX, mouseY, 20);
  } else if(o=='a') {
    fill(150);
    circle(mouseX, mouseY, 10);
  }
  if(release) {
    if(dragging) {
      posFinal = new PVector(mouseX, mouseY);
      v = PVector.sub(pos, posFinal);
      if(o=='b') {
        BlackHole bhtemp = new BlackHole(100, mouseX, mouseY, v.x/100, v.y/100);
        blackholes.add(bhtemp);
        astros.add(bhtemp);
      } else if(o=='s') {
        Star stemp = new Star(100, mouseX, mouseY, v.x/100, v.y/100, 255, 255, 0);
        stars.add(stemp);
        astros.add(stemp);
      } else if(o=='p') {
        Planet ptemp = new Planet(100, mouseX, mouseY, v.x/100, v.y/100, 165, 42, 42);
        planets.add(ptemp);
        astros.add(ptemp);
      } else if(o=='a') {
        Asteroid atemp = new Asteroid(mouseX, mouseY, v.x/100, v.y/100, 150, 150, 150);
        asteroids.add(atemp);
        astros.add(atemp);
      }
      dragging = false;
      o = 'n';
    }
    if(o!='n'&&clickable) {
      clicked = true;
    }
  }
  /*if(clickable) {
    if(astros.size()>0) {
      println("clickable" + " " + astros.size() + " " + astros.get(0).acceleration.mag());
    }
    println("clickable");
  } else if(clicked) {
    println("clicked");
  } else if(dragging) {
    println("dragging");
  }*/
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
  isStart = start;
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
