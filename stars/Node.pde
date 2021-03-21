class Node{
  String hip;
  String name;
  float x;
  float y;
  String constellationName;
  
  Node(String _constellationName, String _hip, String _name, float _x, float _y){
    constellationName = _constellationName;
    hip = _hip;
    name = _name;
    x = _x;
    y =_y;
  }
 
 
 float[] colour(){
   float[] defaultColour = new float[]{ 0, 0, 0 }; 
    for (Constellation c : constellationList){
    if (c.name.equals(constellationName)){
      defaultColour = c.colour;
    } 
  }
  return defaultColour; 
 }
 }
