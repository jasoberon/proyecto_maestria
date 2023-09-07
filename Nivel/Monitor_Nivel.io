/* Código para monitoreo del
   nivel de líquido en el recipienta
*/

byte nivelMax;  // nivel máximo 
byte nivelAlto;  // nivel alto 
byte nivelmedio; // nivel medio 
byte nivelbajo;     // nivel bajo
int motoBomba;

void setup() // configura entradas y salidas
{
pinMode (13,  INPUT_PULLUP) ; // entrada del nivel máximo de agua
pinMode (12,  INPUT_PULLUP) ; // entrada del nivel alto de agua
pinMode (11,  INPUT_PULLUP) ; // entrada del nivel medio de agua
pinMode (10,  INPUT_PULLUP) ; // entrada del nivel bajo 
pinMode (9 , OUTPUT ); // salida de la bomba 
pinMode (8 , OUTPUT ); // salida led verde
pinMode (7 , OUTPUT ); // salida led Amarillo
pinMode (6 , OUTPUT ); // salida led naranja 
pinMode (5 , OUTPUT ); // salida led rojo 
Serial.begin(9600);
digitalWrite(9,HIGH); 
delay (500); 

}

void loop (){
 nivelMax = digitalRead (13); 
 nivelAlto = digitalRead (12);
 nivelmedio = digitalRead (11); 
 nivelbajo = digitalRead (10) ;

if (nivelMax == LOW && nivelAlto == LOW && nivelmedio == LOW && nivelbajo== LOW){

// NIVEL MAXIMO 

digitalWrite (8 ,HIGH );
digitalWrite (7 , HIGH );
digitalWrite (6 , HIGH );
digitalWrite (5 , HIGH );
digitalWrite (9 , HIGH );  //circuito de control de bomba encendido
//Serial.print(“Nivel Máximo”);
delay(500);
}

  if(nivelMax == HIGH && nivelAlto == LOW && nivelmedio == LOW && nivelbajo== LOW){

// NIVEL MEDIO ALTO

digitalWrite (8 ,LOW );
digitalWrite (7 , HIGH );
digitalWrite (6 , HIGH  );
digitalWrite (5 , HIGH  );
digitalWrite (9 , HIGH );  //circuito de control de bomba encendido
//Serial.print(“Nivel Medio Alto”);
delay(500);
}

 if(nivelMax == HIGH && nivelAlto == HIGH  && nivelmedio == LOW && nivelbajo== LOW){

// NIVEL MEDIO

digitalWrite (8 , LOW);
digitalWrite (7 , LOW );
digitalWrite (6 , HIGH  );
digitalWrite (5 , HIGH  );
digitalWrite (9 , HIGH );  //circuito de control de bomba encendido
//Serial.print(“Nivel Medio”);
delay(500);
 }

  if(nivelMax == HIGH  && nivelAlto == HIGH && nivelmedio == HIGH && nivelbajo== LOW){

// NIVEL BAJO

digitalWrite (8 ,LOW);
digitalWrite (7 , LOW );
digitalWrite (6 , LOW );
digitalWrite (5 , HIGH );
digitalWrite (9 , LOW );  // circuito de control de bomba encendido Serial.print(“Nivel Bajo”);
delay(500);
  }

  if(nivelMax == HIGH  && nivelAlto == HIGH && nivelmedio == HIGH && nivelbajo== HIGH){
    
digitalWrite (8 ,LOW);
digitalWrite (7 , LOW );
digitalWrite (6 , LOW );
digitalWrite (5 , LOW );
digitalWrite (9 , LOW ); //desactiva circuito de control de bomba para protección
//Serial.print(“Bomba desactivada”);
delay(500);

  }
}
