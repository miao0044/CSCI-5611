ParticleSystem ps;
Camera cam;
float speed = 5.0;
PImage smoke;
PImage fireRed;
PImage fireOrange;
PShape shotgun;

void setup() {
  size(2000, 1600, P3D);
  cam = new Camera();
  surface.setTitle("FireShot");
  
  colorMode (RGB, 256);
  smoke = loadImage("smoke.png");
  fireRed = loadImage("RedFire.png");
  fireOrange = loadImage("OrangeFire.png");
  shotgun = loadShape("lever_action.obj");
  ps = new ParticleSystem();
}

void keyPressed()
{
  cam.HandleKeyPressed();
}

void keyReleased()
{
  cam.HandleKeyReleased();
}

void draw() {
  background(255);
  cam.Update(5.0/frameRate);
  directionalLight(255.0, 255.0, 255.0, -1, 1, -1);
  
  background(20, 20, 20);
  stroke(0);  
  fill(255, 255, 255);
  textSize(20);
  text("frame rate: " + int(frameRate), -150, 100);
  text("number of agents: " + ps.particles.size(), -150, 125);
  
  ps.run();
  drawShotgun();
}

void drawShotgun() {
  pushMatrix();
  translate(185, 90, 200);
  rotate(0.5 * PI);
  rotateY(0.85 * PI);
  rotateZ(0.13 * PI);
  
  directionalLight(255, 255, 255, 0, -1, 0);
  directionalLight(255, 255, 255, 0, 1, 0);

  scale(10, 10, 10);
  shape(shotgun, 0, 0);
  popMatrix();
}
