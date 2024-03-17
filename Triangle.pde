class Triangle
{
  public Point p1, p2, p3;
  color c;
  
  public Triangle(PVector p1, PVector p2, PVector p3)
  {
    this.p1 = new Point(p1);
    this.p2 = new Point(p2);
    this.p3 = new Point(p3);
  }
  
  public void update(PVector p1, PVector p2, PVector p3)
  {
    this.p1 = new Point(p1);
    this.p2 = new Point(p2);
    this.p3 = new Point(p3);
  }
  
  public boolean equals(Object obj)
  {
    Triangle tri = (Triangle)obj;
    return
    (
      (p1.equals(tri.p1) && p2.equals(tri.p2) && p3.equals(tri.p3)) ||
      (p1.equals(tri.p1) && p2.equals(tri.p3) && p3.equals(tri.p2)) ||
      (p1.equals(tri.p2) && p2.equals(tri.p1) && p3.equals(tri.p3)) ||
      (p1.equals(tri.p2) && p2.equals(tri.p3) && p3.equals(tri.p1)) ||
      (p1.equals(tri.p3) && p2.equals(tri.p1) && p3.equals(tri.p2)) ||
      (p1.equals(tri.p3) && p2.equals(tri.p2) && p3.equals(tri.p1))
    );
  }
  
  public int hashCode()
  {
    return 0;
  }
  
  public void draw()
  {
    triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
    fill(c);
  }
  
  public boolean hasCommonPoints(Triangle tri)
  {
    return p1.equals(tri.p1) || p1.equals(tri.p2) || p1.equals(tri.p3) ||
           p2.equals(tri.p1) || p2.equals(tri.p2) || p2.equals(tri.p3) ||
           p3.equals(tri.p1) || p3.equals(tri.p2) || p3.equals(tri.p3);
  }
  
  public Triangle setColor(color c)
  {
    this.c = c;
    return this;
  }
}
