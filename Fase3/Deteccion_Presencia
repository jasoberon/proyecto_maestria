/* Fase 3
   Detección de presencia
   Incluimos la librería para el sensor ultrasónico
*/

#include <NewPing.h>

// Definimos los pines TRIG y ECHO del sensor ultrasónico
#define TRIG_PIN 2
#define ECHO_PIN 3

// Creamos un objeto NewPing para el sensor
NewPing sonar(TRIG_PIN, ECHO_PIN);

void setup() {
  Serial.begin(9600); // Inicializamos la comunicación serial
  pinMode(10, OUTPUT);  //para utilizar como indicador
}

void loop() {
  delay(500); // Esperamos medio segundo entre mediciones

  // Realizamos una medición de distancia en centímetros
  unsigned int distancia = sonar.ping_cm();

if(distancia > 20 && distancia < 30)
{
  digitalWrite(10, HIGH);
}
else
{
    digitalWrite(10, LOW);
}
  // Mostramos la distancia en el monitor serial
  Serial.print("Distancia: ");
  Serial.print(distancia);
  Serial.println(" cm");
}
