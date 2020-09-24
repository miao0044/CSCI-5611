class Fire_Particles {
  float LifeSpan;
  float size;
  Vec3 loc, acc, vel;
  PShape part;
  PImage FireBurn;
  
  Fire_Particles() {
    float x = 0.0;
    float y = 0.0;
    float z = 0.0;
    float r = sqrt(random(100, 400));
    float theta = random(0, 2*PI);
    
    x = r * sin(theta);
    z = r * cos(theta);
    x += 100 + random(-5, 5);
    y = -100 + random(-20, 20);
    z += 200 + random(-10,10);
    
    loc = new Vec3(x, y, z);
    acc = new Vec3(0, 0, 0);
    x = -1 * x / 20;
    z = -1 * z / 20;
    vel = new Vec3(x, -10, z);
    
    size = random(2, 6);
    LifeSpan = 20 + int(random(10));
    part = createShape();
    part.beginShape(QUAD);
    part.noStroke();
    
    if (LifeSpan < 25) {
      part.texture(fireRed);
    }
    else if (LifeSpan > 27.5) {
      part.texture(smoke);
    }
    else {
      part.texture(fireOrange);
    }
    
    part.normal(0, 0, 1);
    part.vertex(loc.x, loc.y-size/2, loc.z, 200 + random(-50, 50), 200 - random(-50, 50));
    part.vertex(loc.x+size/2, loc.y, loc.z, 200 + random(-50, 50), 200 - random(-50, 50));
    part.vertex(loc.x, loc.y+size/2, loc.z, 200 + random(-50, 50), 200 - random(-50, 50));
    part.vertex(loc.x-size/2, loc.y, loc.z, 200 + random(-50, 50), 200 - random(-50, 50));
    part.endShape();
  }
    
  boolean isDead() {
    if (LifeSpan < 0) {
      return true;
    }
    else
      return false;
  }
    
  void display() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    noStroke();
    sphere (size);
    popMatrix();
  }
  
  void update() {
    LifeSpan -= 1;
    vel.add(acc);
    loc.add(vel);
    Vec3 mov = new Vec3 (0, 0, 0);
    mov = vel;
    part.translate(mov.x, mov.y, mov.z);
  }
}
