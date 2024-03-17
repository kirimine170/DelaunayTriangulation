color colorPalette[] = new color[4];
int numOfTri = 20;
Triangle triangles[] = new Triangle[numOfTri];
Point points[] = new Point[numOfTri*3];

void setup()
{
  size(800, 800);
  background(255);
  noStroke();
  colorPalette[0] = color(#A368DD);
  colorPalette[1] = color(#FFFF00);
  colorPalette[2] = color(#EF0C77);
  colorPalette[3] = color(#1BF1C3);
  hint(ENABLE_DEPTH_SORT);
  //for(int i = 0; i < 2000; i++){
  //  float r = random(40);
  //  points[i] = new Point(random(800), random(800));
  //  points[i].setRadius(r).setColor(colorPalette[(int)random(4)]).largeDraw();
  //}
  
  for(int i = 0; i < numOfTri*3; i++)
  {
    points[i] = new Point(random(800), random(800)).setRadius(random(40)).setColor(colorPalette[(int)random(4)]);
  }
  for(int i = 0; i < numOfTri; i++)
  {
    triangles[i] = new Triangle(points[i*3], points[i*3+1], points[i*3+2]).setColor(colorPalette[(int)random(4)]);
  }
}

void draw()
{
  background(255);
  update();
  for(int i = 0; i < triangles.length; i++)
    triangles[i].draw();
  for(int i = 0; i < points.length; i++)
    points[i].largeDraw();
}

void update()
{
  for(int i = 0; i < triangles.length; i++)
    triangles[i].update(points[i*3], points[i*3+1], points[i*3+2]);
  for(int i = 0; i < points.length; i++)
    points[i].moveRandomly(10, new PVector(width/2, height/2), 0.5);
}
//int index = 0;
//void draw()
//{
//  background(255);
//  for(int i = 0; i < 5; i++)
//  {
//    points[index+i] = new Point(random(800), random(800)).setRadius(random(40)).setColor(colorPalette[(int)random(4)]);
//  }
//  for(int i = 0; i < 2000; i++)
//    points[i].largeDraw();
//  //set((int)random(800), (int)random(800), color(#A368DD));
//  //set((int)random(800), (int)random(800), color(#FFFF00));
//  if(index >= 1995) index = 0;
//  index += 5;
//}
