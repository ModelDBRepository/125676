//***********************************************************************************************
 
 function makeTitle(title) {
 
  string = "<table WIDTH=620><TR><TD class=title WIDTH=100% HEIGHT=33 colspan=5>" + title + "<\/TD><\/TR>";

  string2 = "<td class=TCALC>" +
            "<a class=TMENU href=\"http://web.njit.edu/~matveev/calc.html\" target=_self>CalC Download<\/a><\/td> ";

  string3 = "<td class=TCALC>" +
            "<a class=TMENU href=\"http://web.njit.edu/~matveev/calc/manual.html\" target=_self>CalC Manual<\/a><\/td> " +
            "<td class=TCALC>" +
            "<a class=TMENU href=\"http://web.njit.edu/~matveev/calc/scripts.html\" target=_self>CalC Scripts<\/a><\/td> " +
            "<td class=TCALC>" +
            "<a class=TMENU href=\"http://web.njit.edu/~matveev/calc/calc_pub.html\" target=_self>CalC Publications<\/a><\/td> " +
            "<td class=TMENU>" +
            "<a class=TMENU href=\"http://web.njit.edu/~matveev/\" target=_top>Victor's Homepage<\/a><\/td> " +
            "<\/tr><\/table><br>"

  document.write(string);
  document.write(string2);
  document.write(string3);

}

  homerImage = new Image();
  homerImage.src = "images/homer.jpg";

  myImage = new Image();
  myImage.src = "images/me2.jpg" // "images/small_photo.jpg";

  function homerHead() { document.head.src = homerImage.src; }

  function myHead() { document.head.src = myImage.src; }



//***********************************************************************************************
