
boolean nodeAlreadyInList(String hip){
  for (Star star : starList){
    if (star.hip.equals(hip)){
      return true;
    } 
  }
return false;
}

void addStarToList(Star star){
    if (!nodeAlreadyInList(star.hip)){
      starList.add(star);
    }    
}

boolean constellationAlreadyInList(String constellationName){
  for (Constellation c : constellationList){
    if (c.name.equals(constellationName)){
      return true;
    } 
  }
return false;
}

void addConstellationToList(Constellation constellation){
    if (!constellationAlreadyInList(constellation.name)){
      constellationList.add(constellation);
    }    
}


void generateLink(Star origin_star, Star final_star){
  float initial_x = origin_star.x; 
  float initial_y = origin_star.y;
  float final_x = final_star.x; 
  float final_y = final_star.y;

   for (Star node : starList) {
      if (node.hip.equals(origin_star.hip)){
        initial_x = node.x;
        initial_y = node.y;
        break;
    }
     if (node.hip.equals(final_star.hip)){
        final_x = node.x;
        final_y = node.y;
        break;
    }
     
  }

  Link link = new Link(initial_x, initial_y, final_x, final_y);
  linksList.add(link);
}
