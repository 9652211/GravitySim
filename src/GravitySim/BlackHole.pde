public class BlackHole extends Astro {
  public BlackHole(float m, float x, float y, float xV, float yV) {
    mass = m;
    type = 'b';
    position = new PVector(x, y);
    velocity = new PVector(xV, yV);
    acceleration = new PVector(0, 0);
    c = color(0);
  }
  public void drawBH() {
    fill(0);
    circle(position.x, position.y, 100);
  }
  
}
