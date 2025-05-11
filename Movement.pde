// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// The "Vehicle" class (for wandering)

class Movement {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float wandertheta;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  PVector color1;

  Movement(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    position = new PVector(x, y);
    r = 6;
    wandertheta = 0;
    maxspeed = 5;
    maxforce = 1;
    color1 = new PVector(200, 0, 0);
  }

  void run() {
    update();
    borders();
    //display();
  }

  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }


  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }


  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the position to the target

    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force

    applyForce(steer);
  }


  // Wraparound
  void borders() {
    if (position.x < -r) position.x = width+r;
    if (position.y < -r) position.y = height+r;
    if (position.x > width+r) position.x = -r;
    if (position.y > height+r) position.y = -r;
  }
}


// A method just to draw the circle associated with wandering
void drawWanderStuff(PVector position, PVector circle, PVector target, float rad) {
  stroke(0);
  noFill();
  ellipseMode(CENTER);
  ellipse(circle.x, circle.y, rad*2, rad*2);
  ellipse(target.x, target.y, 4, 4);
  line(position.x, position.y, circle.x, circle.y);
  line(circle.x, circle.y, target.x, target.y);
}
