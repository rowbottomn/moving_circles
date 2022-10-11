//to do
//add a siz PVector and use it to make the size of the ellipses
//



int numCircles = 10;

PVector[] pos = new PVector[numCircles];

float speed = -6;

void setup(){
  fullScreen(); 
  
  for(int i = 0;i < numCircles; i++){

    pos[i] = new PVector(width + 150 + i*300, height*0.8);
  }
}


void draw(){
  background(0);
  //for(PVector p : pos){
  for(int i = 0;i < numCircles; i++){ 
    PVector p = pos[i];
  //update

    p.x += speed;
  //check

    if(p.x < -150){
      p.x = width + 150;
    }
  //draw

    ellipse(p.x,p.y, 100, 100);
  }
}
