import java.lang.System;

void settings(){
  System.setProperty("jogl.disable.openglcore", "true");
   size(320, 240, P2D);
}


void setup() {
}

void draw() {
  background(153);
  line(0, 0, width, height);
}
