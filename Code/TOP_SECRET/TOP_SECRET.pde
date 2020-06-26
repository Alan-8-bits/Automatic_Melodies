int grosor_notas=17;
  
  
void setup() {
  size(1296, 612);
  
  generar_teclado();
  generar_acordes();
  
}

void draw() {
  if(keyPressed){
    background(200);
    
    generar_teclado();
    generar_acordes();
  }
}



int escala(int nota){
  
  switch(nota){
    case 1:
      return 12*17*nota;
    case 2:
      return 12*17*nota;
    case 3:
      return 12*17*nota;
    case 4:
      return 12*17*nota;
    case 5:
      return 12*17*nota;
    case 6:
      return 12*17*nota;
    case 7:
      return 12*17*nota;
  }
  
  return nota;
}

void generar_teclado(){
  
  fill(250);
  rect(0, 0, 80, 612);
  fill(0);
  int x=0;
  int aux=0;
  
  for(int i=0;i<3;i++){
    aux=aux+6;
    for(x++;x<aux;x=x+2){  
      rect(0, x*17, 80, grosor_notas);
    }
      rect(0, 17*x, 80, 1);
      aux=aux+6;
    for(x++;x<aux;x=x+2){  
      rect(0, x*17, 80, grosor_notas);
    }
      rect(0, 17*x, 80, 1);
  }
  
  for(int i=0;i<64;i++){
    line(i*19+80, 0, i*19+80, 612);            //lineas verticales
  }
  for(int i=0;i<4;i++){
    line(i*(19*16)+79, 0, i*(19*16)+79, 612);  //referencias
  }
  for(int i=0;i<36;i++){
    line(80, i*grosor_notas, 1296, i*grosor_notas);                //lineas horizontales
  }
  
}

void generar_acordes(){
  float duracion=random(1,16);
  
  int n1=int(random(1,8)),n2=int(random(n1-6,n1+6));
  int n3=int(random(n1-6,n1+6)),n4=int(random(n1-6,n1+6));
  
  int patron;
 
    rect(80, n1*grosor_notas, 19*16, grosor_notas);
    rect(19*16+80, n2*grosor_notas, 19*16, grosor_notas);
    rect(2*(19*16)+80, n3*grosor_notas, 19*16, grosor_notas);
    rect(3*(19*16)+80, n4*grosor_notas, 19*16, grosor_notas);
}
