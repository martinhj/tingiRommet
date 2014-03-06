import peasy.*;
PeasyCam cam;

int numberOfClouds = 2;
int numberOfMaxDotsPerCloud = 300;
int numC = numberOfClouds;
int maxD = numberOfMaxDotsPerCloud;

Dot firstDot;
Dot secondDot;
Dot currentDot;

DotCloud[] clouds = new DotCloud[numC];
float zoomF = 0.3f;
boolean debug = false;
int antiAlias = 5;
int antia = antiAlias;




void setup() {
  size(1440, 900, OPENGL);
  //size(640, 480, P3D);
  //size(2560, 1440, OPENGL);
  cam = new PeasyCam(this, 600);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(5000);
  smooth(antia);
  frameRate(60);
  noCursor();
  background(255);
  stroke(43, 63, 79);
  pushMatrix();
  //translate(width/2, height/2, -50);
  fill(43, 63, 79);
  popMatrix();
  for (int i = 0; i < clouds.length; i++) clouds[i] = new DotCloud((int)random(maxD));
}




void draw() {
  background(255);

  //translate(width/2, height/2, 0);
  pushMatrix();
  rotateY(frameCount * 0.003);
  rotateX(frameCount * 0.003);
  rotateZ(frameCount * 0.003);
  scale(zoomF);
  for (DotCloud d: clouds) d.update();
  popMatrix();
  pushMatrix();

  for (DotCloud d: clouds) d.drawPoint();
  popMatrix();
  //frame.setTitle("" + frameRate);
  //println(frameRate);
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
