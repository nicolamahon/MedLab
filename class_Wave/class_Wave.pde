void setup() 
{
  size(640, 360);
  wave1 = new Wave(245);
}

Wave wave1;

void draw()
{
  wave1.render();
}