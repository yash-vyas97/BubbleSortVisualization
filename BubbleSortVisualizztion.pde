int[] list;
int current;
int max;
boolean done = false;
int white = 255;
int integers = 20;
void setup() {
  size(500, 500);
  background(white);
  list = new int[integers];
  for (int i=0; i < list.length; i++) {
    list[i] = i+1; 
    //Math.round(random(0, 200));
  }
  // Shuffle list.
  for ( int i = 0; i < list.length; i++) {
    int randomize = int(random(list.length));
    int t = list[i];
    list[i] = list[randomize];
    list[randomize] = t;
  }
  max = list.length-1;
}
 
void draw() {
  if ( done ) { 
    return;
  }
  background(white);
  translate(1, 0);
  if (current>=max) {
    current=0;
    max--;
  }
  if (list[current]>list[current+1]) {
    int newMax = list[current];
    list[current] = list[current+1];
    list[current+1] = newMax;
  }
  current++;
  noStroke();//stroke(0);
  for (int i = 0; i<list.length; i++) {
    fill(196);
    if (i==current) { 
      fill(255, 0, 0);
    }
    if (i>max) { 
      fill(0, 255, 0);
    }
    rect(i*20, height-(20*list[i]), 18, (20*list[i]) );
    fill(0);
    rect(i*20, height-(20*list[i]), 18, 18 );
  }
  if (max == -1) {
    done = true;
  }
}
