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
  
  public void moveRandomly(float maxDistance)
  {
    float angle = random(TWO_PI); // 全方向にランダムに動かす
    float distance = random(maxDistance); // 最大距離内でランダムな距離
    this.x += cos(angle) * distance;
    this.y += sin(angle) * distance;
  }
  
  public void moveRandomly(float maxDistance, PVector centre, float biasStrength)
  {
    float angle = random(TWO_PI);
    float distance = random(maxDistance);
    
    PVector bias = new PVector(x - centre.x, y - centre.y);
    bias.normalize();
    bias.mult(-1);
    float edgeDistance = min(min(x, width-x), min(y, height-y));
    float biasFactor = map(edgeDistance, 0, width/4, biasStrength, 0);
    bias.mult(biasFactor);
    
    PVector move = new PVector(cos(angle) * distance, sin(angle) * distance);
    move.add(bias);
    
    this.x += move.x;
    this.y += move.y;
  }

}
