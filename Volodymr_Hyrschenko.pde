//window size
size(400, 500);
//Blue triangle
fill(50, 200, 200);
triangle(0, 0, 400, 500, 0, 500);
//Black triangle
fill(0);
triangle(0, 0, 400, 0, 400, 500);
//Orange arc
fill(250, 100, 0);
arc(200, 250, 250, 250, radians(50), radians(232));
//Yellow arc
fill(250, 200, 0);
arc(200, 250, 250, 250, radians(232), radians(410));
String sentenceOne = "recreated in proccessing \n original work by Volodymyr Hyrshchenko";
print(sentenceOne);
