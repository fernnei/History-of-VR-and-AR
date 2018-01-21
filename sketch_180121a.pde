PImage bg, stitch, start, begin, img1, img2, img3, img4, img5, img6;
boolean upP, downP, rightP, leftP;
float x=0, y=390, speed=3;
int state = 2, Estate;
final int Start=0, Run=1;
final int count = 2;
//stitch : 75 * 82

void setup() {
  size(1000, 500);

  //image
  bg = loadImage("bg.jpg");
  stitch = loadImage("stitch.png");
  start = loadImage("start.jpg");
  begin = loadImage("begin.png");
  img1 = loadImage("img1950.png");
  img2 = loadImage("img1968.png");
  img3 = loadImage("img1980.png");
  img4 = loadImage("img1991.png");
  img5 = loadImage("img1995.png");
  img6 = loadImage("img2010.png");

  //boolean
  upP = false;
  downP = false;
  rightP = false;
  leftP = false;

  //statement
  state=Start;
}

void draw() {
  //start
  switch(state) {
  case Start:
    fill(#98E4FF);
    noStroke();
    rect(0,0,width,height);
    imageMode(CENTER);
    image(start,width/2,height/2,start.width/5,start.height/5);
    
    if(mousePressed){
      state = Run;
    }
  
  break;

  case Run:
    imageMode(CORNER);
    image(bg, 0, 0);
    image(stitch, x, y, stitch.width/2, stitch.height/2);
    //move
    if (upP) {
      y-=speed;
    }
    if (downP) {
      y+=speed;
    }
    if (rightP) {
      x+=speed;
    }
    if (leftP) {
      x-=speed;
    }

    //restart
    if (x>=width+50) {
      x=0;
    }
    //constrain
    x=constrain(x, 0, width+60);
    y=constrain(y, 0, height-stitch.height/2);

    //detect
    if (x+65>0 && x<40 && y>350 && y+82<490) {
      image(begin, 0, 0);
    }
    //1950s
    if (x+65>120 && x<160 && y>350 && y+82<490) {
      image(img1, 0, 0);
    }

    //1960
    if (x+65>220 && x<260 && y>390 && y+82<510) {
      image(img2, 0, 0);
    }

    //1980
    if (x+65>290 && x<340 && y>280 && y+82<430) {
      image(img3, 0, 0);
    }

    //1991
    if (x+65>425 && x<490 && y>380 && y+82<510) {
      image(img4, 0, 0);
    }

    //1995
    if (x+65>500 && x<650 && y>250 && y+82<400) {
      image(img5, 0, 0);
    }

    //2010
    if (x+65>760 && x<width+10 && y>370 && y+82<480) {
      image(img6, 0, 0);
    }

  break;

    //println(mouseX);
    //println(mouseY);
  }
}

  void keyPressed() {
    if (key==CODED);
    switch(keyCode) {
    case UP:
      upP = true;
      break;
    case DOWN:
      downP = true;
      break;
    case RIGHT:
      rightP = true;
      break;
    case LEFT:
      leftP = true;
      break;
    }
  }

  void keyReleased() {
    if (key==CODED);
    switch(keyCode) {
    case UP:
      upP = false;
      break;
    case DOWN:
      downP = false;
      break;
    case RIGHT:
      rightP = false;
      break;
    case LEFT:
      leftP = false;
      break;
    }
    
    createOutput("file");
    
  }