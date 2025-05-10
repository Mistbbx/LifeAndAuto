class rules {

  
  
 rules(){
 
 }

  Board GameOfLife(Board b) {
    Cell[][] temp = b.Create2DArray();  
    for (int i= 1; i<b.col-1; i++) {
      for (int j = 1; j <b.row-1; j++) {
        if (b.countN(i, j) < 2){
          temp[i][j].setColor(color(255,255,255));
          temp[i][j].setValue(0);}
        else if (b.countN(i, j) > 3){
          temp[i][j].setColor(color(255,255,255));
          temp[i][j].setValue(0);}
        else if (b.countN(i, j) == 3){
          temp[i][j].setColor(color(0,255,0));
          temp[i][j].setValue(1);}
        else{
          temp[i][j].setColor(b.board[i][j].getColor());
          temp[i][j].setValue(b.board[i][j].getValue());}
      }
    }
    
    b.board = temp;
    return b;
  }
  
  
  Board MyRules(Board b) {
    Cell[][] temp = b.Create2DArray();  
    for (int i= 1; i<b.col-1; i++) {
      for (int j = 1; j <b.row-1; j++) {
        if (b.countColor(i, j, color(0,255,0)) == 2){
          temp[i][j].setColor(color(0,255,0));
          temp[i][j].setValue(1);}
        else if (b.countColor(i, j, color(255,0,0)) == 3){
          temp[i][j].setColor(color(255,0,0));
          temp[i][j].setValue(1);}
          else if (b.countColor(i, j, color(0,0,255)) == 3){
          temp[i][j].setColor(color(0,0,255));
          temp[i][j].setValue(1);}
        else{
          temp[i][j].setColor(b.board[i][j].getColor());
          temp[i][j].setValue(b.board[i][j].getValue());}
      }
    }
    b.board = temp;
    return b;
  }





}
