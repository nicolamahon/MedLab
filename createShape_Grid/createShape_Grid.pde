void setup()
{
  size(1200, 600);
}

PShape shape1;
PShape shape2;

void draw()
{
 create(); 
 shape(shape1, 0, 0);
 shape(shape2, 0, 0);
 
 
 render1();
 
}

void create()
{
  shape1 = createShape();
  shape1.beginShape();
  shape1.stroke(255);
  shape1.noFill();
  shape1.strokeWeight(2);
  shape1.vertex(width/3, 0);
  shape1.vertex(width/3, height/6);
  shape1.vertex(width/3, height/6);
  shape1.vertex(width/4, height/3);
  shape1.vertex(width/4, height/3);
  shape1.vertex(0, height/3);
  shape1.endShape();
  
  shape2 = createShape();
  shape2.beginShape();
  shape2.stroke(255);
  shape2.noFill();
  shape2.strokeWeight(2);
  shape2.vertex(0, height-height/3);
  shape2.vertex(width/4, height-height/3);
  shape2.vertex(width/4, height-height/3);
  shape2.vertex(width/3, height-height/6);
  shape2.vertex(width/3, height-height/6);
  shape2.vertex(width/3, height);
  shape2.endShape();
  
  
} 

void render1()
{
  pushMatrix();
  translate(width, height);
  rotate(PI);
  shape(shape1, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(width, 0);
  rotate(PI);
  shape(shape2, 0, height);
  popMatrix();
   
} 