block[] blocks=new block[0]; //<>//
boolean on=false;
int generation=0, timeSpeed=20;

void setup() {
  fullScreen();
  background(255);
  noStroke();
  positionBlocks();
  for (int i=0; i<blocks.length; i+=1) {
    blocks[i].setupBlock();
  }
}

void draw() {
  background(255, 0, 0);
  for (int i=0; i<blocks.length; i+=1) {
    if (blocks[i].x+blocks[i].w > mouseX && blocks[i].y+blocks[i].h > mouseY  && blocks[i].x < mouseX && blocks[i].y < mouseY && mousePressed==true) {
      blocks[i].alive=true;
    }
    if (frameCount%timeSpeed==0) {
      if (blocks[i].gen != generation && on==true) {
        blocks[i].alive=false;
      }
      if (on==true) {
        generation+=1;
      }
      blocks[i].moveBlock();
    }
    blocks[i].createBlock();
  }
}

void positionBlocks() {
  for (int i=0; i<height; i+=8) {
    for (int j=0; j<width; j+=8) {
      blocks=(block[])append(blocks, new block());
      blocks[blocks.length-1].x=j;
      blocks[blocks.length-1].y=i;
    }
  }
}

void mousePressed() {
  println(frameRate);
}

void keyPressed() {
  if (key==' ') {
    if (on==false) {
      on=true;
    } else {
      on=false;
    }
  }
  if (key=='w') {
    for (int i=0; i<blocks.length; i+=1) {
      blocks[i].alive=false;
    }
  }
}
