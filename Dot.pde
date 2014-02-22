class Dot {
int sphereRadius = 1000;
float lineThickness = 1.5;

float lineT = lineThickness;
int radius = sphereRadius;


float s = 0;
float t = 0;
boolean debug = false;
Dot previous;
Dot next;
float wpos, hpos, dpos;
float size;
Dot(Dot p) {
  previous = p;
  /*
  wpos = random(-2000, 2000);
  hpos = random(-2000, 2000);
  dpos = random(-2000, 2000);
  */
  setPoint();
  size = random(40);
  if (debug) println("w: " + wpos + ", h: " + hpos + ", d: " + dpos);
}
void update() {
  pushMatrix();
  translate(width/2, height/2, 0);
  translate(wpos, hpos, dpos);
  sphereDetail(5);
  sphere(size);
  popMatrix();
}
void setPoint() {
  if (previous != null) {
    if (debug) println("ny");
    s = previous.s;
    t = previous.t;
  }
  if (previous == null) {
    s = 0;
    t = 0;
  }
     s = random(250);  
     t = random(250);   
     float radianS = radians(s);
     float radianT = radians(t);
     
     float thisx = 0 + (radius * cos(radianS) * sin(radianT));
     float thisy = 0 + (radius * sin(radianS) * sin(radianT));
     float thisz = 0 + (radius * cos(radianT));
     
     wpos += thisx; 
     hpos += thisy; 
     dpos += thisz;
}
void movePoint() {
  
}
void drawLine() {
  pushMatrix();
  translate(width/2, height/2, 0);
  strokeWeight(lineT);
  if (previous != null)
    line(previous.wpos, previous.hpos, previous.dpos, wpos, hpos, dpos);
  popMatrix();
}
}
