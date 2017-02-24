public class Terrain {
  PImage img = loadImage("terrain1.jpg");
  private float[][] terrain;
  private float yoff = 0;
  private int rows;
  private int cols;
  public Terrain(int rows,int cols){
    this.rows = rows;
    this.cols = cols;
  }
  
 public void makeTerrain(){
   terrain = new float[this.cols][this.rows];
   for (int y = 0; y < this.rows; y++) {
    float xoff = 0;
    for (int x = 0; x < this.cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 150);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
 }
 
 
 public void showTerrain(){
  //stroke(179, 89, 0);
  //fill(179, 89, 0);

  translate(600/2, 600/1.3,-10);
  rotateX(PI/2);
  translate(-600/2, -600/2);
  for (int y = 0; y < this.rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < this.cols; x++) {
      texture(img);
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
 }
}