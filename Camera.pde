




float radiusCamera ; 
PVector centerScene;
// float altCamFactor ;

void cameraP3Dsetup()
{
  // give the start distance between the camera and the scene
  if ( width > height ) radiusCamera = width *3 ; else radiusCamera = height *3 ;
  //give the starting position of the scene in the display
  centerScene = new PVector (width/2.0, height/2.0, 0) ;
  //camera direction
 
  //eye setup solution 1
  eyeSetup() ;
}

// mouse wheel event
float wheel ;
float checkTheWheel ;
int countWheelAction ;
void mouseWheel(MouseEvent event) {
  countWheelAction += 1 ;
  checkTheWheel = wheel ;
  wheel = event.getCount();
}
 
//ALGORITHM
//Step 0 :
//global

PVector startPos, posV, posH, posBisector ;
 
void eyeSetup() {
  posV  = new PVector (0,0,0) ;
  posH = new PVector (0,0,0) ;
  posBisector = new PVector (0,0,0) ;
  startPos = new PVector(width/2, height/2, 0 ) ;
}
 
PVector eye(PVector pos, float sizeField) 
{
  PVector posFinal = new PVector(0,0,0) ;
 
    //STEP 1
  //sphere witness vertical
  posV.x = 0 ; 
  posV.y = AxisRotationPos(pos.y, height, sizeField *.5).y ;
  posV.z = AxisRotationPos(pos.y, height, sizeField *.5).z ;
 
  //sphere witness horizontal;
  posH.x = AxisRotationPos(pos.x, width, sizeField *.5).x ; 
  posH.y = 0 ;
  posH.z = AxisRotationPos(pos.x, width, sizeField *.5).z  ;
 
  //STEP 2
  //bisector witness sphere
  posBisector.x = bisector(posH,posV).x ;
  posBisector.y = bisector(posH,posV).y ;
  posBisector.z = bisector(posH,posV).z ;
 
  //STEP 3
  //point final bisector projection
  posFinal = bisectorProjection(bisector(posH,posV), sizeField *.5 ) ;
 
  return posFinal ;
}
//Step 1 : translate the mouse position x and y  on the sphere, we must do that separately
float rotationPlan ;


PVector AxisRotationPos(float posMouse, int dist, float distanceToFocus)
{
  PVector pos = new PVector (0,0,0) ;
  rotationPlan = map(posMouse, 0, dist, 0, TAU)  ;
  PVector marge = new PVector((width -distanceToFocus *2.0) *.5,(height -distanceToFocus *2.0) *.5) ;
  float dataPosXY = cos(rotationPlan) *distanceToFocus ;
  float dataPosZ =  sin(rotationPlan) *distanceToFocus ;
  pos = new PVector ( dataPosXY, dataPosXY, dataPosZ ) ;
  return pos ;
}

//STEP 2 : caculate the bisetor of the horizontal and verticale sphere
PVector bisector(PVector p1, PVector p2) 
{
  PVector b ;
  b = PVector.add(p1, p2);
  b.div(2) ;
  return b ;
}

//STEP 3 : calculte the position of bisector point projection on the sphere, we supose the center of the sphere is 0,0,0
PVector bisectorProjection(PVector bisector, float radius )
{
  PVector bisectorProjection = new PVector (0,0) ;
  PVector center = new PVector (0,0) ;
  float distanceBetweenCenterAndBisector = bisector.dist(center) ;
  float rapport = radius /distanceBetweenCenterAndBisector ;
  bisector.mult(rapport) ;
  bisectorProjection = bisector ;
  return bisectorProjection ;
}
 
void cameraP3Ddraw(PVector eye, PVector posScene, PVector dir ) {
  camera(eye.x,                      eye.y,                     eye.z, 
         centerScene.x +posScene.x , centerScene.y +posScene.y, centerScene.z +posScene.z, 
         dir.x,                      dir.y,                     dir.z);
}
