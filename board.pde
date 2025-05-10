class  Board {
  int col = 10;
  int row = 10;
  Cell[][] board = new Cell[col][row];

  Board() {
    for (int i=0; i<col; i++) {
      for (int j = 0; j<row; j++)
      {
        board[i][j] = new Cell();
        board[i][j].setValue((int)random(4));
      }
    }
  }


  Board(int _col, int _row) {
    col = _col;
    row = _row;
    board = new Cell[col][row];
    for (int i=0; i<col; i++) {
      for (int j = 0; j<row; j++)
      {
        board[i][j] = new Cell();
        board[i][j].setValue((int)random(2));
        
      }
    }
  }
  void display() {

    for (int i=0; i<col; i++) {
      for (int j = 0; j<row; j++)
      {
        if (board[i][j].getValue() == 0) {
          fill(board[i][j].getColor());
          rect(i*(width/col), j*(height/row), width/col, height/row);
        } else {
          fill(board[i][j].getColor());
          rect(i*(width/col), j*(height/row), width/col, height/row);
        }
      }
    }
  }

  int countN(int _i, int _j) {
    int n = 0;
    for (int k = -1; k <=1; k++) {
      for (int l = -1; l<=1; l++) {
        n += board[_i+k][_j+l].getValue();
      }
    }
    n -= board[_i][_j].getValue();
    return n;
  }
  
  int countColor(int _i, int _j, color _c) {
    int n = 0;
    for (int k = -1; k <=1; k++) {
      for (int l = -1; l<=1; l++) {
        if(board[_i+k][_j+l].getColor() == _c)
        n++;
      }
    }
    if(board[_i][_j].getColor() == _c)
    n--;
    return n;
  }

  Cell[][] Create2DArray() {
    Cell[][] temp = new Cell[col][row];
    for (int i=0; i <col; i++) {
      for (int j =0; j<row; j++) {
        temp[i][j] = new Cell();
      }
    }

    return temp;
  }
  
  
  void emptyBoard(){
  board = Create2DArray();
  }
  
  void initBoard(int _value, color _c){
  emptyBoard();
  for(int i =0;i<col;i++){
  for(int j =0; j<row;j++){
  board[i][j].setValue(_value);
  board[i][j].setColor(_c);
  }
  }
  
  
  }
  
}
