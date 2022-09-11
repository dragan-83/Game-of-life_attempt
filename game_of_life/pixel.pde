class block {
  float x=1, y=1, w=8, h=8, c=244;
  boolean alive=false;
  int neighbours=0;
  int gen;
  block[] neighbourCount={};

  void setupBlock() {
    for (int i=0; i<blocks.length; i+=1) {  
      if (x == blocks[i].x + blocks[i].w && y == blocks[i].y || x == blocks[i].x + blocks[i].w && y == blocks[i].y + blocks[i].h || x == blocks[i].x && y == blocks[i].y + blocks[i].h || x == blocks[i].x - blocks[i].w && y == blocks[i].y - blocks[i].h || x == blocks[i].x - blocks[i].w && y == blocks[i].y || x == blocks[i].x && y == blocks[i].y - blocks[i].h || x == blocks[i].x+blocks[i].w && y == blocks[i].y - blocks[i].h || x == blocks[i].x - blocks[i].w && y == blocks[i].y + blocks[i].h) {
        neighbourCount=(block[])append(neighbourCount, blocks[i]);
      }
      //print(neighbourCount.length);
      //print("-");
    }
  }
  void moveBlock() {
    if ( on==true) {
      gen=generation;
      neighbours=0;
      for (int j=0; j<neighbourCount.length; j+=1) {
        if (neighbourCount[j].alive==true) {
          neighbours+=1;
        }
      }
      if (alive==true && neighbours<2) {
        alive=false;
      } else if (alive==true && neighbours>3) {
        alive=false;
      } else if (neighbours==3) {
        alive=true;
      } else if (alive==true && neighbours==2) {
        alive=true;
      }
    }
  }



  void createBlock() {
    if (alive==true) {
      c=100;
    } else {
      c=255;
    }
    fill(c);
    rect(x, y, w, h);
  }
}
