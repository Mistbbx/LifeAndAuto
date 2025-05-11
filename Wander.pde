class Wander extends Movement {

  Wander(float x, float y) {
    super(x, y);
  }

  void run() {
    wander();
    update();
    borders();
    display();
  }

  void wander() {
    float wanderR = 25;         // Radius for our "wander circle"
    float wanderD = 80;         // Distance for our "wander circle"
    float change = 0.3;
    wandertheta += random(-change, change);     // Randomly change wander theta

    // Now we have to calculate the new position to steer towards on the wander circle
    PVector circlepos = velocity.copy();    // Start with velocity
    circlepos.normalize();            // Normalize to get heading
    circlepos.mult(wanderD);          // Multiply by distance
    circlepos.add(position);               // Make it relative to boid's position

    float h = velocity.heading();        // We need to know the heading to offset wandertheta

    PVector circleOffSet = new PVector(wanderR*cos(wandertheta+h), wanderR*sin(wandertheta+h));
    PVector target = PVector.add(circlepos, circleOffSet);
    seek(target);

    // Render wandering circle, etc.
    if (debug) drawWanderStuff(position, circlepos, target, wanderR);
  }
}
