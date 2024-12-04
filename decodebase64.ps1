Param (
    [string]$inputText
)

if (-not $inputText) {
    $inputText = Get-Clipboard
}

try {
    $decodedText = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($inputText))
    $caption = "Dekodierter Text"
}
catch {
    $decodedText = "Fehler: Der Text ist kein gültiger Base64-String."
    $caption = "Fehler"
}

# Anzeige des dekodierten Texts in einer Dialogbox
Add-Type -AssemblyName PresentationFramework
[System.Windows.MessageBox]::Show($decodedText, $caption, "OKCancel") | Out-Null

# Option, den dekodierten Text in die Zwischenablage zu kopieren
if ($caption -eq "Dekodierter Text") {
    Set-Clipboard -Value $decodedText
}
