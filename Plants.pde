class Plants {
  PVector pos;
  boolean isDead = false;
  int i;
  int j;

  Plants(int _i, int _j, int c, int r) {
    i=_i;
    j=_j;
    pos = new PVector(i*width/c, j*height/r );
  }

  void update() {
    fill(0, 255, 0);
    if (!isDead)
      ellipse(pos.x, pos.y, 0, 0);
    fill(255);
  }

  void kill() {
    isDead = true;
    test.board[i][j].setValue(0);
  }
}
