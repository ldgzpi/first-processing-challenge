import java.util.*;
import java.nio.charset.StandardCharsets;
import java.io.*;

PImage bg;
Table table = new Table();
ArrayList<Node> nodeList = new ArrayList<Node>();
ArrayList<Link> linksList = new ArrayList<Link>();
ArrayList<Constellation> constellationList = new ArrayList<Constellation>();

void settings(){
  System.setProperty("jogl.disable.openglcore", "true");
  size(1200, 675, P2D);
}

boolean nodeAlreadyInList(String hip){
  for (Node node : nodeList){ //<>//
    if (node.hip.equals(hip)){ //<>//
      return true;
    }  //<>//
  }
return false; //<>//
} //<>//

void addToNodesToList(Node star1){
    if (!nodeAlreadyInList(star1.hip)){ //<>//
      nodeList.add(star1); //<>//
    }    
}

boolean constellationAlreadyInList(String constellationName){
  for (Constellation c : constellationList){
    if (c.name.equals(constellationName)){
      return true;
    } 
  }
return false; //<>//
} //<>//
 //<>//
void addToConstellationToList(Constellation constellation){ //<>//
    if (!constellationAlreadyInList(constellation.name)){
      constellationList.add(constellation);
    }    
}

void setup() {
   bg = loadImage("space.jpeg");
   String[] result = openFileAndReadData("stars.dat");
   List<String> columnNames = Arrays.asList(result[0].split(",", -1));
   buildTable(table, columnNames, result);

  for (TableRow row : table.rows()) {
   
    String CONSTELLATION = row.getString(columnNames.get(0));
    String HIP0 = row.getString(columnNames.get(1));
    String STAR0 = row.getString(columnNames.get(2));
    String HIP1 = row.getString(columnNames.get(3));
    String STAR1 = row.getString(columnNames.get(4));
     
    Constellation constellation = new Constellation(CONSTELLATION);   
    Node origin_node = new Node(CONSTELLATION, HIP0, STAR0, random(100,1000), random(100,500));
    Node final_node = new Node(CONSTELLATION, HIP1, STAR1, random(100,1000), random(100,500));
    
    addToConstellationToList(constellation); 
    addToNodesToList(origin_node); 
    addToNodesToList(final_node);
    
    generateLink(origin_node, final_node); 
}  //<>//
 //<>// //<>// //<>// //<>// //<>//
}

void draw(){
background(bg);
  
for (Node n : nodeList){
  ellipse(n.x, n.y, 30, 30);
  text(n.name, n.x, n.y);
  fill(n.colour()[0], n.colour()[1], n.colour()[2]);
  
}

for (Link link : linksList){
  line(link.initial_x, link.initial_y, link.final_x, link.final_y);
  stroke(255);
}

}
