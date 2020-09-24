//Vector Library [2D]
//CSCI 5611 Vector 3 Library [Incomplete]

//Instructions: Add 3D versions of all of the 2D vector functions
//              Vec3 must also support the cross product.
public class Vec3 {
  public float x, y, z;
  
  public Vec3(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public String toString(){
    return "(" + x + ", " + y + ", " + z + ")";
  }
  
  public float length(){
    return sqrt(x*x + y*y + z*z);
  }
  
  public float lengthSqr(){
    return (x*x + y*y + z*z);
  }
  
  public Vec3 plus(Vec3 rhs){
    return new Vec3((x + rhs.x), (y + rhs.y), (z + rhs.z));
  }
  
  public void add(Vec3 rhs){
    x = (x + rhs.x);
    y = (y + rhs.y);
    z = (z + rhs.z);
  }
  
  public Vec3 minus(Vec3 rhs){
    return new Vec3((x - rhs.x), (y - rhs.y), (z - rhs.z));
  }
  
  public void subtract(Vec3 rhs){
    x = (x - rhs.x);
    y = (y - rhs.y);
    z = (z - rhs.z);
  }
  
  public Vec3 times(float rhs){
    return new Vec3((x * rhs), (y * rhs), (z * rhs));
  }
  
  public void mul(float rhs){
    x = (x * rhs);
    y = (y * rhs);
    z = (z * rhs);
  }
  
  public void normalize(){
    float temp = sqrt(x*x + y*y + z*z);
    x = x / temp;
    y = y / temp;
    z = z / temp;
  }
  
  public Vec3 normalized(){
    return new Vec3((x / sqrt(x*x + y*y + z*z)), (y / sqrt(x*x + y*y + z*z)), (z / sqrt(x*x + y*y + z*z)));
  }
  
  //If the vector is longer than maxL, shrink it to be maxL otherwise do nothing
  public void clampToLength(float maxL){
    if (sqrt(x*x + y*y + z*z) > maxL) {
      float ratio = sqrt(x*x + y*y + z*z) / maxL;
      x = x / ratio;
      y = y / ratio;
      z = z / ratio;
    }
  }
  
  //Grow or shrink the vector have a length of maxL
  public void setToLength(float newL){
    float ratio = sqrt(x*x + y*y + z*z) / newL;
    x = x / ratio;
    y = y / ratio;
    z = z / ratio;
  }
  
  public float distanceTo(Vec3 rhs){
    return sqrt((x-rhs.x) * (x-rhs.x) + (y-rhs.y) * (y-rhs.y) + (z-rhs.z) * (z-rhs.z));
  }
}

Vec3 interpolate(Vec3 a, Vec3 b, float t){
  return new Vec3((a.x + (b.x - a.x) * t), (a.y + (b.y - a.y) * t), (a.z + (b.z - a.z) * t));
}

float dot(Vec3 a, Vec3 b){
  return (a.x * b.x + a.y * b.y + a.z * b.z);
}

Vec3 cross(Vec3 a, Vec3 b){
  return new Vec3(a.y * b.z - a.z * b.y,
                  a.z * b.x - a.x * b.z,
                  a.x * b.y - a.y * b.x);
}

Vec3 projAB(Vec3 a, Vec3 b){
  float scalar = (a.x * b.x + a.y * b.y + a.z * b.z) / (b.x * b.x + b.y * b.y + b.z * b.z);
  float projX = b.x * scalar;
  float projY = b.y * scalar;
  float projZ = b.z * scalar;
  
  if (abs(projX) < 0.00001)
    projX = 0.0;
  if (abs(projY) < 0.00001)
    projY = 0.0;
  if (abs(projZ) < 0.00001)
    projZ = 0.0;
  
  return new Vec3(projX, projY, projZ);
}
