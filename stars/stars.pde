Table table;

class Node{
  int hip;
  String name;
  ArrayList<String> links;
  
  Node(int _hip, String _name){
    hip = _hip;
    name = _name;
  }
}

ArrayList<Node> nodeList = new ArrayList<Node>();

  
  boolean alreadyInList(int new_hip){
    boolean isRepeated = false;
    for (Node n : nodeList){
      if (n.hip == new_hip){
        isRepeated = true;
      } 
    }
    return isRepeated;
  }

void setup() {

  table = loadTable("stars.csv", "header");

 // println(table.getRowCount() + " total rows in table");

  for (TableRow row : table.rows()) {

    int HIP0 = row.getInt("HIP0");
    int HIP1 = row.getInt("HIP1");
    String CONSTELLATION = row.getString("CONSTELLATION");
    String STAR0 = row.getString("STAR0");
    String STAR1 = row.getString("STAR1");
    
    Node nd = new Node(HIP0, STAR0);
    
    if (!alreadyInList(nd.hip)){
      //println("esta repetido");
      nodeList.add(nd);
    }

  }
 
  for (Node n : nodeList){
    println("name : " + n.name + " hip : " + n.hip);
  } 
 
}
