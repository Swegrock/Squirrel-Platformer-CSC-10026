// This is the level index used to determine which level will be loaded.
int levelIndex = 0;

class LevelManager {

  // This contains every object on the level, the maximum objects a level can have is 150.
  ImageObject[] levelObjects = new ImageObject[150];
  
  // The length will always be either equal or less than the size of levelObjects, it stops null objects from being drawn and crashing the program.
  int length;

  // The load level method will load the level from its String array and draw it out in the world.
  void loadLevel(String[] levelString) {
    // The index of an empty position in levelObjects.
    int index = 0;

    for (int y = 0; y < levelString.length; y++) {

      // Each of the characters will be translated into their repsective object and instantiated in the world.
      // The only thing worthy of noting here is how platforms objects are created using length instead of creating a new platform for each character,
      // this means that the platforms will be far less processor intensive and allows for more platforms to exist within the world.
      // In theory this ccould be achieved for platforms blocks above and below each other however that would be far more difficult to achieve.
      
      String line = levelString[y];
      int lineLength = line.length();

      char previousChar = line.charAt(0);
      int px = 0;

      for (int x = 1; x < lineLength; x++) {
        char currentChar = line.charAt(x);

        if (currentChar != previousChar) {
          if (previousChar == 'W') {
            levelObjects[index] = new Platform(px * 64, y * 64, woodImage, x - px);
            index++;
          }
          px = x;
        }
        if (currentChar == 'P') {
          player.x = player.startX = x * 64;
          player.y = player.startY = y * 64;
        } else if (currentChar == 'B') {
          Box box = new Box(x * 64, y * 64, boxImage, brokenBoxSprites);
          box.index = index;
          levelObjects[index] = box;
          index++;
        } else if (currentChar == 'C') {
          levelObjects[index] = new Collectable(x * 64 + 16, y * 64 + 16, 32, 32, acornSprites, 4, CollectableType.ACORN);
          index++;
        } else if (currentChar == 'E') {
          levelObjects[index] = new Collectable(x * 64 + 16, y * 64 + 16, 32, 32, pageSprites, 8, CollectableType.PAGE);
          index++;
        } else if (x == lineLength - 1 && currentChar == 'W'){
          levelObjects[index] = new Platform(px * 64, y * 64, woodImage, x - px);
          index++;
        }

        previousChar = currentChar;
      }
      println();
    }
    length = index;
  }
}

// Levels are defined using a 2D array containing Strings of 132 characters (the width of the world divided by the width of a block).
// Each array is 35 Strings in length (the height of the world divided by the height of a block).
// The characters translate as follows:
// W = Wooden platform block
// C = Acorn collectable
// B = Breakable box platform block
// P = Player starting position
// E = Page position, end of level marker

String[][] levels = new String[][]
  {{"____________________________________________________________________________________________________________________________________",
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________",
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________",
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________",
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________C_______________________________________", 
    "_____________________________________________________________________________________________C______________________________________", 
    "_______________________________________________________________CCC____________________________C_____________________________________", 
    "_______________________________________________________________CCC__________________________________________________________________", 
    "__________________________________________C____________________CCC__________________BCCB____________________________________________", 
    "____________________________________C______C__________________WWWWW________________WWWWWW___________________________________________", 
    "___________________________________CBC__________________C________________________________________________________CC_________________", 
    "____________CC_____________________BBB_________________WWW_______________C_B_C_________________________________WWW_WW_______________", 
    "____________WWW______CBBC_________BBBBB______________WW_________________WWWWWWW_____________________C_____________________________E_", 
    "___P_B_C____________WWWWWWW______WWWWWWW_______C_C_WW__________________________________________WWWWWWWW___________________WWWWWWWWWW", 
    "WWWWWWWW______________________________________WWWWW________________________________________________________WW____CBC________________", 
    "_________________________________________________________________________________________________________________WWW________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________",},
    {"____________________________________________________________________________________________________________________________________",
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________",
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________",
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________",
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________WW___CC______________B__________________________________________________________________________________", 
    "__P_______CC___CC____CC__________WW___CC________BB_________________________________________________________WW_______________________", 
    "WWWWW_____WW___WW____WW_______________WW_______B_BB______________________________________________________CW__WC_____________________", 
    "_______WW__________________________________WWWWWWWWWWWWWW_____CC_________________________________________W____W_____________________", 
    "_____________________________________________________________WWWW___C__________________________________CW______WC___________________", 
    "___________________________________________________________________WWW____CC___________________________W________W___________________", 
    "_________________________________________________________________________WWWW______WWBWWBWW___________W__________WC_C_C___C_______E_", 
    "__________________________________________________________________________________W__W__W__W_____WWWWW____________WWWWW__WWW__WWWWWW", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________",},
    {"_____________________C_______C______________________________________________________________________________________________________",
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "______________________________________________BB____________________________________________________________________________________", 
    "___________WW____________________________WWW_WWWW___________________________________________________________________________________",
    "____P_____________C_______C_______C_________C_______________________________________________________________________________________", 
    "WWWWWWWW__________W_______W_______W________WWW__C_C_C_C_________________________CC__________C_______________________________________", 
    "______________________________________________WWWWWWWWW_WW________________CC___WWWW_____B__WWW___C___C___C__________________________", 
    "_________________________________________________________C_C_C_C_C_C_C___WWWW___________WWW______WW__W__WWW___C______C____C____CW___", 
    "_______________________________________________________WWWWW_W_W_W_W_WW______________________________________WWWW___WWW__WWWWWWCW___",
    "______________________________________________________________________________________________________________________________WCW___", 
    "______________________________________________________________________________________________________________________________WCW___", 
    "______________________________________________________________________________________________________________________________WCW___", 
    "______________________________________________________________________________________________________________________________WCW___", 
    "______________________________________________________________________________________________________________________________WCW___",
    "______________________________________________________________________________________________________________________________WCW___", 
    "______________________________________________________________________________________________________________________________WCW___", 
    "______________________________________________________________________________________________________________________________WCW___", 
    "______________________________________________________________________________________________________________________________WCW___", 
    "______________________________________________________________________________________________________________________________WCW___",  
    "______________________________________________________________________________________________________________________________WCW___", 
    "______________________________________________________________________________________________________________________________WCW___", 
    "______________________________________________________________________________________________________________________________WCW___", 
    "______________________________________________________________________________________________________________________________WC__E_", 
    "______________________________________________________________________________________________________________________________WWWWWW", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________",
    "____________________________________________________________________________________________________________________________________",  
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________", 
    "____________________________________________________________________________________________________________________________________",}
};
