# Proyecto de Digitalización Junior – Flujo Completo de Trabajo
Generación de datos · Limpieza · Automatización · Dashboard

Este repositorio documenta una práctica completa que simula el trabajo real de un Técnico Junior de Digitalización y Automatización.

## Contenido
- Generación de datos con PowerShell  
- Limpieza y análisis en Google Sheets  
- Automatización con Google Apps Script  
- Creación de un Dashboard interactivo tipo Qlik  

---

## Estructura del repositorio

---

## 1. Generación de Datos con PowerShell

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

**Salida:** `datos_incidencias.csv`

---

## 2. Limpieza y Análisis en Google Sheets

**Importación del CSV**  
Se cargó el archivo generado desde PowerShell.  

**Ordenación y estructura**
- Orden por fecha  
- Normalización de columnas  
- Formato de fecha ISO  

**Cálculos clave**
```excel
=SUM(C2:C)
=AVERAGE(FILTER(D2:D; B2:B="IT"))
```

**Preparación para Dashboard**
- Filtros automáticos  
- Rango limpio para gráficos  
- Columnas consistentes para eje X/Y  

---

## 3. Automatización con Google Apps Script

Script para resaltar automáticamente filas con tiempos medios mayores a 40 minutos:

```javascript
function revisarTiempos() {
  const hoja = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  const lastRow = hoja.getLastRow();
  const datos = hoja.getRange(2,1,lastRow-1,5).getValues();

  for (let i = 0; i < datos.length; i++) {
    const tiempo = datos[i];
    
    if (tiempo > 40) {
      hoja.getRange(i+2, 1, 1, 5).setBackground("#ff9999");
    }
  }
}
```

(Opcional: agregar envío de email de alerta con `MailApp.sendEmail()`)

---

## 4. Dashboard en Google Sheets

**Gráfico de barras:**  
- Eje X → Departamento  
- Eje Y → Incidencias  

**Gráfico de líneas:**  
- Eje X → Fecha  
- Serie → TiempoMedioMin  

**Segmentador dinámico:**  
Control de filtro por departamento que afecta a todos los gráficos.

---

## 5. Resultado final

Dashboard interactivo que permite:
- Filtrar por departamento  
- Analizar tendencias de tiempo medio  
- Visualizar carga de incidencias  
- Detectar valores críticos automáticamente  

Ideal como práctica de:
- Digitalización  
- Automatización  
- Análisis de datos  
- Visualización  
- Documentación técnica  
