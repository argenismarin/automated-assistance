import os
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys
from time import sleep
import pandas as pd
# Obtener la ruta absoluta del directorio actual del script
current_directory = os.path.dirname(os.path.abspath(__file__))
excel_file_path = os.path.join(current_directory, 'Datos.xlsx')
# Configuración del perfil de Firefox
options = webdriver.FirefoxOptions()
options.add_argument("-profile")
options.add_argument(r'C:\Users\argem\AppData\Roaming\Mozilla\Firefox\Profiles\dah6bdh7.Argenis')
# Leer datos desde el archivo Excel usando la ruta absoluta
try:
    archivo = pd.read_excel(excel_file_path)
    numero = archivo['Numero']
    tipo = archivo['Tipo']
except FileNotFoundError:
    print(f"El archivo 'Datos.xlsx' no se encontró en {excel_file_path}.")
    exit()
# Inicializar el navegador de Firefox con las opciones configuradas
driver = webdriver.Firefox(options=options)
driver.get('https://docs.google.com/forms/d/e/1FAIpQLSeZVkmPN5-me2yfopPQ1448zMzjGboz7CZjd9fgcHQmwpU0IQ/viewform?pli=1')
# Pausa para permitir interacción manual antes de continuar
input('Presiona enter para continuar')
# Automatización del formulario
for i in range(len(numero)):
    try:
        # Hacer clic en el primer elemento del formulario
        driver.find_element(By.XPATH, 
            value='/html/body/div/div[2]/form/div[2]/div/div[2]/div[1]/div[1]/label/div/div[2]/div/span').click()
        # Rellenar el número
        numero_input = driver.find_element(By.XPATH, 
            value='/html/body/div[1]/div[2]/form/div[2]/div/div[2]/div[3]/div/div/div[2]/div/div[1]/div/div[1]/input')
        numero_input.send_keys(str(numero[i]))
        # Rellenar el nombre
        nombre_input = driver.find_element(By.XPATH, 
            value='/html/body/div[1]/div[2]/form/div[2]/div/div[2]/div[4]/div/div/div[2]/div/div[1]/div[1]/div[1]')
        nombre_input.send_keys('Jenifer Karina Guitierrez Araque')
        # Seleccionar la opción dependiendo del tipo
        if tipo[i] == 'Tutoría con cita':
            driver.find_element(By.XPATH, value='//*[@id="i23"]').click()
            sleep(5)
        else:
            driver.find_element(By.XPATH, value='//*[@id="i26"]').click()
            sleep(5)
        # Seleccionar "Asiste con frecuencia a las tutorías"
        driver.find_element(By.XPATH, value='//*[@id="i37"]').click()
        sleep(5)
        # Hacer clic en "Enviar"
        driver.find_element(By.XPATH,
            value='/html/body/div[1]/div[2]/form/div[2]/div/div[3]/div[1]/div[1]/div/span').click()
            #Pausa para evitar ser bloqueado por la página
        sleep(10)
    except Exception as e:
        print(f"Error en la iteración {i}: {e}")
# Cerrar el navegador al finalizar
print("Cerrando el navegador...")
driver.quit()
