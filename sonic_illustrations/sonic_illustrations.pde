import processing.pdf.*;
import pitaru.sonia_v2_9.*;

int xpos = 5;
float a = 0.0;
float inc = PI/0.3;
float[] spectrum;
float x,y,px,py;

void setup() {
  size(500,400);
  spectrum = new float[1024];
  Sonia.start(this);
  LiveInput.start(1024);
  rectMode(CENTER);
  ellipseMode(CENTER);
  colorMode(RGB, 256);
  smooth();
  background(255);
}

void draw() {
  getSpectrum();
}

void getSpectrum() {
  noStroke();
  spectrum = LiveInput.getSpectrum();
  float v = LiveInput.getLevel() * 10;
  for ( int i = 0; i < spectrum.length/4; i++) {
    float r = (400.0/1000.0) * spectrum[i];
    float r1 = (400.0/1000.0) * spectrum[i+1];
    fill(i*5, xpos, 0, 150);
    float w = (10.0/400.0) * r;
    ellipse((width/2)+sin(a)*xpos, (height/2)+cos(a)*xpos,w,w);
PFont fontA = loadFont("CourierNew36.vlw");
textFont(fontA, 36);
textAlign(CENTER);
    String s1 = "Thequickbrownfoxjumpedoverthelazydog";
    for ( int i2 = 0; i2 < 35; i2++) {
      char s2 = s1.charAt(i2);
      text(s2, 15, 20, 70, 70);
      println(s2);
      delay(250);
      if (i2 == 35) {
        i2 = 0;
      }
    }
    inc = PI/r1;
    a += inc;
    xpos += r/100.0;
  }
  a = 0.0;
  xpos = 1;
}

void mousePressed() {
  background(255);
}

void keyPressed() {
  exit();
}

public void stop() {
    Sonia.stop();
    super.stop();
}
