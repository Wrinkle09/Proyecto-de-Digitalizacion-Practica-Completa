function revisarTiempos() {
  const hoja = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  const lastRow = hoja.getLastRow();
  const datos = hoja.getRange(2,1,lastRow-1,5).getValues();

  for (let i = 0; i < datos.length; i++) {
    const tiempo = datos[i][3]; // columna TiempoMedioMin
    
    if (tiempo > 40) {
      hoja.getRange(i+2, 1, 1, 5).setBackground("#ff9999");
    }
  }
}
