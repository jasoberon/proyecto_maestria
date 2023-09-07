/*  Código para el aplicador
 *  de gel antibacterial
 *  uso de sensor ultrasonico
 *  y servomotor para mover mecanismo
 */
 
#include <NewPing.h>
#include <Servo.h>

#define TRIG_PIN 2
#define ECHO_PIN 3

NewPing sonar(TRIG_PIN, ECHO_PIN);

Servo miServo; // Creamos un objeto para controlar el servomotor
int anguloInicial = 0; // Ángulo inicial del servomotor
int anguloFinal = 90; // Ángulo final del servomotor

void setup() {
  Serial.begin(9600);
  miServo.attach(9); // Conectamos el servo al pin 9
  miServo.write(anguloInicial); // Inicializamos el servo en la posición inicial
}

void loop() {
  delay(500);

  unsigned int distancia = sonar.ping_cm();

  Serial.print("Distancia: ");
  Serial.print(distancia);
  Serial.println(" cm");

  if (distancia >= 10 && distancia <= 15) {
    // Si la distancia está entre 10 cm y 15 cm, mover el servo de 0 a 90 grados
    for (int angulo = anguloInicial; angulo <= anguloFinal; angulo++) {
      miServo.write(angulo);
      delay(15); // Pequeño retraso para suavizar el movimiento
    }
  } else {
    // Si la distancia no está en ese rango, mover el servo de 90 a 0 grados
    for (int angulo = anguloFinal; angulo >= anguloInicial; angulo--) {
      miServo.write(angulo);
      delay(15); // Pequeño retraso para suavizar el movimiento
    }
  }
}
