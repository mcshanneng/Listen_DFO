class Buttons {
  float x, y;
  color buttonCol;

  Buttons() {
  }

  void display(float _x, float _y, color _buttonCol) {
    x=_x;
    y=_y;
    buttonCol=_buttonCol;

    fill(buttonCol);
    noStroke();
    ellipse(x, y, 30, 30);
  }
}
