//to do
//add a siz PVector and use it to make the size of the ellipses
//change the speed to a vel pvector
//change the PVector array to a PVector array list

int numCircles = 10;

PVector[] pos = new PVector[numCircles];
ArrayList<PVector> pList = new ArrayList<PVector>();

PVector[] siz = new PVector[numCircles];
ArrayList<PVector> sList = new ArrayList<PVector>();

float speed = -6;

void setup(){
  fullScreen(); 
  noCursor();
  for(int i = 0;i < numCircles; i++){
  
    pos[i] = new PVector(width + 150 + i*300, height*0.8);
    siz[i] = new PVector(50+random(0, 150),50+random(0, 150));
    
    pList.add(new PVector(width + 150 + i*300, height*0.3));
    sList.add(new PVector(50+random(0, 150),50+random(0, 150)));
  }
}


void crossHairs(float x, float y){
    noFill();
    stroke(200,0,0);
    strokeWeight(5);
    ellipse(x,y, 50,50);
    ellipse(x,y, 5,5);
    strokeWeight(4);
    line(x, y-40, x, y-15);//line above
    line(x, y+40, x, y+15);//line below
    line(x-40,y, x-15, y);//line left
    line(x+40,y, x+15, y);//line right
}

void target(float x, float y,  float s){
  noStroke();
  //set the fill to black
  fill(0);
  //draw the largest ellipse
  ellipse (x, y, s, s);
  //set the fill to white
  fill(255);
  //draw the middle ellipse
  ellipse (x, y, s*0.7, s*0.7);
  //set the fill to red
  fill(255, 0,0);
  //the the bullseye
  ellipse (x, y, s*0.3, s*0.3);
}

void draw(){
  background(100);
   
  for(int i = 0; i < numCircles; i++){ 
    //PVector p = pos[i];
  //update
    pos[i].x += speed;
    pList.get(i).x += speed;

  //check

    if(pos[i].x < -siz[i].x/2){
      pos[i].x = width + siz[i].x/2;//radius of the ellipse
    }

    if(pList.get(i).x < -sList.get(i).x/2){
      pList.get(i).x = width + sList.get(i).x/2;//radius of the ellipse
    }

  //draw
    //ellipse(pos[i].x,pos[i].y, siz[i].x, siz[i].y);
    target(pList.get(i).x,pList.get(i).y, sList.get(i).x);
    
  }
  
  crossHairs(mouseX, mouseY);
}
