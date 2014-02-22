Dot firstDot;
Dot secondDot;
Dot currentDot;
DotCloud oneCloud;
float zoomF = 0.3f;
boolean debug = false;
int antiAlias = 8;
int antia = antiAlias;

void setup() {
  smooth(antia);
  frameRate(120);
  // Camera code moved to the Camera class.
  //cameraP3Dsetup() ;
  
  
  //size(1440, 1440, OPENGL);
  //size(1440, 900, OPENGL);
  size(2560, 1440, OPENGL);
  noCursor();
  background(255);
  stroke(43, 63, 79);
  pushMatrix();
  //translate(width/2, height/2, -50);
  fill(43, 63, 79);
  popMatrix();
  //translate(width/2, height/2, 30);
  secondDot = new Dot(null);
  oneCloud = new DotCloud(25);
  currentDot = secondDot;
  for (int i = 0; i < 10; i++) {
    currentDot.next = new Dot(currentDot);
    currentDot.next.previous = currentDot;
    currentDot = currentDot.next;
  }

}

void draw() {
  background(255);
  
  translate(width/2, height/2, 0);  
  rotateY(frameCount * 0.003);
  //rotateX(frameCount * 0.003);
  rotateZ(frameCount * 0.003);
  scale(zoomF);
  
  //camera(mouseX, 30.0, (height/2) / tan(PI/6),// 220.0 // eyeX, eyeY, eyeZ
  //       width / 2, height / 2, mouseY, // centerX, centerY, centerZ
  //       0.0, 1.0, 0.0); // upX, upY, upZ
         //0.0, 1.0, mouseY - (height / 2)); // upX, upY, upZ
         // 0.0, 0.0, 0.0, // centerX, centerY, centerZ
  //camera(30.0, mouseY, (height/2) / tan(PI/6),// 220.0 // eyeX, eyeY, eyeZ
  //camera(width/2 + mouseX+mouseY, height / 2 + mouseY+mouseX, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);
  //camera(mouseX * 2 - width / 2, height / 2 - mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  if (debug) println(mouseX + " : " + (mouseY - (height / 2)));
  
  
  oneCloud.update();
  
  currentDot = secondDot;
  for (int i = 0; i < 10; i++) {
    currentDot.update();
    currentDot.drawLine();
    currentDot = currentDot.next;
  }
  currentDot.update();
  currentDot.drawLine();
  
  
  /* Methods moved to the camera Class, this stuff needs a update.
  PVector mousePos = new PVector (mouseX, mouseY, wheel) ;
  PVector absolutePos = new PVector ( mousePos.x -width/2, mousePos.y -height/2, mousePos.y) ;
 
  //zoom
  //wheel = 0 ;
 
  //eye camera position
  PVector posEye = new PVector (eye(mousePos, radiusCamera).x, eye(mousePos, radiusCamera).y, eye(mousePos, radiusCamera).z ) ;
 
 
  // the position of the scene is by default (width /2, height /2, 0 ) ; 
  // so if you wan move to the left, you must minus x, and go to the right add sommesthing to the "x", 
  // same idea for the top and the bottom, and the depth
  PVector scene = new PVector (0,0,0) ;
  // the direction of the cam is between (-1 to 1 )
  PVector dirCam = new PVector (0.0, 1.0, 0.0) ;
  cameraP3Ddraw(posEye, scene, dirCam);
  */
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
 

