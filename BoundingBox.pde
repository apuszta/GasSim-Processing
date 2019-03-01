class BoundingBox{
 float lrx,lry;
 float ulx,uly;
 
 BoundingBox(float ulx, float uly, float lrx, float lry){
   this.lrx = lrx;
   this.lry = lry;
   this.ulx = ulx;
   this.uly = uly;
 }
 
  void display(){
    noFill();
    stroke(0);
    rect(this.ulx, this.uly, this.lrx-this.ulx, this.lry-this.uly);
  }
}
