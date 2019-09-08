
class Block{
  PVector pos;
  float len;
  
  Block(float x,float y,float z,float len){
    pos = new PVector(x,y,z);
    this.len = len;  
  }
  
  void show(PImage[] textures){
    stroke(0);
    strokeWeight(0);
    
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    float r = len/2;
    
    //front : z fixed
    beginShape(QUADS);
    texture(textures[0]);
    vertex(-r, r, r, 0, 512);
    vertex(r, r, r, 512, 512);
    vertex(r, -r, r, 512, 0);
    vertex(-r, -r, r, 0, 0);
    
    //right : x fixed
    vertex(r, r, r, 0, 512);
    vertex(r, r, -r, 512, 512);
    vertex(r, -r, -r, 512, 0);
    vertex(r, -r, r, 0, 0);
    
    //left : x fixed
    vertex(-r, r, r, 0, 512);
    vertex(-r, r, -r, 512, 512);
    vertex(-r, -r, -r, 512, 0);
    vertex(-r, -r, r, 0, 0);
    
    //back : z fixed
    vertex(-r, r, -r, 0, 512);
    vertex(r, r, -r, 512, 512);
    vertex(r, -r, -r, 512, 0);
    vertex(-r, -r, -r, 0, 0);
    endShape();
    
    //bottom : y fixed
    beginShape(QUADS);
    texture(textures[1]);
    vertex(-r, r, r, 0, 0);
    vertex(r, r, r, 512, 0);
    vertex(r, r, -r, 512, 512);
    vertex(-r, r, -r, 0, 512);
    endShape();
    
    //top : y fixed
    beginShape(QUADS);
    texture(textures[2]);
    vertex(-r, -r, r, 0, 512);
    vertex(r, -r, r, 512, 512);
    vertex(r, -r, -r, 512, 0);
    vertex(-r, -r, -r, 0, 0);
    endShape();
    
    popMatrix();
  }


}
