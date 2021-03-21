import java.util.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;


import java.io.*;

void settings(){
  System.setProperty("jogl.disable.openglcore", "true");
   //size(1000, 1000, P2D);
   fullScreen(P2D, 2);

}

Table table = new Table();

ArrayList<Node> nodeList = new ArrayList<Node>();
ArrayList<Link> linksList = new ArrayList<Link>();

//Ver como reemplazar findInList por contains en processing
boolean alreadyInList(String hip){
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


// Open a file and read its binary data 
byte b[] = loadBytes("stars.dat"); 
 
//Lo transforma en strings con los valores separados por commas
String s = Base64.getEncoder().encodeToString(b);
byte[] decodedBytes = Base64.getDecoder().decode(s);
String decodedString = new String(decodedBytes);

//println(decodedString);

String[] result = decodedString.split("\\R", 0);

//SETEAR NOMBRES DE COLUMNAS:

List<String> columns = Arrays.asList(result[0].split(",", -1));
for (String columnName : columns){
  table.addColumn(columnName.toString());
}

//SETEAR FILAS
for (int i = 1 ; i < result.length ; i++){
  List<String> data = Arrays.asList(result[i].split(",", -1));
    TableRow newRow = table.addRow();
      
    newRow.setString(columns.get(0), data.get(0));
    newRow.setString(columns.get(1), data.get(1));
    newRow.setString(columns.get(2), data.get(2));
    newRow.setString(columns.get(3), data.get(3));
    newRow.setString(columns.get(4), data.get(4));

}
println(table.getRowCount());


//  table = loadTable("stars.csv", "header");

  for (TableRow row : table.rows()) {

    String HIP0 = row.getString(columns.get(1));
    String HIP1 = row.getString(columns.get(2));
    String STAR0 = row.getString(columns.get(3));
    String STAR1 = row.getString(columns.get(4));
       
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
