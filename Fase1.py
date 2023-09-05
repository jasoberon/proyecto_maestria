import serial
import time

# Configura el puerto serie
puerto = 'COM13'  # Cambiar al puerto del sistema
baud_rate = 9600
timeout = 1

try:
    arduino = serial.Serial(puerto, baud_rate, timeout=timeout)
    print(f"Conexión exitosa con {puerto}")
except serial.SerialException:
    print("No se pudo establecer la conexión con el Arduino.")
    exit()

# Espera a que Arduino se inicialice completamente
time.sleep(2)

# Envía el comando para encender el pin 13
comando_on = b'ON'
arduino.write(comando_on)
print("Comando enviado para encender el pin 13.")

# Espera 2 segundos
time.sleep(2)

# Cierra la conexión con el Arduino
arduino.close()
