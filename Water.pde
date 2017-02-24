public class Water {
  private int rows;
  private int cols;
  private float[][] water;
  private float flying = 0;

 public Water(int rows, int cols){
   this.rows = rows;
   this.cols = cols;
 }
 
 public void makeWater(){
   this.flying -= 0.01;
   float yoff = flying;
   water = new float[this.cols][this.rows];
   for (int y = 0; y < this.rows; y++) {
    float xoff = flying;
    for (int x = 0; x < this.cols; x++) {
      water[x][y] = map(noise(xoff, yoff), 0, 1, -10, 10);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
 }
 
 
 public void showWater(){
  
  noStroke();
  fill(0, 255, 255);

  translate(0, 0,-15);
  for (int y = 0; y < this.rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < this.cols; x++) {
      vertex(x*scl, y*scl, water[x][y]);
      vertex(x*scl, (y+1)*scl, water[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
 }
}