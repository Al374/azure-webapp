# Variables
$webAppUrl = "https://webapp-sam41513822.azurewebsites.net/"  # Replace with your web app URL
$numberOfRequests = 10000  # Adjust the number of requests as needed
$delayBetweenRequests = 0.1  # Delay in seconds between requests to control the traffic rate

# Function to generate traffic
function Generate-Traffic {
    param (
        [string]$url,
        [int]$requests,
        [float]$delay
    )

    for ($i = 0; $i -lt $requests; $i++) {
        try {
            $response = Invoke-WebRequest -Uri $url -Method GET
            Write-Output "Request $($i + 1): Status Code $($response.StatusCode)"
        }
        catch {
            Write-Output "Request $($i + 1): Failed - $($_.Exception.Message)"
        }
        Start-Sleep -Seconds $delay
    }
}

# Generate traffic
Generate-Traffic -url $webAppUrl -requests $numberOfRequests -delay $delayBetweenRequests
