class Dot {
float x, y, z;
int sphereRadius = 1800;
float lineThickness = 1.0;

float lineT = lineThickness;
int radius = sphereRadius;


float s = 0;
float t = 0;
float tx = random(10000);
float ty = random(10000);
float tz = random(10000);
float wspos, hspos, dspos;
boolean debug = false;
Dot previous;
Dot next;
float wpos, hpos, dpos;
float size;




Dot(Dot p) {
  previous = p;
  ///*
  wspos = random(-2000, 2000);
  hspos = random(-2000, 2000);
  dspos = random(-2000, 2000);
  //*/
  //setPoint();
  size = random(20);
  if (debug) println("w: " + wpos + ", h: " + hpos + ", d: " + dpos);
}




void update() {
  updatePoint();
  pushMatrix();
  translate(width/2, height/2, 0);
  translate(wpos, hpos, dpos);
  //sphereDetail(1);
  x = modelX(0, 0, 0);
  y = modelY(0, 0, 0);
  z = modelZ(0, 0, 0);

  //sphere(size);
  popMatrix();
}




void setPoint() {
  if (previous != null) {
    if (debug) println("ny");
    s = previous.s;
    t = previous.t;
  }
  if (previous == null) {
    s = random(360);
    t = random(360);
  }
     s += 1;
     t += 18;
     float radianS = radians(s);
     float radianT = radians(t);

     float thisx = 0 + (radius * cos(radianS) * sin(radianT));
     float thisy = 0 + (radius * sin(radianS) * sin(radianT));
     float thisz = 0 + (radius * cos(radianT));

     wspos += thisx;
     hspos += thisy;
     dspos += thisz;
}




void updatePoint() {
     s += 1;
     t += 18;

     float radianS = radians(s);
     float radianT = radians(t);

     float thisx = 0 + (radius * cos(radianS) * sin(radianT));
     float thisy = 0 + (radius * sin(radianS) * sin(radianT));
     float thisz = 0 + (radius * cos(radianT));

     /*wpos += thisx/1000;
     hpos += thisy/1000;
     dpos += thisz/1000;*/

     wpos = map(noise(tx), 0, 1, 0, 500) + wspos;
     hpos = map(noise(ty), 0, 1, 0, 500) + hspos;
     dpos = map(noise(tz), 0, 1, 0, 500) + dspos;
     tx += 0.01;
     ty += 0.01;
     tz += 0.01;
}




void drawPoint() {
  pushMatrix();
  translate(x,y,z);
  ellipse(0,0,size,size);
  //box(20);
  popMatrix();
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
