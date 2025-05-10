class Agent {
  Movement m;
  boolean isHungry = true;

  Agent(float x, float y) {
    m = new Wander(x, y);
  }

  void update() {
    fill(255,0,0);
    if (!isHungry)  
      m.run();
    else {
      
      m.seek(findTarget());
      m.update();
    m.borders();
    m.display();
    }
  }
  
  PVector findTarget(){
    int index = 0;
    float oldD = 1000;
    for(int i =0; i<p.size();i++){
    if(m.position.dist(p.get(i).pos) < oldD && p.get(i).isDead == false){
    oldD = m.position.dist(p.get(i).pos);
    index = i;
    if(m.position.dist(p.get(i).pos)< 20){
    p.get(i).kill();
    }
    }
    }
    PVector t = p.get(index).pos.copy();
  return t;
  }
  
}
