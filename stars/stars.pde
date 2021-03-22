import java.util.*;
import java.io.*;

PImage bg;
PFont font;
Table table = new Table();
ArrayList<Star> starList = new ArrayList<Star>();
ArrayList<Link> linksList = new ArrayList<Link>();
ArrayList<Constellation> constellationList = new ArrayList<Constellation>();

void settings(){
  System.setProperty("jogl.disable.openglcore", "true");
  size(1200, 675, P2D);
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
    Star origin_star = new Star(CONSTELLATION, HIP0, STAR0, random(100,1000), random(100,500));
    Star final_star = new Star(CONSTELLATION, HIP1, STAR1, random(100,1000), random(100,500));
    
    addConstellationToList(constellation); 
    addStarToList(origin_star); 
    addStarToList(final_star);
    generateLink(origin_star, final_star); 
} 

}

void draw(){
background(bg);
for (Star n : starList){
  ellipse(n.x, n.y, 50, 50);
  text(n.name, n.x, n.y);
  font = createFont("Extrabold Italic Open Sans", 18);
  textFont(font);
  fill(n.colour()[0], n.colour()[1], n.colour()[2]);
  
}

for (Link link : linksList){
  line(link.initial_x, link.initial_y, link.final_x, link.final_y);
  stroke(255);
}

}
