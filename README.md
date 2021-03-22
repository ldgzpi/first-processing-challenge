# Processing Challenge

## Texture Filtering

Texture filtering is modified as requested.

References:
- https://developer.arm.com/documentation/102449/0100/Texture-filtering
- https://stackoverflow.com/questions/62133567/upscaling-an-image-using-nearest-neighbor-in-processing
- https://stackoverflow.com/questions/43077189/how-can-i-achieve-nosmooth-with-the-p3d-renderer

## Stars

The program receives a stars.dat file with the following elements distribution:


```bash
  CONSTELLATION,HIP0,STAR0,HIP1,STAR1
  Orion,27989,Betelgeuse,26207,Meissa
  Orion,27989,Betelgeuse,26727,Alnitak
  Orion,27366,Saiph,26727,Alnitak
  Orion,27366,Saiph,24436,Rigel
  Orion,25930,Mintaka,24436,Rigel
  Orion,25930,Mintaka,26311,Alnilam
  Orion,25930,Mintaka,25336,Bellatrix
  Orion,26207,Meissa,25336,Bellatrix
  Orion,26727,Alnitak,26311,Alnilam
  Orion,22449,Tabit,25336,Bellatrix
  Orion,22449,Tabit,22509,Al Taj I
  Orion,22449,Tabit,22549,Al Taj II
  Orion,22845,Al Taj IV,22509,Al Taj I
  Orion,22549,Al Taj II,22730,HIP 22730
  Orion,23123,Al Taj V,22730,HIP 22730
  Orion,27989,Betelgeuse,28614,μ Ori
  Orion,28614,μ Ori,29038,ν Ori
  Orion,28614,μ Ori,29426,ξ Ori
  Orion,29038,ν Ori,29426,ξ Ori
  Orion,29038,ν Ori,27913,χ1 Ori
  Orion,29426,ξ Ori,28691,64 Ori
```

From the data received as input, a new Table object is builded.
After that, it loops through table rows and assigns the values to the variables with the same name. 

For each row:
- Adds a new constellation to the constellations list.
- Adds a new star to the stars list.
- Generates a link which represents the relation between two stars and adds it to the links list.

Each star is added only once to the star list, because it needs to be shown only once in the drawing. But a star can be linked to one or more different stars. For this reason, the same star could be origin or destiny for one or more links.

On the other hand, the program was thought to be able to received multiple constellations on the same file. Because of that, a constellations list is built. Each constellation of that list is represented by a name and a colour. Each star has an asociated constellation, whose colour will be used at the drawing moment.
This makes the program able to represents multiple constellations on the same graph.

## Error

The original file couldn't be executed because it was throwing a ConcurrentModificationException. This was happening because at the same time the program was trying to loop through the things list, it also wanted to delete its elements. That way, the indexes of the elements contained on the list were broken and therefore, the program couldn't continue looping. A simple way to resolve this could be loop throught the list in the opposite direction to avoid breaking the indexes while deleting the elements. Personally, I prefered to use ListIterator interface, which creates an Iterator for an underlying list and allows to make CRUD operations over it.

References:
- https://docs.oracle.com/javase/7/docs/api/java/util/ListIterator.html

