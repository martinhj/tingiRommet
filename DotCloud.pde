class DotCloud {
  Dot firstDot;
  int l;
  DotCloud(int dotNum) {
    l = dotNum;
    firstDot = new Dot(null);
    currentDot = firstDot;
    for (int i = 0; i < dotNum; i++) {
      currentDot.next = new Dot(currentDot);
      currentDot = currentDot.next;
    }
  }
  void update(){
    currentDot = firstDot;
    for (int i = 0; i < l; i++) {
      currentDot.update();
      currentDot.drawLine();
      currentDot = currentDot.next;
  }
    currentDot.update();
    currentDot.drawLine();
  }
}
