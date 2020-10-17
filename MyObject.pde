import java.awt.Color;

/**
 * An abstract class to be extended by actual shape classes.
 *
 * @author Jonathan Chang, Chun-yien <ccy@cctcc.art>
 */
public static abstract class MyObject {

  float x, y; // in ratio: [0, 1)
  float size; // in pixels
  int c;  // RGB

  public MyObject(float x, float y, float size, int c) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
  }

  public void move(float delta_x, float delta_y) {
    this.x += delta_x + 1;
    this.y += delta_y + 1;
    this.x %= 1;
    this.y %= 1;
  }

  public void resize(float delta) {
    if (delta < 0 && this.size < MIN_SIZE
      || delta > 0 && this.size > MAX_SIZE) {
      return;
    }
    this.size += delta;
  }

  public static MyObject getInstance(OOP_Tutorial canvas, float x, float y, float size, int c) {
    return Math.random() > 0.5 ?
      canvas.new Circle(x, y, size, c) :
      canvas.new Rect(x, y, size, c);
  }

  public int darkerColor() {
    return new Color(c).darker().getRGB();
  }

  public abstract void paint(OOP_Tutorial canvas);
}
