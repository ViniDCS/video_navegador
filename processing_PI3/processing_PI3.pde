import processing.video.*;

Movie mov;
float vell = 1;
int lastMillis = 0;

void setup() {
  background(0);
  //Cria uma janela de tamanho ... por ...
  size(1024, 768);
  //Chamar a variavel mov = movie  
  mov = new Movie(this, "pi3.mov");
  mov.loop();
  mov.stop();
}

void movieEvent(Movie movie) {
  mov.read();
}

void draw() {
  image(mov, 0, 96, 1024, 576);
  if(millis()-lastMillis>2000) {
    vell = vell*0.5;
    mov.speed(vell);
    lastMillis=millis();
  } else if(millis()-lastMillis <= 0) {
    mov.stop();
    lastMillis=millis();
  }
}

void keyPressed() {
  if (key == 'f') {
    vell = 1;  
    mov.speed(vell);
    mov.loop();
    lastMillis = millis();
    print("x");
  }
}

boolean sketchFullScreen() {
  return true;
}
