 	

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
  myMovie = new Movie(this, "FIGHT_CLUB_def_ed.mp4");
  myMovie.speed(0);
  int totalSeconds = int(myMovie.duration());
  float framesPerLine = (widthPage / widthOut)+0.5;
  int linesPerPage = totalSeconds / int(framesPerLine);
  int heightPage = (linesPerPage - 1) * (heightOut+4);
  println(heightPage);
  size(widthPage, heightPage);
  myMovie.play();
}

void draw() {
  int curTime = int(myMovie.time());
  int runTime = int(myMovie.duration());
//  println(counter);
//  println(runtime);
  if(myMovie.available()) {
    myMovie.read();
    println(curTime);
    println(runTime);
    myMovie.jump((myMovie.time() + advanceLength) % myMovie.duration()); 
  }
  if (x==widthPage) {
    x=0;
    y=y+heightOut+4;
  } else {
    if (curTime==runTime-1) {
      save("FIGHT_CLUB_def_ed.tiff");
      exit();
    }
    fill(#000000);
    rect(x, y, widthOut, heightOut+4);
    image(myMovie, x, y+2, widthOut, heightOut); 
    x=x+widthOut;
  }
}
