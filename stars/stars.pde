import java.util.HashMap;

void settings(){
  System.setProperty("jogl.disable.openglcore", "true");
   //size(1000, 1000, P2D);
   fullScreen(P2D, 2);

}

Table table;

ArrayList<Node> nodeList = new ArrayList<Node>();
ArrayList<Link> linksList = new ArrayList<Link>();

//Ver como reemplazar findInList por contains en processing
boolean alreadyInList(int hip){
  boolean founded = false;
  for (Node node : nodeList){
    if (node.hip == hip){
      founded = true;
    }
  }
  return founded;
}

void addToNodesToList(Node star1){
    if (!alreadyInList(star1.hip)){
      nodeList.add(star1);
    }    
}

void generateLink(Node origin_node, Node final_node){
  float initial_x = origin_node.x; //<>//
  float initial_y = origin_node.y; //<>//
  float final_x = final_node.x; //<>//
  float final_y = final_node.y;   //<>// //<>// //<>// //<>//

   for (Node node : nodeList) {
    if (node.hip == origin_node.hip){
        initial_x = node.x;
        initial_y = node.y;
        break;
    }
  }
    
   for (Node node : nodeList) {
    if (node.hip == final_node.hip){
        final_x = node.x;
        final_y = node.y;
        break;
    }
  }

  Link link = new Link(initial_x, initial_y, final_x, final_y);
  linksList.add(link);
}


void setup() {
  ((PGraphicsOpenGL)g).textureSampling(2);  // el 2 es nearest
   background(51);

  
  table = loadTable("stars.csv", "header");

  for (TableRow row : table.rows()) {

    int HIP0 = row.getInt("HIP0");
    int HIP1 = row.getInt("HIP1");
    String STAR0 = row.getString("STAR0");
    String STAR1 = row.getString("STAR1");
       
    Node origin_node = new Node(HIP0, STAR0, random(400,1100), random(400,1100));    //<>//
    Node final_node = new Node(HIP1, STAR1, random(400,1100), random(400,1100));  //<>//
     
    addToNodesToList(origin_node); //<>//
    addToNodesToList(final_node);

    generateLink(origin_node, final_node); //<>//
    
} //<>//

}

void draw(){
  
for (Node n : nodeList){
  ellipse(n.x, n.y, 30, 30);
  text(n.name, n.x, n.y);
}

for (Link link : linksList){
  line(link.initial_x, link.initial_y, link.final_x, link.final_y);
  stroke(126);
}

}
