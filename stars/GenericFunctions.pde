void generateLink(Node origin_node, Node final_node){
  float initial_x = origin_node.x; 
  float initial_y = origin_node.y;
  float final_x = final_node.x; 
  float final_y = final_node.y;

   for (Node node : nodeList) {
      if (node.hip.equals(origin_node.hip)){
        initial_x = node.x;
        initial_y = node.y;
        break;
    }
     if (node.hip.equals(final_node.hip)){
        final_x = node.x;
        final_y = node.y;
        break;
    }
     
  }

  Link link = new Link(initial_x, initial_y, final_x, final_y);
  linksList.add(link);
}
