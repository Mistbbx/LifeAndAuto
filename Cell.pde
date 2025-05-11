class Cell {
  int value = 0;
  color c = color(0);

  Cell() {
  }

  int getValue() {
    return value;
  }

  void setValue(int _value) {
    value = _value;
  }
  void setColor(color _c) {
    c = _c;
  }

  color getColor() {
    return c;
  }
}
