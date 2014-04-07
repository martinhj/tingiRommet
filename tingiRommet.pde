import peasy.*;
PeasyCam cam;
PFont font;

int numberOfClouds = 3;
int numberOfMaxDotsPerCloud = 40;
int numC = numberOfClouds;
int maxD = numberOfMaxDotsPerCloud;

Dot firstDot;
Dot secondDot;
Dot currentDot;

DotCloud[] clouds = new DotCloud[numC];
float zoomF = 0.2f;
float time, usedTime;
boolean debug = false;
int antiAlias = 5;
int antia = antiAlias;

color bg = color(255);
color fg = color(43, 43, 43);

boolean record = false;




void setup() {
  size(1024, 576, OPENGL);
  textSize(8);
  //font = loadFont("Consolas-10.vlw");
  //textFont(font);
  //size(640, 480, P3D);
  //size(2560, 1440, OPENGL);
  cam = new PeasyCam(this, 600);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(5000);
  smooth(antia);
  frameRate(30);
  noCursor();
  /*background(255);*/
  /*pushMatrix();*/
  //translate(width/2, height/2, -50);
  stroke(fg);
  fill(fg);
  /*popMatrix();*/
  for (int i = 0; i < clouds.length; i++) clouds[i] = new DotCloud((int)random(maxD - maxD/2, maxD));
}



void printFrameRate() {
  /*noFill();*/
  fill(bg);
  rect(-500,-320, 200, 200, 5);
  fill(43, 63, 79);
  stroke(255);
  text(frameRate, -500, -300);
  text(usedTime, -500, -270);
  stroke(43, 63, 79, 100);
}

void draw() {
  background(bg);
  /*printFrameRate();*/


  //translate(width/2, height/2, 0);
  pushMatrix();
  scale(zoomF);
  ///*
  rotateY(frameCount * 0.006);
  //rotateX(frameCount * 0.003);
  //rotateZ(frameCount * 0.003);
  //*/
  for (DotCloud d: clouds) d.update();
  popMatrix();


  /*time = millis();*/
  pushMatrix();
  for (DotCloud d: clouds) d.drawPoint();
  popMatrix();
  /*usedTime = millis() - time;*/
  //frame.setTitle("" + frameRate);
  //println(frameRate);



  if (record) saveFrame();
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
  switch(key)
  {
    case 'r':
      if (record) record = false;
      else record = true;
      break;
  }

}
