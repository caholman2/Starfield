Particle[] e = new Particle[100];

void setup()
{
  size(800,800);
  for(int i=0; i<e.length; i++){
    e[i] = new Particle();
  }
  e[0] = new OddballParticle();
}

void draw()
{
  fill(0);
  rect(0,0,800,800);
  
  for(int i=0; i<e.length; i++){
    e[i].show();
    e[i].move();
  }
}

void mousePressed()
{
  for(int i=1; i<e.length; i++){
    e[i] = new Particle();
  }
}

class Particle
{
  int myR, myG, myB;
  double myX, myY, mySpeed, myAngle;
  
  Particle(){
    myX = myY = 400;
    mySpeed = Math.random()*7.5+0.5;
    myAngle = Math.random()*2*Math.PI;
    myR = (int)(Math.random()*206+100);
    myG = (int)(Math.random()*156+100);
    myB = (int)(Math.random()*156+100);
  }
  
  void move(){
      myX += (Math.cos(myAngle)*mySpeed);
      myY += (Math.sin(myAngle)*mySpeed);
  }
  
  void show(){
    fill(myR, myG, myB);
    beginShape();
    vertex((float)myX, (float)myY-7);
    vertex((float)myX-8, (float)myY-12);
    vertex((float)myX-17, (float)myY-9);
    vertex((float)myX-20, (float)myY);
    vertex((float)myX-16, (float)myY+6);
    vertex((float)myX, (float)myY+20);
    vertex((float)myX+16, (float)myY+6);
    vertex((float)myX+20, (float)myY);
    vertex((float)myX+17, (float)myY-9);
    vertex((float)myX+8, (float)myY-12);
    endShape(CLOSE);
  }
}

class OddballParticle extends Particle
{
  OddballParticle(){
    myX = myY = 400;
    mySpeed = Math.random()*7.5+0.5;
    myAngle = Math.random()*2*Math.PI;
    myR = 256;
    myG = 256;
    myB = 0;
  }
  
  void move(){
    myX += (int)(Math.random()*7)-3;
    myY += (int)(Math.random()*7)-3;
  }
  void show(){
    fill(myR, myG, myB);
    beginShape();
    vertex((float)myX, (float)myY-60);
    vertex((float)myX-21, (float)myY-21);
    vertex((float)myX-60, (float)myY);
    vertex((float)myX-21, (float)myY+21);
    vertex((float)myX, (float)myY+60);
    vertex((float)myX+21, (float)myY+21);
    vertex((float)myX+60, (float)myY);
    vertex((float)myX+21, (float)myY-21);
    endShape(CLOSE);
  }
}
