
//by Max Gacek 14.07.2017

//controls
//   WSAD
//   Q and E

int cols, rows;
int scl = 20;

int w = 1600;
int h = 1200;

float[][] terrain;   

void setup(){
   size(600, 600, P3D); 
   
   
   cols = w / scl;
   rows = h / scl;
   
   terrain = new float[cols][rows];
   
    
   
}
float flyingY, flyingX;

float camH = 100;

float flySpeed = 0.1;
void draw(){
   
   if (keyPressed) {
      if (key == 'w' || key == 'W') {
        flyingY -= flySpeed;
      }
      
      if (key == 's' || key == 'S') {
        flyingY += flySpeed;
      }
      
      if (key == 'a' || key == 'A') {
        flyingX -= flySpeed;
      }
      
      if (key == 'd' || key == 'D') {
        flyingX += flySpeed;
      }
      
      if (key == 'q' || key == 'Q') {
        camH += flySpeed*5;
      }
      
      if (key == 'e' || key == 'E') {
        camH -= flySpeed*5;
      }
    }
  
  
  float yoff = flyingY;
    for (int y = 0; y < rows; y++){
        float xoff = flyingX;
        for (int x = 0; x < cols; x++){
          
          terrain[x][y] = map(noise(xoff,yoff), 0, 1, -100, 100);
          xoff += 0.2;
     }
     yoff += 0.2;
    }
  
  
  
  
  background(0);
   stroke(255);
   noFill();
   
   translate(width/2, height/2+camH);
   rotateX(PI/3);
   
   
   translate(-w/2, -h/2);
   for (int y = 0; y < rows-1; y++){
     beginShape(TRIANGLE_STRIP);
     for (int x = 0; x < cols; x++){
        vertex(x*scl, y*scl, terrain[x][y]);
        vertex(x*scl, (y+1)*scl, terrain[x][y+1]);    
     }
     endShape();
   }
   
   // INFO HUD
      textSize(52);
      fill(150, 150, 150);    
      text("FPS: " + ceil(frameRate), width-50, 30); 
}