class Ball{
  PVector center;
  PVector velocity;
  PVector nextAcceleration;
  float r;
  float elasticity = 1.0;
  BoundingBox boundingBox;
  
  Ball(final PVector c, final PVector v, final float r0){
    this.center = c;
    this.r = r0;
    this.velocity = v;
    this.nextAcceleration = new PVector(0,0);
  }
  
  void setBounceFactor(final float e){
    this.elasticity = e;
  }

  void setBoundingBox(final BoundingBox bb){
    this.boundingBox = bb;
  }

  void applyForce(final PVector a){
    this.nextAcceleration = a;
    //this.velocity.add(a);
  }

  void bounce(){
    if((this.center.x - this.r < this.boundingBox.ulx) && this.velocity.x < 0){
      this.velocity.x *= -elasticity;
      this.center.x = this.boundingBox.ulx + this.r;
    }
    if((this.center.x + this.r > this.boundingBox.lrx) && this.velocity.x > 0){
      this.velocity.x *= -elasticity;
      this.center.x = this.boundingBox.lrx - this.r;
    }
    if((this.center.y - this.r < this.boundingBox.uly) && this.velocity.y < 0){
      this.velocity.y *= -elasticity;
      this.center.y = this.boundingBox.uly + this.r;
    }
    if((this.center.y + this.r > this.boundingBox.lry) && this.velocity.y > 0){
      this.velocity.y *= -elasticity;
      this.center.y = this.boundingBox.lry - this.r;
    }
  }

  void update(){
    this.velocity.add(this.nextAcceleration);
    this.center.add(this.velocity);
    this.nextAcceleration = new PVector(0,0);
  }

  void display(){
    ellipseMode(RADIUS);
    circle(this.center.x,this.center.y,this.r);
  }
}
