import peasy.*;
PeasyCam cam;

Dot firstDot;
Dot secondDot;
Dot currentDot;
DotCloud firstCloud, secondCloud;
DotCloud[] clouds = new DotCloud[3];
float zoomF = 0.3f;
boolean debug = false;
int antiAlias = 5;
int antia = antiAlias;

void setup() {
  //size(1440, 900, OPENGL);
  size(640, 480, P3D);
  //size(2560, 1440, OPENGL);
  cam = new PeasyCam(this, 600);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  smooth(antia);
  frameRate(120);
  noCursor();
  background(255);
  stroke(43, 63, 79);
  pushMatrix();
  //translate(width/2, height/2, -50);
  fill(43, 63, 79);
  popMatrix();
  for (int i = 0; i < clouds.length; i++) clouds[i] = new DotCloud((int)random(200));
}

void draw() {
  background(255);
 
  translate(width/2, height/2, 0);  
  rotateY(frameCount * 0.003);
  //rotateX(frameCount * 0.003);
  rotateZ(frameCount * 0.003);
  scale(zoomF);
  for (DotCloud d: clouds) d.update();
}

void keyPressed() {
  switch(keyCode)
  {
    case UP:
      zoomF += 0.02f;
      break;
    case DOWN:
      zoomF -= 0.02f;
      if (zoomF < 0.01) zoomF = 0.01;
      break;
  }
}
 


