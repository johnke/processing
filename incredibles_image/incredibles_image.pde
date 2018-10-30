/**
 * Displaying. 
 * 
 * Images can be displayed to the screen at their actual size
 * or any other size. 
 * 
 * Created 2 November 2002
 */ 
size(960, 1308);
PImage a;  // Declare variable "a" of type PImage
a = loadImage("matrix3.png"); // Load the images into the program
image(a, 0, 0); // Displays the image from point (0,0)
colorMode(RGB);

// Size of each cell in the grid
int cellsize = 10;
// Number of columns and rows in our system
int cols=40;
int rows=100;
// Variable for capture device
int x = 0;
int y = 0;
int widthPage=960;
int heightPage=1308;
//int heightPage=24;
int widthOut=16;
int heightOut=12;



  // Begin loop for columns
for (y = 0; y < heightPage; y=y+heightOut) {
  println(y);
  for ( x = 0; x < widthPage; x=x+widthOut) {
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
    fill(0);
    rect (x, y+2, widthOut, heightOut-4);
    fill(c);
    float bright = brightness(c);
    println(bright);
    float heightdiv;
    heightdiv=255/bright;
    rect (x, y+2, widthOut, (heightOut-4)/heightdiv);
  }
}

save("matrix4.tif");


