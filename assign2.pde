//You should implement your assign2 here.
PImage fighter;
PImage bg1;
PImage bg2;
PImage bg3;
PImage enemy;
PImage hp;
PImage treasure;
PImage start1,start2,end1,end2;
int treasurex;
int treasurey;
int redx;
int enemyx;
int enemyy;
int gameState;
final int TOTAL_LIFE =189;
int score;
int life;
float fighterx=640;
float fightery=240;
float speed=5;
float bg1x;
float bg2x;
float bg3x;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_WIN = 2;
final int GAME_OVER = 3;
void setup () {
  size(640, 480) ;
  fighter=loadImage("img/fighter.png");
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  bg3=loadImage("img/bg1.png");
  enemy=loadImage("img/enemy.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  enemyy=floor(random(20,400));
  treasurex=floor(random(0,640));
  treasurey=floor(random(0,640));
  fill(255,0,0);
  rect(13,0,192,20);
  gameState=GAME_START;
  life = TOTAL_LIFE;
};
void draw() {
 image(bg1,bg1x,0);
 image(bg2,bg2x,0);
 image(bg3,bg3x,0);
 bg2x=bg1x-640;
 bg3x=bg2x-640;
 bg1x=(bg1x+4) % 1280;
  image(enemy,enemyx,enemyy);
  fill(255,0,0);
  rect(13,0,50.8,20);
  image(hp,0,0);
  image(treasure,treasurex,treasurey);
  image(fighter,fighterx,fightery);
  enemyx=enemyx+2;
  enemyx %= 640;
  if (upPressed){
    fightery -= speed;
  }
  if (downPressed){
    fightery += speed;
  }
  if (leftPressed){
    fighterx -= speed;
  }
  if (rightPressed){
    fighterx += speed;
  }
  if (fighterx>480){
    fighterx=480;
  }
   if (fighterx<0){
    fighterx= 0;
  }
   if (fightery>640){
    fightery=640;
  }
   if (fightery<0){
    fightery=0;
  }
  switch(gameState){
    case GAME_START:image(start2,0,0);
  if(mouseX>210&&mouseX<480){if(mouseY>380&&mouseY<420){image(start1,1,1);if(mousePressed){gameState = GAME_RUN;}}}else{image(start2,0,0);}break;
    case GAME_RUN:
    case GAME_WIN:
    case GAME_OVER:image(end2,0,0);
    if(mouseX>203&&mouseX<435){if(mouseY>300&&mouseY<345){image(end1,1,1);if(mousePressed){gameState = GAME_START;}}}else{image(end2,0,0);}break;
  }
};
void keyPressed(){
if(key==CODED){
  switch (keyCode){
  case UP:
  upPressed =true;
  break;
  case DOWN:
  downPressed =true;
  break;
  case LEFT:
  leftPressed =true;
  break;
  case RIGHT:
  rightPressed =true;
  break;
  }
}
};
void keyReleased(){
  if(key==CODED){
  switch (keyCode){
  case UP:
  upPressed =false;
  break;
  case DOWN:
  downPressed =false;
  break;
  case LEFT:
  leftPressed =false;
  break;
  case RIGHT:
  rightPressed =false;
  break;
  }
}
};
