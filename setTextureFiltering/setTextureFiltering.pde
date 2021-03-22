import java.lang.System;

void settings(){
  System.setProperty("jogl.disable.openglcore", "true"); // Workaround para Ubuntu 20.04. En otros OS esta linea no deberia ser necesaria.
  size(500, 500, P2D);
}


void setup() {
  ((PGraphicsOpenGL) g).textureSampling(2); // NEAREST
}

void draw() {
  background(153);
  fill(255);
  ellipse(80, 80, 100, 100);
  scale(4.0);
  ellipse(70, 70, 100, 100);

}
