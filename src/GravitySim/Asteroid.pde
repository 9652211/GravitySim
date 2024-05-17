public class Asteroid extends Astro {
  
  public Asteroid(float x, float y, float xV, float yV, int r, int g, int b) {
    mass = 0;
    type = 'a';
    position = new PVector(x, y);
    velocity = new PVector(xV, yV);
    acceleration = new PVector(0, 0);
    c = color(r, g, b);
  }
  public void drawA() {
    fill(c);
    circle(position.x, position.y, 10);
  }
}
