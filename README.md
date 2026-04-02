# 🚀 Proyecto de Digitalización Junior – Flujo Completo de Trabajo  
**Generación de datos · Limpieza · Automatización · Dashboard**

Este repositorio documenta una práctica completa que simula el trabajo real de un **Técnico Junior de Digitalización y Automatización**.

---

## 🧰 Tecnologías utilizadas
![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?logo=powershell&logoColor=white)
![Google Sheets](https://img.shields.io/badge/Google%20Sheets-34A853?logo=googlesheets&logoColor=white)
![Google Apps Script](https://img.shields.io/badge/Google%20Apps%20Script-4285F4?logo=google&logoColor=white)
![Dashboard](https://img.shields.io/badge/Dashboard-Qlik%20Style-green)

---

## 📂 Estructura del repositorio

---

## 1️⃣ Generación de Datos con PowerShell

Se generaron 20 registros ficticios de incidencias y productividad con el siguiente script:

```powershell
$departamentos = "IT","Calidad","Operaciones","RRHH"
$tecnicos = "Daniel","Lucia","Carlos","Marina","Jorge"
$registros = @()

for ($i = 1; $i -le 20; $i++) {
    $fecha = (Get-Date).AddDays(-$i)
    $dep = Get-Random $departamentos
    $incidencias = Get-Random -Minimum 5 -Maximum 50
    $tiempoMedio = Get-Random -Minimum 10 -Maximum 60
    $tec = Get-Random $tecnicos

    $registros += [PSCustomObject]@{
        Fecha              = $fecha.ToString("yyyy-MM-dd")
        Departamento       = $dep
        Incidencias        = $incidencias
        TiempoMedioMin     = $tiempoMedio
        Tecnico            = $tec
    }
}

$registros | Export-Csv -Path "./datos_incidencias.csv" -NoTypeInformation -Encoding UTF8
```

📄 **Salida generada:** `datos_incidencias.csv`

El archivo resultante contiene un registro realista de incidencias simuladas con fechas, departamentos, número de incidencias y tiempos medios.

---

## 2️⃣ Limpieza y Análisis en Google Sheets

### ✔️ Importación del CSV
El archivo `datos_incidencias.csv` se cargó en **Google Sheets** como fuente de datos inicial.

### ✔️ Ordenación y estructura
- Orden por **Fecha**  
- Normalización de columnas  
- Conversión al formato ISO (`YYYY-MM-DD`)  

### ✔️ Cálculos clave

**Totales de incidencias:**
```excel
=SUM(C2:C)
```

**Promedio de tiempo por departamento:**
```excel
=AVERAGE(FILTER(D2:D; B2:B="IT"))
```

### ✔️ Preparación para Dashboard
- Activar **filtros automáticos**  
- Alinear todas las columnas verticalmente  
- Crear un **rango limpio de datos** para los gráficos  

---

## 3️⃣ Automatización con Google Apps Script

Se implementó un script para **detectar tiempos medios altos** y resaltar automáticamente las filas afectadas.

```javascript
function revisarTiempos() {
  const hoja = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  const lastRow = hoja.getLastRow();
  const datos = hoja.getRange(2,1,lastRow-1,5).getValues();

  for (let i = 0; i < datos.length; i++) {
    const tiempo = datos[i];
    
    if (tiempo > 40) {
      hoja.getRange(i+2, 1, 1, 5).setBackground("#ff9999");

      // Opcional: enviar aviso por correo electrónico
      /*
      MailApp.sendEmail({
        to: "TU_CORREO",
        subject: "Aviso de tiempo alto",
        body: `La fila ${i+2} tiene un tiempo medio de ${tiempo} min`
      });
      */
    }
  }
}
```

📌 **Funcionalidad:**
- Marca en rojo las filas con tiempos mayores a **40 minutos**  
- (Opcional) Envío de alerta por correo electrónico  

---

## 4️⃣ Dashboard tipo Qlik en Google Sheets

El dashboard se diseñó siguiendo un estilo visual similar a **Qlik**.

### 📊 Gráfico de barras
**Incidencias por departamento**  
- Eje X → Departamento  
- Eje Y → Incidencias  

### 📈 Gráfico de líneas
**Tiempos medios por fecha**  
- Eje X → Fecha  
- Serie → TiempoMedioMin  

### 🎛️ Segmentador dinámico
Permite filtrar de forma práctica por departamento:  
- Insertar → Añadir control de filtros  
- Columna: `Departamento`  
- Afecta a todas las visualizaciones del panel  

---

## 5️⃣ Resultado Final

✅ Dashboard interactivo y limpio  
✅ Posibilidad de filtrar por departamento  
✅ Visualización inmediata de tendencias  
✅ Alertas automáticas en caso de tiempos altos  

📸 Ideal como práctica de:
- Digitalización  
- Automatización  
- Análisis de datos  
- Visualización  
- Documentación técnica  

---

## 🧠 Autor
**Tu Nombre**  
💼 Proyecto de práctica profesional – Digitalización y Automatización  
📅 Año: 2026  

---
