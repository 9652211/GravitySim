public class Star extends Astro {
  public Star(float m, float x, float y, float xV, float yV, int r, int g, int b) {
    mass = m;
    type = 's';
    position = new PVector(x, y);
    velocity = new PVector(xV, yV);
    acceleration = new PVector(0, 0);
    c = color(r, g, b);
  }
  public void drawS() {
    fill(c);
    circle(position.x, position.y, 50);
  }
}
