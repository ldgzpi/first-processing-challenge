import java.util.HashMap;

void settings(){
  System.setProperty("jogl.disable.openglcore", "true");
   //size(1000, 1000, P2D);
   fullScreen(P2D, 2);

}

Table table;

//Pensa que lo tenes que dibujar: los nodos y los links son entidades independientes

class Node{
  int hip;
  String name;
  float x;
  float y;
  
  Node(int _hip, String _name, float _x, float _y){
    hip = _hip;
    name = _name;
    x = _x;
    y =_y;
  }
}

//Primero pensa las relaciones como arrays, asi lo tenes en todos. Despues fijate si lo podes pasar a map y si tiene sentido. Que cambiaria del algoritmo?
class Link{
  ArrayList<Integer> relatedNodes;
}

ArrayList<Node> nodeList = new ArrayList<Node>();
//ArrayList<Link> linksList = new ArrayList<Link>();
HashMap<String, String> links = new HashMap<String, String>();

//Ver como reemplazar findInList por contains en processing
boolean findInList(int hip){
  boolean founded = false;
  for (Node node : nodeList){
    if (node.hip == hip){
      founded = true;
    }
  }
  return founded;
}

void setup() {
  ((PGraphicsOpenGL)g).textureSampling(2);  // el 2 es nearest
  
  table = loadTable("stars.csv", "header");

  for (TableRow row : table.rows()) {

    int HIP0 = row.getInt("HIP0");
    int HIP1 = row.getInt("HIP1");
    String CONSTELLATION = row.getString("CONSTELLATION");
    String STAR0 = row.getString("STAR0");
    String STAR1 = row.getString("STAR1");
    
    Node nd = new Node(HIP0, STAR0, random(1,1000), random(1,1000));
 
    if (!findInList(nd.hip)){
      nodeList.add(nd);
    }      
    
}
 
  for (Node n : nodeList){
    println(n.name);
  }
 
}

void draw(){
  
for (Node n : nodeList){
  ellipse(n.x, n.y, 10, 10);
  text(n.name, n.x, n.y);
}

}
