int sizex = 400;
int sizey = 200;
size(sizex, sizey);
background(255);

PImage img = loadImage("kubrick.jpg");
int imgW = img.width;
int imgH = img.height;

println("Height: " + imgH);
println("Width: " + imgW);

String str1="this is a test. Just a test, nothing more.";
int[] redarray = new int[3];
int[] bluearray = new int[3];
int[] greenarray = new int[3];
int imgY

for (imgY = 0; imgY < imgH; imgY=imgY++) {
  println(imgY);
}

// Load the font. Fonts are located within the 
// main Processing directory/folder and they
// must be placed within the data directory
// of your sketch for them to load
PFont fontA = loadFont("CourierNew36.vlw");
textFont(fontA, 36);
textAlign(CENTER);

// Set the gray value of the letters
fill(150);

// Set the left and top margin
// int margin = 5; // letters per line
int margin = sizex/35; // letters per line
int gap = 30;
translate(margin*1.5, margin*2);

int lenstr1 = str1.length();
char c1;
int count = 0;
int i = 0;
int j = 0;

for (count = 0 ; count < lenstr1 ; count++) {
  c1 = str1.charAt(count);
  println(c1);
  text(c1, 15+j*gap, 20+i*gap);
  if(j == margin) {
    j = 0;
    i++;
  } else {
    j++;
  }
}

