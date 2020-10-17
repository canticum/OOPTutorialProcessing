/**
 *
 * @author Jonathan Chang, Chun-yien <ccy@cctcc.art>
 */
public class Circle extends MyObject {

  public Circle(float x, float y, float size, int c) {
    super(x, y, size, c);
  }

  @Override
    public void paint(OOP_Tutorial canvas) {
    canvas.fill(c);
    canvas.stroke(darkerColor());
    canvas.circle(canvas.width * x, canvas.height * y, size);
  }
}
