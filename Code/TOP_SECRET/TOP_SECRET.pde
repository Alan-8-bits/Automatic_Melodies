int num_octaves=5;
int note_height;

//Scales to pass
int[][]scales={
  {0,2,4,6,7,9,11} //C Major
};

//Chords types
int[][]chord_types={
  {2,4}, // Major/Minor
  {2,4,6},
  {3,4}
};
  
  
void setup() {
  size(700,700);
  note_height=height/(num_octaves*12);
  
  generar_teclado();
  draw_chords(generar_acordes(), int(random(0,scales.length)) );
  //generar_melodia();
}

void draw() {
  if(keyPressed){
    background(200);
    
    generar_teclado();
    draw_chords(generar_acordes(), int(random(0,scales.length)) );
    //generar_melodia();
  }
}

void generar_teclado(){
  
  fill(250); //White color
  rect(0, 0, 80, height);
  fill(0); //Black color
  int x=0;
  int aux=0;
  
  for(int i=0;i<num_octaves;i++){
    aux=aux+6;
    for(x++;x<aux;x=x+2){  
      rect(0, x*note_height, 80, note_height);
    }
      rect(0, note_height*x, 80, 1);
      aux=aux+6;
    for(x++;x<aux;x=x+2){  
      rect(0, x*note_height, 80, note_height);
    }
      rect(0, note_height*x, 80, 1);
  }
  
  // VERTICAL LINES
  for(int i=0;i<64;i++){
    line(i*(width-80)/64+80, 0, i*(width-80)/64+80, height);
  }
  
  // HORIZONTAL LINES: 12 lines for each ocatave (36 = 3 octavas)
  for(int i=1;i<=12*num_octaves;i++){
    line(80, i*note_height, width, i*note_height);
  }
  
  // REFERENCES 
  for(int i=0;i<4;i++){
    line( i*(width-80)/4+79 , 0, i*(width-80)/4+79, height);
  }  
  
}

int[][] generar_acordes(){
  
  //Generate the first note in the middle octave and then generate the rest of them not a octave far from the first one
  int n1=int(random(7,14)); 
  int n2=int(random(n1-6,n1+7));  
  int n3=int(random(n1-6,n1+7));
  int n4=int(random(n1-6,n1+7));
  
  //Generating the type of each
  int n1_type=int(random(0,chord_types.length));
  int n2_type=int(random(0,chord_types.length));
  int n3_type=int(random(0,chord_types.length));
  int n4_type=int(random(0,chord_types.length));
  
  //Choosing the scale randomly from the global scales array
  int scale= int( random(0,scales.length) );
  
  //Creating the two dimensional array to pass to the function draw_chords
  int[][]res={
  {n1,n1_type},
  {n2,n2_type},
  {n3,n3_type},
  {n4,n4_type}
  };
  
  return res;
}

void draw_chords(int[][] chords, int scale){
  
  for(int i=0; i<chords.length; i++){
    //(n/7)*12 + scales[][n%7]
    rect(i*(width-80)/4+80, ((chords[i][0]/7)*12 + scales[scale][chords[i][0]%7]) *note_height, (width-80)/4 , note_height);
    
    for(int x=0; x<chord_types[ chords[i][1] ].length; x++){
      
      
      rect(i*(width-80)/4+80, (((chord_types[chords[i][1]][x]+chords[i][0])/7)*12 + scales[scale][(chord_types[chords[i][1]][x]+chords[i][0])%7]) *note_height , (width-80)/4, note_height);
      
    }
    
  }
}

void generar_melodia(){
  //8 por nota en acorde
  
  //First quarter
  int n_notes=0;
  int[]space={0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0};
  
  do{
    int ran=int(random(0,15));
    if( space[ran]==0 && space[ran+1]==0 ){
      space[ran]=1;
      space[ran+1]=1;
      fill(100,149,237);
      rect(ran*19+80, 18*17, 38, note_height);
      n_notes++;
    }
  }while( n_notes<8 && int(random(0,4))!=0 );
  
  
  
  //second quarter
  
  //last quarter
}
