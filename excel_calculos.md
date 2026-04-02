# Cálculos utilizados en Google Sheets

Este documento recoge todas las fórmulas aplicadas en la hoja de cálculo para análisis, limpieza y preparación del dashboard.

---

## Cálculos básicos

### Total de incidencias
```excel
=SUM(C2:C)
```

### Promedio de tiempo medio por departamento
```excel
=AVERAGE(FILTER(D2:D; B2:B="IT"))
```
