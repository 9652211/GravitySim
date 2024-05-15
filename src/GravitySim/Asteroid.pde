public class Asteroid extends Astro {
  
  public Asteroid(float x, float y, float xV, float yV, int r, int g, int b) {
    mass = 0;
    position = new PVector(x, y);
    velocity = new PVector(xV, yV);
    c = color(r, g, b);
  }
}
