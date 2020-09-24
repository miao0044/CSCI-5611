class ParticleSystem {
  int particle_num = 0;
  ArrayList<Fire_Particles> particles;
  PShape ParticleShape;
  float thetaX, thetaY;
  
  ParticleSystem() {
    particles = new ArrayList();
  }

  void run() {
    for (int i = 0; i < 50; i++) {
      addParticle();
    }
    update();
    display();
  }

  void addParticle() {
    if (particle_num < 1) {
      ParticleShape =  createShape(PShape.GROUP);
    }
      Fire_Particles p = new Fire_Particles();
      particles.add(p);
      particle_num += 1;
      ParticleShape.addChild(p.part);
  }

  void update() {
    for (int i = 0; i < particles.size(); i++) {
      Fire_Particles par = particles.get(i);
      if (par.isDead()) {
        particles.remove(par);
        ParticleShape.removeChild(i);
      }
      else {
        par.update();
      }
    }
  }

  void display() {
    shape(ParticleShape);
  }
}
