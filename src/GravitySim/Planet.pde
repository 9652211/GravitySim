public class Planet extends Astro {
  public Planet(float m, float x, float y, float xV, float yV, int r, int g, int b) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(xV, yV);
    c = color(r, g, b);
  }
}
