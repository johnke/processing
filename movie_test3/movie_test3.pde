 	

import processing.video.*;
import processing.pdf.*;
Movie myMovie;

int x = 0;
int y = 0;

float advanceLength=1;

int counter=0;

int widthPage=960;
int widthOut=32;
int heightOut=16;
void setup() {
  myMovie = new Movie(this, "RASHOMON.mp4");
  myMovie.speed(0);
  int totalSeconds = int(myMovie.duration());
  float framesPerLine = (widthPage / widthOut)+0.5;
  int linesPerPage = totalSeconds / int(framesPerLine);
  int heightPage = (linesPerPage - 1) * (heightOut+4);
  size(widthPage, heightPage);
  myMovie.play();
}

void draw() {
  int curTime = int(myMovie.time());
  int runTime = int(myMovie.duration());
  println(curTime + " / " + runTime);
  if(myMovie.available()) {
    myMovie.read();
    myMovie.jump((myMovie.time() + advanceLength) % myMovie.duration()); 
  }
  if (x==widthPage) {
    x=0;
    y=y+heightOut+4;
  } else {
    if (curTime==runTime-1) {
      save("rashomon.tif");
      exit();
    }
    image(myMovie, x, y+2, widthOut, heightOut);
    int redTmp=0;
    int greenTmp=0;
    int blueTmp=0;
    for ( int i = 0; i < widthOut;i++) {
      for ( int j = 2; j < heightOut-2;j++) {
        redTmp =redTmp+int(red(get(i+x, j+y)));
        blueTmp=blueTmp+int(blue(get(i+x, j+y)));
        greenTmp=greenTmp+int(green(get(i+x, j+y)));
      }
    }
    noStroke();
    color c = color(redTmp/widthOut/(heightOut-4), greenTmp/widthOut/(heightOut-4), blueTmp/widthOut/(heightOut-4));
    fill(c);
    float bright = brightness(c);
    float heightdiv;
    heightdiv=255/bright;
    fill(0);
    rect (x, y+2, widthOut, heightOut+4);
    float totalHeight = heightOut/heightdiv;
    image(myMovie, x, (y+2)+(((heightOut*1.5)/2)-(totalHeight/2)), widthOut, totalHeight); 
    x=x+widthOut;
  }
}
