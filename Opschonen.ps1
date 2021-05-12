#.txt bestand naam
$txtFile = Read-Host -Prompt 'Geef de naam van het txt bestand'

#Zorg voor de juiste bestands extensie
$txtFileVuilTxt = $txtFile +".txt"
$txtFileSchoonTxt = $txtFile + " Schoon.txt"
$txtFileSchoonCsv = $txtFile + " Schoon.csv"
$txtFileVuilCSV = $txtFile + ".csv" ;

#Schrijf de input naar het scherm
Write-Host $txtFileSchoonTxt "Komt in: txt" 
Write-Host $txtFileSchoonCsv "Komt in: csv"

#CD naar de opgegeven map
Set-Location txt

#Maak van de vuile txt een vuile csv
import-csv $txtFileVuilTxt -Delimiter "`t" | export-csv $txtFileVuilCSV -NoTypeInformation

#Verplaats het csv-bestand naar de map csv
Move-Item -Path $txtFileVuilCSV -Destination 'C:\Users\Gebruiker\C Documenten\RUUD\Opschonen\csv\'

#Haal de tags weg uit het txt bestand
Get-Content $txtFileVuilTxt | %{$_ -replace "<[^>]*>",""} | Out-File $txtFileSchoonTxt

#Ga naar de csv map
Set-Location ..
Set-Location csv   

#Haal de tags weg uit het csv bestand
Get-Content $txtFileVuilCSV | %{$_ -replace "<[^>]*>",""} | Out-File $txtFileSchoonCsv

#Voorkom dat Powershell wordt afgesloten
Write-Host " "
Write-Host "Succesvol uitgevoerd!"
Read-Host
