import peasy.*;

int cols, rows;
int scl = 20;
int w = 600;
PeasyCam cam;
int h = 600;
Terrain terrain;
Water water;
int x = 0;

void setup() {
  size(1280,720, P3D);
  cam = new PeasyCam(this,w/2,h/1.6,100,700);
  //cam.setSuppressRollRotationMode();
  cam.setYawRotationMode();
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(700);
  cols = w / scl;
  rows = h/ scl;
  terrain = new Terrain(rows,cols);
  water = new Water(rows,cols);
  //frameRate(10);
  terrain.makeTerrain();
  
}


void draw() {
  pointLight(255,255,255,0+x,100,100);
  background(255);
  terrain.showTerrain();
  water.makeWater();
  water.showWater();
  if(x>1000)
    x=0;
  x++;
}
