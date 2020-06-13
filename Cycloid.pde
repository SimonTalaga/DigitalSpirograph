class Cycloid {

  
  PVector center;
  // The current rotation of the cycloid
  float rotation;
  boolean type = true;
  // Ce ratio détermine la forme de la figure !
  float ratio = 3/5.0;
  float resolution;
  // Nombre de tours de cercle qu'une ligne représente (par défaut 1)
  float turns = 6;
  // 
  float size;
  // This value (between 0 & 1) is the "position" of the separation between the two "needles" (or radius) used to draw the cycloids) 
  float needlesRatio;
  // Z-Index
  int zindex; 
  // Drawing attributes
  color fillColour, strokeColour;
  int strokeWeight;

  Cycloid(PVector center, float ratio, float turns, float resolution, float size, float needlesRatio, boolean type, int zindex) {
    this.center = center;
    this.ratio = ratio;
    this.turns = turns;
    this.size = size;
    this.needlesRatio = needlesRatio;
    this.resolution = resolution;
    this.rotation = 0;
    this.type = type;
    this.zindex = zindex;
    
    this.fillColour = color(0, 255, 255);
    this.strokeColour = color(255, 255, 0);
    this.strokeWeight = 3;
  }
  
  Cycloid clone(int z) {
    Cycloid clone = new Cycloid(new PVector(this.center.x, this.center.y), this.ratio, this.turns, this.resolution, this.size, this.needlesRatio, this.type, z); //<>//
    clone.strokeColour =  this.strokeColour;
    clone.strokeWeight =  this.strokeWeight;
    clone.fillColour =  this.fillColour;
    
    return clone;
  }
  
  void setFillColour(color colour) {
    this.fillColour = colour;
  }
  
  boolean getType() {
    return this.type;
  }
  color getFillColour() {
    return this.fillColour;
  }
  
  color getStrokeColour() {
    return this.strokeColour;
  }
  
 void setRatio(float ratio) {
    this.ratio = ratio;
 }
 
 void setResolution(float resolution) {
   this.resolution = resolution;
 }
 
 float getResolution() {
   return this.resolution;
 }
 
 float getRatio() {
    return this.ratio;
 }
 
 float getTurns() {
    return this.turns;
 }
 
  void setTurns(float turns) {
    this.turns = turns;
  }
  
  void setStrokeColour(color colour) {
    this.strokeColour = colour;
  }
  
  void setStrokeWeight(int sw) {
    this.strokeWeight = sw;
  }
  
  int getStrokeWeight() {
    return this.strokeWeight;
  }
  
  void setPosition(int x, int y) {
    this.center = new PVector(x, y);
  }
 
  int getZindex() {
    return this.zindex;
  }
  
  void setZindex(int zindex) {
    this.zindex = zindex;
  }
  PVector getPosition() {
    return this.center;
  }
  
 void setNeedlesRatio(float ratio) {
   this.needlesRatio = ratio;
 }
 
 float getNeedlesRatio() {
   return this.needlesRatio;
 }
 
 void setSize(float size) {
   this.size = size;
 }
 
 float getSize() {
   return this.size;
 }
  
  
  void setRotation(float rotation) {
    this.rotation = rotation;
  }
  
  float getRotation() {
    return this.rotation;
  }
  
  void setType(boolean type) {
    this.type = type;
  }

  void drawShape() {
    // Les deux longueurs utilisées (complexifie encore la figure) comme "rayons"
    float r1 = size * needlesRatio;
    float r2 = size * (1 - needlesRatio);
    
    //ellipse(center.x, center.y, 5, 5);

    // Resolution of the figure
    float step = TWO_PI / resolution;
    
    // Setup palette
    stroke(this.strokeColour); 
    if(this.fillColour == -1)
      noFill();
    else 
      fill(this.fillColour);
      
    if(this.strokeWeight == 0)
      noStroke();
    else
      strokeWeight(this.strokeWeight);
      
    beginShape();
    for (float i = 0; i < TWO_PI * turns; i += step) {
      float posX, posY;
      // Epicycloid
      if(type) { 
        // Rcos(a) - rcos(a + a / ratio)  
        posX = center.x - r1 * cos(rotation + i) - r2 * cos(rotation + i + i / ratio); 
        posY = center.y - r1 * sin(rotation + i) - r2 * sin(rotation + i + i / ratio);
      }
      // Hypocycloid
      else { 
        posX = center.x - r1 * cos(rotation + i) - r2 * cos(rotation + i - i / ratio); 
        posY = center.y - r1 * sin(rotation + i) - r2 * sin(rotation + i - i / ratio);
      }
      
      curveVertex(posX, posY);
    }
    endShape();
  }
}
