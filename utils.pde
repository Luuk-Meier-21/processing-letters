static class Utils {
  static public char[] stringToChars(String str, boolean filterWhitespace) {
    String fStr = filterWhitespace ? str.replaceAll("\\s+","") : str;
    char[] ch = new char[fStr.length()];
    for (int i = 0; i < fStr.length(); i++) {
      ch[i] = fStr.charAt(i);
    }
    return ch;
  }  
}

class Counter {
    int i;
    int max;
    
    Counter(int initialIndex, int max) {
      this.i = initialIndex;
      this.max = max;
    }
    
    void update() {
      if(i < max -1) {
        i++;
      } else {
        i = 0;
      }
    }
  }
  

class Pos {
  public int x;
  public int y;
  
  public Pos(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

class Letter {
  int maxSize;
  int minSize;
  
}
