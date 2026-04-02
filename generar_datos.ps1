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
Write-Host "CSV generado correctamente en datos_incidencias.csv"
