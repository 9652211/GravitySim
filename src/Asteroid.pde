public class Asteroid {
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private color c;
  public Asteroid(float x, float y, float xV, float yV, int r, int g, int b) {
    position = new PVector(x, y);
    velocity = new PVector(xV, yV);
    c = color(r, g, b);
  }
}
