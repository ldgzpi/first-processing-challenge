# Processing Challenge

## Texture Filtering

Se modifica texture filtering segun lo solicitado. Referencias:
- https://developer.arm.com/documentation/102449/0100/Texture-filtering
- https://stackoverflow.com/questions/62133567/upscaling-an-image-using-nearest-neighbor-in-processing
- https://stackoverflow.com/questions/43077189/how-can-i-achieve-nosmooth-with-the-p3d-renderer

## Stars

El programa recibe un archivo stars.dat con la siguiente distribucion de elementos separados por comas:

file:///home/pipa/Desktop/starsdat.png![image](https://user-images.githubusercontent.com/46507487/111926653-7fda4e80-8a8c-11eb-8447-67dfb4904639.png)


A partir de los datos recibidos como input, se forma una objeto del tipo Table.
Luego, se recorren las filas de la tabla y se asignan los valores a las variables del mismo nombre.

Al recorrer cada fila de la tabla:
- Se agrega la constelacion a una lista de constelaciones.
- Se agregan las estrellas a una lista de estrellas.
- Se genera un link que representa la relacion entre las dos estrellas indicadas y se agrega a una lista de links.

Las estrellas no pueden repetirse en la lista de estrellas, porque cada estrella tiene que ser dibujada una unica vez. Pero una estrella puede estar vinculada a una o mas estrellas. Por esto, una misma estrella puede ser origen o destino de uno o mas links.

Por otro lado, se asume que el archivo stars.dat puede tener mas de una constelacion. Por esto, se forma una lista de constelaciones donde cada una se encuentra representada por un nombre y un color. Cada estrella esta asociada a una constelacion, por lo que tomara el color de la misma al momento de dibujarse. Esto permite representar distintas constelaciones en un mismo grafico.

## Error

El archivo original no podia ejecutarse ya que arrojaba ConcurrentModificationException. Esto sucedia porque al mismo tiempo que se recorria la lista things, se intentaba eliminar elementos de la misma. Esto ultimo rompe los indices de los elementos contenidos en la lista y por consiguiente no puede continuar recorriendola. Una manera de resolver esto podria haber sido recorrer la lista en sentido contrario al planteado. Yo elegi utilizar la interfaz ListIterator, que crea un Iterator sobre una lista dada y permite realizar operaciones CRUD sobre la misma.

Referencias:
- https://docs.oracle.com/javase/7/docs/api/java/util/ListIterator.html

