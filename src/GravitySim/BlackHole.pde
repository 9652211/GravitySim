public class BlackHole {
  private float mass;
  private PVector position;
  private PVector velocity;
  private PVector acceleration;
  private color c;
  public BlackHole(float m, float x, float y, float xV, float yV) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(xV, yV);
    c = color(0);
  }
}
