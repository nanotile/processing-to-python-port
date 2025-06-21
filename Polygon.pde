/*
the class inherit all the fields, constructors and functions 
of the java.awt.Polygon class, including contains(), xpoint,ypoint,npoint
*/
class Poly extends java.awt.Polygon{
  public Poly(int[] x,int[] y, int n){
    //call the java.awt.Polygon constructor
    super(x,y,n);
  }
  void drawMe(){
    beginShape();
    for(int i=0;i<npoints;i++){
      vertex(xpoints[i],ypoints[i]);
    }
    endShape();
  }
}