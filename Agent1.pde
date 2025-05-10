class Agent {
  Movement m;
  boolean isHungry = true;
  char hungerFor = 'p';
  boolean isDead = false;
  PVector pos;

  Agent(float x, float y) {
    m = new Wander(x, y);
  }

  void update() {
    fill(255,0,0);
    if (!isDead){
      if (!isHungry)  
        m.run();
      else {
        
        m.seek(findTarget());
        m.update();
      m.borders();
      m.display();
      }
    }
  }
  PVector findTarget(){
    int index = 0;
    float oldD = 1000;
    if (hungerFor == 'p'){
      for(int i =0; i<p.size();i++){
        if(m.position.dist(p.get(i).pos) < oldD && p.get(i).isDead == false){
          oldD = m.position.dist(p.get(i).pos);
          index = i;
          if(m.position.dist(p.get(i).pos)< 20){
            p.get(i).kill();
          }
        }
      }
    }
    
    if (hungerFor == 'a'){
      for(int i =0; i<a.length;i++){
        if(m.position.dist(a[i].pos) < oldD && a[i].isDead == false){
          oldD = m.position.dist(a[i].pos);
          index = i;
          if(m.position.dist(a[i].pos)< 20){
            a[i].kill();
          }
        }
      }
    }
    PVector t = p.get(index).pos.copy();
  return t;
  }
    
  void kill() {
    isDead = true;
  }
  
}
