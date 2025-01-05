# Automated Form Filler / Rellenador Automático de Formularios

## English Section

### Features

- **Automated Form Filling:** Automatically fills and submits Google Forms with data from an Excel file.
- **Dynamic Profile Management:** A batch script to easily select and update Firefox profiles for Selenium.
- **Customizable:** Modify the scripts to suit your specific Google Forms and data requirements.
- **Dependency Installation:** The batch script installs the necessary Python libraries for the project before running the main script.

### Prerequisites

1. Python 3.7+
2. Firefox Browser
3. Geckodriver installed and added to your PATH
4. Selenium Python package (`pip install selenium`)
5. Pandas Python package (`pip install pandas`)
6. Microsoft Excel file with data (e.g., `Datos.xlsx`)

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/argenismarin/automated-assistance.git
   ```

2. Ensure your Firefox browser and profile are correctly set up.

### Usage

#### Batch Script for First-Time Setup

Before running the Python script, execute the batch script named `correr-primera-vez.bat`. This script performs the following tasks:

1. Allows you to select the desired Firefox profile by entering its corresponding number.
2. Automatically updates `main.py` with the selected profile path.
3. Installs the necessary Python dependencies, including Selenium and Pandas, by running:
   ```bash
   pip install -r requisitos.txt
   ```

To execute the script:

```bash
correr-primera-vez.bat
```

#### Python Script

1. Place your data in an Excel file named `Datos.xlsx` in the same directory as `main.py`. The Excel file should have the following structure:

| Type              | Number |
|-------------------|--------|
| Appointment Tutor | 5      |
| Open Tutoring     | 49     |
| Appointment Tutor | 147    |

2. Run the script:
   ```bash
   python main.py
   ```

3. Follow the on-screen instructions to complete the automation.

### File Structure

```
.
├── main.py               # Python script for automating Google Forms
├── correr-primera-vez.bat # Batch script for initial setup and installing dependencies
├── Datos.xlsx            # Excel file with input data
├── requirements.txt      # Python dependencies
└── README.md             # Documentation
```

### Error Handling

- If the `Datos.xlsx` file is not found, the script will notify you and terminate.
- If an error occurs during form submission, it will display the iteration number and error details.

### Notes

- Ensure the XPaths used in the script are up-to-date with the structure of your Google Form. These may need to be modified if the form changes.
- Add delays (e.g., `sleep(10)`) to prevent potential blocking by Google Forms for excessive submissions.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Contributing

Feel free to submit issues or pull requests if you'd like to contribute to this project.

---

## Sección en Español

### Características

- **Relleno Automatizado de Formularios:** Rellena y envía automáticamente formularios de Google usando un archivo Excel.
- **Gestión Dinámica de Perfiles:** Un script en batch para seleccionar y actualizar perfiles de Firefox para Selenium de manera sencilla.
- **Personalizable:** Modifica los scripts para adaptarlos a tus formularios de Google y datos específicos.
- **Instalación de Dependencias:** El script en batch instala las librerías necesarias de Python antes de ejecutar el script principal.

### Requisitos Previos

1. Python 3.7+
2. Navegador Firefox
3. Geckodriver instalado y añadido a tu PATH
4. Paquete Selenium para Python (`pip install selenium`)
5. Paquete Pandas para Python (`pip install pandas`)
6. Archivo Excel con datos (e.g., `Datos.xlsx`)

### Instalación

1. Clona este repositorio:
   ```bash
   git clone https://github.com/argenismarin/automated-assistance.git
   ```

2. Asegúrate de que tu navegador Firefox y tu perfil estén configurados correctamente.

### Uso

#### Script Batch para Configuración Inicial

Antes de ejecutar el script en Python, ejecuta el script batch llamado `correr-primera-vez.bat`. Este script realiza las siguientes tareas:

1. Te permite seleccionar el perfil de Firefox deseado ingresando su número correspondiente.
2. Actualiza automáticamente `main.py` con la ruta del perfil seleccionado.
3. Instala las dependencias necesarias de Python, incluyendo Selenium y Pandas, ejecutando:
   ```bash
   pip install -r requisitos.txt
   ```

Para ejecutar el script:

```bash
correr-primera-vez.bat
```

#### Script en Python

1. Coloca tus datos en un archivo Excel llamado `Datos.xlsx` en el mismo directorio que `main.py`. El archivo Excel debe tener la siguiente estructura:

| Tipo              | Numero |
|-------------------|--------|
| Tutoría con cita  | 5      |
| Tutoría abierta   | 49     |
| Tutoría con cita  | 147    |

2. Ejecuta el script:
   ```bash
   python main.py
   ```

3. Sigue las instrucciones en pantalla para completar la automatización.

### Estructura de Archivos

```
.
├── main.py               # Script en Python para automatizar formularios de Google
├── correr-primera-vez.bat # Script batch para configuración inicial e instalación de dependencias
├── Datos.xlsx            # Archivo Excel con datos de entrada
├── requirements.txt      # Dependencias de Python
└── README.md             # Documentación
```

### Manejo de Errores

- Si el archivo `Datos.xlsx` no se encuentra, el script te notificará y se detendrá.
- Si ocurre un error durante el envío del formulario, se mostrará el número de iteración y los detalles del error.

### Notas

- Asegúrate de que los XPaths usados en el script estén actualizados con la estructura de tu formulario de Google. Es posible que deban ser modificados si el formulario cambia.
- Agrega pausas (e.g., `sleep(10)`) para evitar bloqueos potenciales por parte de Google Forms debido a envíos excesivos.

### Licencia

Este proyecto está licenciado bajo la Licencia MIT - consulta el archivo [LICENSE](LICENSE) para más detalles.

### Contribuir

No dudes en enviar problemas o solicitudes de extracción si deseas contribuir a este proyecto.

---

¡Feliz Automatización!
