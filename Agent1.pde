class Agent {
  Movement m;
  boolean isDead = false; // Determines if our agent is dead
  boolean isHungry = true; //Determines rather the agent is seeking or not
  char hungerFor = 'p'; //Can either be 'a' or 'p'. which determines if it seeks plants or other agents
  PVector pos;
  PVector color1 = new PVector(200, 0, 0);
  PVector color2 = new PVector(255, 0, 255);
  int number;
  int mitosis = 0;

  Agent(float x, float y) { //constructor
    m = new Wander(x, y); //makes a new wander for each agent
    pos = m.position; //sets pos to be where our object is, bc its easier to write pos than m.position
  }

  void update() {
    if (!isDead) { //checks if we are dead (semi useless)
      if (!isHungry) { //checks if we are not hungry
        m.run();
        if (hungerFor=='p') { //checks what we eat
          displayAP(); //draws our agent
        } else {displayAA(); } //draws our agent
        
      } else { //if we are hungry then
        m.seek(findTarget()); //seeks using findTarget()
        m.update();
        m.borders();
        if (hungerFor=='p') { //checks what we eat
          displayAP(); //draws our agent
        } else {displayAA(); } //draws our agent
      }
      if (mitosis >= 30) { //checks if we have eaten more than or equal to 30 plants
        mitosis = 0; // resets mitosis to 0
        a.add(new Agent(pos.x, pos.y)); //practically dublicates our agent
      }
    }
  }
  PVector findTarget() {
    int index = 0; //index of target
    float oldD = 2000; //old distance

    if (hungerFor == 'p' && p.size() > 0) { //are we seeking plants and are there any left
      for (int i =0; i<p.size(); i++) {
        if (m.position.dist(p.get(i).pos)< 20) { // checks if a target is close enought so that can kill it
          p.get(i).kill(); //send a message to the plant to kill it
          mitosis++; //adds one to our mitosis counter
        } else if (m.position.dist(p.get(i).pos) < oldD && p.get(i).isDead == false) { //checks to see if a target is closer that a prevois one and is alive
          oldD = m.position.dist(p.get(i).pos); //sets the distance to how far the most recent target is
          index = i; //stores the index of our target for later
        }
      }
    } else if (hungerFor == 'a' && a.size() > 0) { //are we seeking agents and are there any left
      for (int i =0; i<a.size(); i++) {
        if (m.position.dist(a.get(i).pos)< 20) {  // checks if a target is close enought so that can kill it
          a.get(i).kill(); //send a message to the agent to kill it
          for (int j = 0; j<a.size(); j++) { 
            a.get(j).number = j; //reassigns "number" on each agent after one is removed
          }
        } else if (m.position.dist(a.get(i).pos) < oldD && a.get(i).isDead == false) { //checks to see if a target is closer that a prevois one and is alive
          oldD = m.position.dist(a.get(i).pos); //sets the distance to how far the most recent target is
          index = i; //stores the index of our target for later
        }
      }
    } else { //if we have nothing to seek
      isHungry = false; //makes agent not hungry
      if (hungerFor=='p') { //checks if we eat plant or not
        m.maxforce=0.6; //small tweak to turn speed for wander()
      } else {
        m.maxforce=0.25; //small tweak to turn speed for wander()
      }
    }
    PVector t = new PVector(0, 0);
    if (hungerFor == 'p' && p.size() > 0) { //do we eat plants or not
      t = p.get(index).pos.copy(); //copies the pos of our target using index
    } else if (hungerFor == 'a' && a.size() > 0) { //do we eat agents or not
      t = a.get(index).pos.copy(); //copies the pos of our target using index
    }
    return t; //returns the pos of our target
  }


  void kill() {
    a.remove(number); //removes a dead agent for our array list
  }
  
  void displayAA() {
    // Draw a triangle rotated in the direction of velocity
    float theta = m.velocity.heading() + radians(90);
    fill(color1.x, color1.y, color1.z);
    stroke(0);
    pushMatrix();
    translate(m.position.x, m.position.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -m.r*2);
    vertex(-m.r, m.r*2);
    vertex(m.r, m.r*2);
    endShape();
    popMatrix();
  }

  void displayAP() {
    // Draws a circle
    fill(color2.x, color2.y, color2.z);
    ellipse(m.position.x, m.position.y, 10, 10);
  }
}
