import processing.sound.*;

AudioIn input;
Amplitude rms;

int scale=1;
PImage game;
PImage pollo;
PImage pig;
PImage rubix;
float ang=0;
float angu=30;
float angul=0;
int centrox, centroy;

void setup() {
    size(2000,700);
    
    
     
    game = loadImage("game.png");
    pollo = loadImage("pollo1.png");
    pig = loadImage("pig.png");
    rubix = loadImage("rubix.png");
        
    input = new AudioIn(this, 0);
    
    input.start();
    
    rms = new Amplitude(this);
    
    rms.input(input);
    background(0);
    
    centrox= width/2;
   centroy = height/2;
}      


void draw() {
    //background (0);
    
    input.amp(map(mouseY, 0, height, 0.0, 1.0));
    
    
    scale=int(map(rms.analyze(), 0, .5, 1, 100));
    noStroke();
    
    
   
   ang=(ang+0.005);
   translate(centrox,centroy);
   rotate(PI*ang);
   
   
   image (game,0,0,100*scale, 100*scale);
   
  angu=(angu+0.015)%2;
   rotate(PI*angu);
   
   image (pig, 30+angu,30+angu,100*scale, 100*scale);
   
   
   image (pollo,angul,50,80*scale, 80*scale);
   image (rubix,ang+200,0,100*scale,100*scale);
}