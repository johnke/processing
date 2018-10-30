 	

import processing.video.*;
import processing.pdf.*;
Movie myMovie;

int x = 0;
int y = 0;


int counter=0;

int widthPage=640;
int widthOut=16;
int heightOut=8;
void setup() {
  //  size(640, 5800, PDF, "jaws.pdf");
  frameRate(12);
  myMovie = new Movie(this, "incredibles.mp4");
  myMovie.frameRate(12);  
  myMovie.speed(12.0);
  int totalSeconds = int(myMovie.duration());
  int framesPerLine=widthPage/widthOut;
  int linesPerPage=totalSeconds/framesPerLine;
  int heightPage=int(linesPerPage*heightOut)+60;
  println(heightPage);
  size(640, 3000);
  myMovie.play();
}

void draw() {
  int runtime=int(myMovie.duration());
  if(myMovie.available()) {
    myMovie.read();
  }
  if (x==widthPage) {
    x=0;
    y=y+heightOut;
  } else {
    if (counter==runtime+10) {
      save("incredibles.tif");
      exit();
    }    image(myMovie, x, y, widthOut, heightOut);
    x=x+widthOut;
    counter++;
  }
}

void mousePressed() {
    save("incredibles.tif");
  myMovie.stop();
  exit();

}
