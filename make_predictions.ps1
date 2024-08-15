# Set the port number
$PORT = 5000
Write-Output "Port: $PORT"

# Prepare the data payload
$data = @{
    CHAS = @{ "0" = 0 }
    RM = @{ "0" = 6.575 }
    TAX = @{ "0" = 296.0 }
    PTRATIO = @{ "0" = 15.3 }
    B = @{ "0" = 396.9 }
    LSTAT = @{ "0" = 4.98 }
} | ConvertTo-Json

# Make the POST request using Invoke-RestMethod
Invoke-RestMethod -Uri "http://localhost:$PORT/predict" -Method Post -Body $data -ContentType "application/json"
