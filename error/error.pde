class Thing
{
  PVector pos;
  float radius;
  int lifetime;

  Thing()
  {
    this.radius = random(5, 50);
    this.pos = new PVector(random(min(width, height) * 0.5f - this.radius), 0.0f);
    this.pos.rotate(random(TWO_PI));
    this.pos.add(new PVector(width * 0.5f, height * 0.5f));
    this.lifetime = int(floor(random(10, 100)));
  }
  
 //Declaro una clase Thing con un PVector pos, un radio y un lifetime. Armo el constructor. Lifetime es un numero random entre 10 y 100
 //isDead es un booleano que devuelve true si la vida es negativa
 //update resta vida
 //draw arma una elipse con los parametros de la cosa

  boolean isDead() //<>//
  {
    return this.lifetime <= 0;
  }

  void update()
  {
    this.lifetime--;
  }
  
  void removeDeadThings(){
    
  }
  
//Buscar sobre draw: por que tengo uno adentro y otro afuera? tengo uno dibujo total y cada objeto es encargado de dibujarse a si mismo?
  void draw()
  {
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
  }
};

ArrayList<Thing> things;
void setup()
{
  size(800, 600); //<>//
  things = new ArrayList<Thing>();
  for (int t = 0; t < 10; t++)
    things.add(new Thing()); //<>//
}

//los numeros negativos son int?

void draw()
{
 println("things : " + things); //aca empieza a loopear ?
  background(32);
  noStroke();
  fill(128, 64, 32);
  //this error is shown when you try and change (add / remove items) the collection on which you iterate during the loop.
 
  
  
  for (Thing t : things)
  {
    t.update();// aca es donde rompe, por que? ConcurrentModificationException. Que es lo que quiero hacer con el programa? Dibujar circulos random?
    t.draw(); //<>// //<>// //<>// //<>// //<>//
  }
  
  for (Thing t : things) {
    if (t.isDead())
    {
      things.remove(t);
      things.add(new Thing());
      if (things.size() < 100)
        things.add(new Thing());
    }
  }
  
  
  
  
  
  
  
}
