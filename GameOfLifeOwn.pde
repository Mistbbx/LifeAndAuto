rules r = new rules();
Board test = new Board(192, 108);

int agentA = 10;
ArrayList<Plants> p = new ArrayList<Plants>(); //p = plants, makes an array list of plants
ArrayList<Agent> a = new ArrayList<Agent>(); //a = agents, makes an array list of agents
Agent[] a1 = new Agent[3]; //a1 = agents who eats other agents, makes an array of 3 agents
boolean debug = true;

void setup() {
  size(1920, 1080);
  //frameRate(10);
  //test.initBoard(1, color(0, 0, 255));

  for (int i = 0; i<agentA; i++ ) {
    a.add(new Agent(10, 10+i*100)); //adds an mount of agents equal to agentA
    a.get(i).number = i; //assigns a number to each agent
  }
  for (int i = 0; i<a1.length; i++ ) {
    a1[i] = new Agent(-1900, 1000+i*-500); //spawns 3 agents at diffrent coordinates
    a1[i].hungerFor = 'a';  //changes hungerFor for these agents to be 'a'
    a1[i].m.maxforce = 0.2; //changes how quickly these agents turn
    a1[i].m.maxspeed = 10;  //changes how quickly these agents move
  }
  for (int i = 0; i<test.col; i++ ) {
    for (int j = 0; j<test.row; j++ ) {
      if (test.board[i][j].getValue() == 1) {
        Plants temp = new Plants(i, j, test.col, test.row); //spawns plants along our tiles
        p.add(temp);
      }
    }
  }
}





void draw() {

  //test.nextGen2();
  test = r.GameOfLife(test);
  //test = r.MyRules(test);
  test.display();

  for (int i = 0; i<a.size(); i++) {
    a.get(i).update();
  }
  for (int i = 0; i<a1.length; i++) {
    a1[i].update();
  }
  p.clear();
  for (int i = 0; i<test.col; i++ ) {
    for (int j = 0; j<test.row; j++ ) {
      if (test.board[i][j].getValue() == 1) {
        Plants temp = new Plants(i, j, test.col, test.row);
        p.add(temp);
      }
    }
  }
  for (int i = 0; i<p.size(); i++) {
    p.get(i).update();
  }
}


void mousePressed() { //if you click you toggle debug
  debug = !debug;
}
