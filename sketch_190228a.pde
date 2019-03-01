BoundingBox box;
ArrayList<Ball> balls = new ArrayList<Ball>();

void setup(){
  size(500,500);
  fill(120);
  stroke(120);

  box = new BoundingBox(50,50,width-50,height-50);
}

void mouseReleased(){
   Ball ball = new Ball(new PVector(mouseX,mouseY),new PVector(random(-2,2),random(-2,2)),10);
   ball.setBounceFactor(0.95);
   ball.setBoundingBox(box);
   balls.add(ball);
}

void draw(){
  background(255);

  for(Ball ball : balls){
    ball.bounce();
    ball.applyForce(new PVector(0,0.1));
    ball.update();
    ball.display();
  }
  box.display();
}
