int mode;
int x;
int t;
final int GAME_START=1;
final int GAME_RUN=2;
final int GAME_LOSE=3;
int gameState;
float Fx;
float Fy;
float Ta;
float Tb;
float xEn;
float yEn;
float speedx;
float speedy;
int b;
int bl;
int Hx;
int Hy;
float speed;
int HbX;
int HbY;

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
  gameState=GAME_START;
  x = 0;
  t = -641;
  Fx = 550;
  Fy = 240;
  Ta = random(20,620);
  Tb = random(20,460);
  xEn = 20;
  yEn = random(40,440);
  HbX = 20;
  HbY = 20;
  bl = 69;
  speed = 1;
  speedx=floor(random(2,5));
  speedy=floor(random(-2,2));
  
}

void draw() {
  switch(gameState){
    case GAME_START:
  image(start1Img,0,0);
   if(mouseX>=200 && mouseX<=440 && mouseY>=380 && mouseY<=420){
   image(start2Img,0,0);
   if(mousePressed){
   gameState=GAME_RUN;
   }
  }
  break;
  
  case GAME_RUN:
  image(bg1Img,x,0);
  image(bg2Img,t,0);
  x += 2;
  t+=2;
  if(x>=640){
  x=-640; }
if(t>=640){
  t=-640;} 
  fill(255,0,0);
  rectMode(CORNERS);
  rect(30,20,bl,40);
  image(hpImg,HbX,HbY);
  image(enemyImg,xEn,yEn);
  image(treasureImg,Ta,Tb);
  image(fighterImg,Fx-20,Fy-20);
  if(Ta+40>=Fx && Fx+40>=Ta){
    if(Tb+40>=Fy && Fy+40>=Tb){
    Ta=floor(random(20,620));
    Tb=floor(random(20,200));
    bl+=19.5;
    }}

 if(xEn+40>=Fx && Fx+40>=xEn){
       if(yEn+40>=Fy && Fy+40>=yEn){
       speedx=floor(random(2,5));
       speedy=floor(random(-2,2));
       xEn=20;
       yEn=floor(random(40,440));
       bl-=39;
       }
    }
    if(xEn>680||xEn<-40||yEn<-40||yEn>480){
      
      speedx=floor(random(2,5));
      speedy=floor(random(-2,2));
      xEn=20;
      yEn=floor(random(40,440));
    }
  xEn += speedx;
  yEn += speedy;
  if(yEn>=Fy && xEn>=120){
    speedy =-2;
  }
  if(yEn<=Fy && xEn>=120){
    speedy =2;
  }
 if(bl>=225){
 bl=225;
 }
 if(bl<=30){
    gameState=GAME_LOSE;
  }
  break;
  
  case GAME_LOSE:
     image(end1Img,0,0);
     if(mouseX>=200 && mouseX<=440 && mouseY>=300 && mouseY<=360){
     image(end2Img,0,0);
     if(mousePressed){
     gameState=GAME_RUN;
     fill(225,0,0);
     bl=69;
     rectMode(CORNERS);
     rect(30,20,bl,40);
     Fx=610;
     Fy=220;
     xEn=20;
     yEn=floor(random(40,440));
     Ta=floor(random(20,620));
     Tb=floor(random(20,200));
   }
    }
    break;
   }
}
void keyPressed(){
 
  if (key== CODED){
    
    if (keyCode == UP && Fy > 1){
      Fy = Fy-10;
    }
    if (keyCode == DOWN && Fy < 430){
      Fy = Fy+10;
    }
    if (keyCode == LEFT && Fx > 1){
      Fx = Fx-10;
    }
    if (keyCode == RIGHT && Fx < 590){
      Fx = Fx+10;
    }
  }
}
