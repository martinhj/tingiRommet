class Dot {
boolean debug = false;
Dot previous;
Dot next;
float wpos, hpos, dpos;
Dot() {
  wpos = random(-1000, 1000);
  hpos = random(-1000, 1000);
  dpos = random(-1000, 1000);
  if (debug) println("w: " + wpos + ", h: " + hpos + ", d: " + dpos);
}
void update() {
  pushMatrix();
  translate(width/2, height/2, 30);
  translate(wpos, hpos, dpos);
  smooth(8);
  sphereDetail(20);
  sphere(15);
  popMatrix();
}
void drawLine() {
  pushMatrix();
  translate(width/2, height/2, 30);
  strokeWeight(0.4);
  smooth(8);
  
  // mulig rect er penere enn line. sjekk:
  // http://forum.processing.org/one/topic/why-does-rect-look-better-than-line.html
  // rect, rectMode
  // no sånt, med noStroke:
  // rect(0, 0, dist(x0, y0, x1, y1), 1);
  if (previous != null)
    line(previous.wpos, previous.hpos, previous.dpos, wpos, hpos, dpos);
  popMatrix();
}
// Denne funker bare i 2d, kan dette gjøres med box? (w, h, d)
/*
void sline(float x0, float y0, float x1, float y1) {
  noStroke();
  pushMatrix();
  translate(x0+0.5, y0+0.5);
  rotate(atan2(y1-y0, x1-x0));
  rect(-0.5, -0.5, dist(x0, y0, x1, y1)+1, 1);
  popMatrix();
  // for å få til det samme med box må en regne ut hvor mange grader
  //                                    og translate for å stå i det ene punktet.
  //                                    ^^
  // x, y, z er ut fra 0, 0, 0 og bruke rotateX/Y/Z med dette og så tegne
  // en box fra translate til første punkt med w = lengden mellom disse
  // og h = 1, d = 1 - noStroke();
  // pakkes inn i en metode sline(x1, y1, z1, x2, y2, z2)
  // kanskje atan2() kan brukes til å renge ut vinkelen til denne? (problem hvis den tar utgangspunkt i x=0 på x-aksen?
}
*/
}
