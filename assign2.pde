//You should implement your assign2 here.

int mode;
int x;
int t;
float Fx;
float Fy;
float Ta;
float Tb;
float Taa;
float Tbb;
float xEn;
float yEn;
int b;
int bl;
float speed;

PImage start1Img; 
PImage start2Img;
PImage bg1Img;
PImage bg2Img;
PImage enemyImg;
PImage fighterImg;
PImage hpImg;
PImage treasureImg;
PImage end1Img;
PImage end2Img;



void setup () {
  size(640, 480) ;
  start1Img = loadImage("img/start1.png");
  start2Img = loadImage("img/start2.png");
  bg1Img = loadImage("img/bg1.png");
  bg2Img = loadImage("img/bg2.png");
  hpImg = loadImage("img/hp.png");
  fighterImg = loadImage("img/fighter.png");
  enemyImg = loadImage("img/enemy.png");
  treasureImg = loadImage("img/treasure.png");
  end1Img = loadImage("img/end1.png");
  end2Img = loadImage("img/end2.png");
  mode = 1;
  x = 0;
  t = -641;
  Fx = 550;
  Fy = 240;
  Ta = random(1,640);
  Tb = random(1,480);
  xEn = random(640);
  yEn = random(480);
  bl = 42;
  b = 21;
  speed = 1;
  
}

void draw() {

 if (mode == 1){
  image(start1Img,x,0);
  }
  if (mode == 2){
  image(start2Img,x,0);
  }
  if (mode == 3){
  image(bg1Img,x,0);
  x += 2;
  image(bg2Img,t,0);
  t+=2;
  image(fighterImg,Fx,Fy);    //fighter
  colorMode(RGB);
  stroke(255,0,0);//red
  fill(255,0,0);//red
  rect(10, 5, bl, 24);             //blood  
  image(hpImg,0,0);            //hp
  image(treasureImg,Ta,Tb);            //hp
  image(enemyImg,xEn,yEn);  
  xEn += speed;
  xEn %= 640;                  //enemy
  }
    if(x>=640){
    x=-640; }
    if(t>=640){
    t=-640;}              
                                 //background

 if (Fx >= xEn && Fx <= xEn+61 && Fy >= yEn && Fy <= yEn+61  ){
   bl = bl-(2*b);
   xEn =0;
 }
 else if(Fx+51 >= xEn && Fx+51 <= xEn+61 && Fy+51 >= yEn && Fy+51 <= yEn+61){
   bl = bl-(2*b);
 xEn =0;
 }
                               //enemy+fighter
 if (Fx >= Ta && Fx <= Ta+41 && Fy >= Tb && Fy <= Tb+41){
   bl = bl+21;
   xEn =0;
   Ta = floor(random(0,640-41)); 
   Tb = floor(random(0,480-41));
 } 
else if(Fx+51 >= Ta && Fx+51 <= Ta+41 && Fy+51 >= Tb && Fy+51 <= Tb+41){
   bl = bl+21;
  xEn =0;
  Ta = floor(random(0,640-41)); 
   Tb = floor(random(0,480-41));
 }
                              //treasure+fighter
  if (yEn < Fy){
   yEn += speed;
 }
 else if(yEn > Fy){
   yEn -= speed;
 }
 if (bl == 0){
   mode = 4;
 }
 if (mode == 4){
  image(end1Img,0,0);
  }
 if (mode == 5){
  image(end2Img,0,0);
  }
  
  
}
void keyPressed(){
  if (keyCode == ENTER & mode == 1){
      mode = 2;
    }
  if (key== CODED){
    
    if (keyCode == UP && Fy > 1){
      Fy = Fy-3;
    }
    if (keyCode == DOWN && Fy < 430){
      Fy = Fy+3;
    }
    if (keyCode == LEFT && Fx > 1){
      Fx = Fx-3;
    }
    if (keyCode == RIGHT && Fx < 590){
      Fx = Fx+3;
    }
  }
  if (keyCode == ENTER & mode == 4){
      mode = 5;
    }
}
void keyReleased(){
 if (keyCode == ENTER & mode == 2 ){
      mode = 3;
    }
 if (keyCode == ENTER & mode == 4 ){
      mode = 5;
    }
}
