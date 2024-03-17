class Point extends PVector
{
  public float radius = 10;
  public color c = color(0);
  public Point()
  {
    super();
  }
  public Point(float x, float y)
  {
    super(x, y);
  }
  public Point(float x, float y , float z)
  {
    super(x, y, z);
  }
  public Point(PVector v)
  {
    this.x = v.x;
    this.y = v.y;
    this.z = v.z;
  }
  
  public boolean equals(Object obj)
  {
    PVector point = (PVector) obj;
    return (this.x == point.x && this.y == point.y && this.z == point.z);
  }
  public boolean nearPoint(Object point, float error)
  {
    try
    {
      PVector p = (PVector) point;
      return (abs(this.x - p.x) < error && abs(this.y - p.y) < error && abs(this.z - p.z) < error);
    }
    catch(Exception e)
    {
      e.printStackTrace();
      return false;
    }
  } 
  public void draw()
  {
    set(this.x, this.y);
  }
  
  public void colorDraw(color c)
  {
    set(this.x, this.y, c);
  }
  
  public void largeDraw()
  {
    ellipse(this.x, this.y, this.radius, this.radius);
    fill(this.c);
  }
  
  public Point setRadius(float radius)
  {
    this.radius = radius;
    return this;
  }
  
  public Point setColor(color c)
  {
    this.c = c;
    return this;
  }
  

}
