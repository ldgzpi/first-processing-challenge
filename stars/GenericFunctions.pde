
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

   for (Star star : starList) {
      if (star.hip.equals(origin_star.hip)){
        initial_x = star.x;
        initial_y = star.y;
        break;
    }
  }
    
  for (Star star : starList) {
        if (star.hip.equals(final_star.hip)){
        final_x = star.x;
        final_y = star.y;
        break;
    }
  }

  Link link = new Link(initial_x, initial_y, final_x, final_y);
  linksList.add(link);
}
