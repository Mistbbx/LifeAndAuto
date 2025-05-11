class Agent {
  Movement m;
  boolean isHungry = true;
  char hungerFor = 'p';
  boolean isDead = false;
  PVector pos;
  int number;
  int mitosis = 0;

  Agent(float x, float y) {
    m = new Wander(x, y);
    pos = m.position;
  }

  void update() {
    fill(255, 0, 0);
    if (!isDead) {
      if (!isHungry)
        m.run();
      else {
        m.seek(findTarget());
        m.update();
        m.borders();
        if (hungerFor=='p') {
          displayA();
        } else {
          m.display();
        }
      }
      if (mitosis >= 30) {
        a.add(new Agent(pos.x, pos.y));
        mitosis = 0;
      }
    }
  }
  PVector findTarget() {
    int index = 0;
    float oldD = 2000;

    if (hungerFor == 'p' && p.size() > 0) {
      for (int i =0; i<p.size(); i++) {
        if (m.position.dist(p.get(i).pos)< 20) {
          p.get(i).kill();
          mitosis++;
        } else if (m.position.dist(p.get(i).pos) < oldD && p.get(i).isDead == false) {
          oldD = m.position.dist(p.get(i).pos);
          index = i;
        }
      }
    } else if (hungerFor == 'a' && a.size() > 0) {
      for (int i =0; i<a.size(); i++) {
        if (m.position.dist(a.get(i).pos)< 20) {
          a.get(i).kill();
          for (int j = 0; j<a.size(); j++) {
            a.get(j).number = j;
          }
        } else if (m.position.dist(a.get(i).pos) < oldD && a.get(i).isDead == false) {
          oldD = m.position.dist(a.get(i).pos);
          index = i;
        }
      }
    } else {
      isHungry = false;
    }
    PVector t = new PVector(0, 0);
    if (hungerFor == 'p' && p.size() > 0) {
      t = p.get(index).pos.copy();
    } else if (hungerFor == 'a' && a.size() > 0) {
      t = a.get(index).pos.copy();
    }
    return t;
  }


  void kill() {
    print(a.size()+" ");
    a.remove(number);
  }

  void displayA() {
    fill(255, 0, 255);
    ellipse(pos.x, pos.y, 10, 10);
  }
}
