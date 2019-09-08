import peasy.*;
import gifAnimation.GifMaker;

PeasyCam cam;
Block grassBlock;
/*
  0 = side
  1 = bottom
  2 = top
*/
PImage[] grassTextures;
GifMaker gifExport;

void setup(){
  size(1000,1000,P3D);
  //fullScreen(P3D);
  
  cam = new PeasyCam(this, 400);
  //camera(0, 0, 300.0, 0, 0, 0, 0.0, 1.0, 0.0);
  
  grassTextures = new PImage[3];
  grassTextures[0] = loadImage("side.jpg");
  grassTextures[1] = loadImage("bottom.jpg");
  grassTextures[2] = loadImage("top.jpg");
  grassBlock = new Block(0,0,0,100);
  
  
  gifExport = new GifMaker(this, "gifs/xyRotation.gif");
  gifExport.setRepeat(0);       
  gifExport.setTransparent(0,0,0); 
  gifExport.setQuality(20);
}

void draw(){
  background(0); 
  
  //fullRotateGif();
  //fullRotate();
  freeRoam();
  //rotateFree();
}

void fullRotateGif(){
  //do full rotation, 2*pi, so 6.28
  float rotateScalar = frameCount * .01;
  if(rotateScalar <= 6.28){
    rotateX(rotateScalar);
    rotateY(rotateScalar);
    grassBlock.show(grassTextures);
    
    gifExport.setDelay(0);
    gifExport.addFrame();
  }else{
    gifExport.finish();
  } 
}

void fullRotate(){
  //do full rotation, 2*pi, so 6.28
  float rotateScalar = frameCount * .01;
  if(rotateScalar <= 6.28){
    rotateX(rotateScalar);
    rotateY(rotateScalar);
  }
  
  grassBlock.show(grassTextures);
}

void rotateFree(){
  rotateX(frameCount * .01);
  rotateY(frameCount * .01);
  
  grassBlock.show(grassTextures);
}

void freeRoam(){
  grassBlock.show(grassTextures);
}
