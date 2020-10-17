/**
 *
 * @author Jonathan Chang, Chun-yien <ccy@cctcc.art>
 */
public class Rect extends MyObject {

    public Rect(float x, float y, float size, int c) {
    super(x, y, size, c);
  }

  @Override
    public void paint(OOP_Tutorial canvas) {
    canvas.fill(c);
    canvas.stroke(darkerColor());
    canvas.rect(canvas.width * x - size / 2, 
      canvas.height * y - size / 2, 
      size, size);
  }
}
