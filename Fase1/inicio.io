const int ledPin = 13;
const int luzroja = 12;
const int luzverde = 11;
conet int bomba = 10;

int estado = 1;

void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
  pinMode(luzroja, OUTPUT);
  pinMode(luzverde, OUTPUT);
  pinMode(bomba, OUTPUT);

  digitalWrite(luzroja, HIGH); //señal de no avanzar encendida
  digitalWrite(luzverde, LOW); //señal de avanzar apagada
  digitalWrite(bomba, LOW); //bomba de agua apagada  
}

void loop() {

  switch (estado)
  {
case 0:   
  if (Serial.available() > 0) {
    char comando = Serial.read();
    if (comando == 'ON') {
      digitalWrite(ledPin, HIGH);
      estado = 1;
    } else  {
      digitalWrite(ledPin, LOW);
      estado = 0;
    }
  }
break;

case 1:
  digitalWrite(13, HIGH); //conexión python-arduino lista
  digitalWrite(luzroja, HIGH); //señal de no avanzar encendida
  digitalWrite(luzverde, LOW); //señal de avanzar apagada
  digitalWrite(bomba, LOW); //bomba de agua apagada  
break;

}
}
