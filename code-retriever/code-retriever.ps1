# Define a function to fetch nhentai codes
function Fetch-NhentaiCodes {
    param (
        [string]$SearchQuery,
        [int]$MaxPages,
        [float]$Delay
    )

    $BaseUrl = "https://nhentai.net/search/?q="  # Base URL
    $Headers = @{
        "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
    }

    $AllCodes = @()

    # Format the query by replacing spaces with '+'
    $FormattedQuery = $SearchQuery -replace ' ', '+'

    # Loop through the pages
    for ($Page = 1; $Page -le $MaxPages; $Page++) {
        $SearchUrl = "$BaseUrl$FormattedQuery&page=$Page"  # Correctly construct the URL
        Write-Host ("Fetching page {0}: {1}" -f $Page, $SearchUrl)

        # Send the GET request
        try {
            $Response = Invoke-WebRequest -Uri $SearchUrl -Headers $Headers -ErrorAction Stop
        } catch {
            Write-Host ("Failed to fetch page {0}. Error: {1}" -f $Page, $_.Exception.Message)
            break
        }

        # Parse the HTML content
        $HtmlContent = $Response.Content
        $GalleryMatches = Select-String -InputObject $HtmlContent -Pattern '/g/(\d+)/' -AllMatches

        # Extract gallery numeric codes
        $Codes = @()
        foreach ($Match in $GalleryMatches.Matches) {
            $Code = $Match.Groups[1].Value
            $Codes += $Code
        }

        # Stop if no codes are found
        if ($Codes.Count -eq 0) {
            Write-Host ("No codes found on page {0}. Stopping iteration." -f $Page)
            break
        }

        # Add to the overall list
        $AllCodes += $Codes

        # Delay to avoid overloading the server
        Start-Sleep -Seconds $Delay
    }

    return $AllCodes
}

# Main execution
Write-Host "Enter the title or keywords for your search:"
$SearchQuery = Read-Host
if (-not $SearchQuery) {
    Write-Host "No search query entered. Exiting."
    exit
}

try {
    Write-Host "How many pages do you want to scrape?"
    $MaxPagesToScrape = [int](Read-Host)
    Write-Host "Enter delay (in seconds) between requests:"
    $DelayBetweenRequests = [float](Read-Host)
} catch {
    Write-Host "Invalid input. Please enter valid numbers."
    exit
}

# Fetch the codes
$Results = Fetch-NhentaiCodes -SearchQuery $SearchQuery -MaxPages $MaxPagesToScrape -Delay $DelayBetweenRequests

# Print the results
if ($Results.Count -gt 0) {
    Write-Host ("Retrieved {0} Codes:" -f $Results.Count)
    $Results | ForEach-Object { Write-Host $_ }
} else {
    Write-Host "No results found or failed to fetch codes."
}
