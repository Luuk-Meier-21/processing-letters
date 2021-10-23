class CharGrid {

  public String string;
  public float cells;
  public int maxFontSize;
  public int minFontSize = 0;
  private Pos initialPos;
  
  public CharGrid(
    String string,
    float cells,
    float maxFontSize,
    Pos initialPos
  ) {
    //this.string = Utils.stringToChars(contentString, true);
    this.string = string;
    this.cells = cells;
    
    this.maxFontSize = int(maxFontSize);
    this.initialPos = initialPos;
  }
  
  public char[] chars() {
    return Utils.stringToChars(string, true);
  }
  
  public float cellSize() {
    return img.width / cells;
  }
  
  public void render() {    
    Counter c = new Counter(0, chars().length);
    
    push();
    renderTransforms();
    for(int y = 0; y < cells; y++) {
      for(int x = 0; x < cells; x++) {
          c.update();
          color col;
          if (c.i == 0) col = color(255, 0, 0);
          else if (c.i == 1) col = color(0, 255, 0);
          else if (c.i == 2) col = color(0, 0, 255);
          else col = color(40, 0, 255);
          
          char l = chars()[c.i];
          renderLetter(l, x, y, col);
      }
    }
    pop();
  }
  
  public void renderTransforms() {
    translate(width / 2, height / 2);
    rotate(radians(30));
    translate(- img.width / 2, - img.height / 2);
    translate(cellSize() / 2, cellSize() / 2);
  }
  
  private void renderLetter(char l, int x, int y, color f) {
    color c = img.get(int(x * cellSize()), int(y * cellSize()));
    float size = map(red(c), 0, 255, minFontSize, maxFontSize);
    blendMode(DIFFERENCE);
    push();
    if (int(size) > 0) {
      textSize(int(size));
      float cw = textWidth(l);
      float ca = textAscent();
      float cd = textDescent();
      float ch = ca + cd;
      
      translate(-cw / 2, 0);
      
      fill(colorText);
      text(l, x * cellSize(), y * cellSize());
    }
    pop();
    fill(f);
     //ellipse(x * tileSize, y * tileSize, 30, 30);
  }
}
