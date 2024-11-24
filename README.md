# Guide: Using the Code Retriever PowerShell Script

This guide will walk you through the steps to use the code-retriever.ps1 script to scrape numeric codes from search results on nhentai.net.

## Prerequisites

1. PowerShell Installed: Ensure you have PowerShell installed on your system. Windows comes with PowerShell pre-installed.
2. Internet Access: The script requires an active internet connection to fetch search results.
3. Script File: Download the code-retriever.ps1 file and save it to a directory of your choice (e.g., C:\Users\User\code-retriever\).

## Usage Instructions

### Step 1: Open PowerShell

Press Win + R, type powershell, and press Enter to open the PowerShell terminal. Alternatively open Windows Terminal (preinstalled in Windows 11) with PowerShell profile. Navigate to the directory where the script is saved:

`cd C:\Users\User\code-retriever\`

### Step 2: Enable Script Execution

By default, PowerShell may block script execution for security reasons. To enable script execution, open PowerShell as Administrator and run:

`Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted`

- Note: You can revert this policy later using:

`Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Restricted`

### Step 3: Run the Script

Execute the script by running:

`.\code-retriever.ps1`

### Step 4: Provide Input

The script will prompt you for the following inputs:

```
Search Query: Enter the keywords or title you want to search for on nhentai.net. For example: ibuki no gotoku \ no I'm not gay I swear
Number of Pages to Scrape: Specify how many pages of results you want to scrape (e.g., 2 for the first two pages).
Delay Between Requests: Enter the delay in seconds between consecutive requests. A recommended value is 0.5 seconds to avoid overloading the server.
```

### Step 5: View Results

Once the script runs, it will:

1. Fetch the numeric codes for the search results.
2. Display the retrieved codes in the terminal.

#### Example output:

```
Enter the title or keywords for your search:
big breasts yuri harem full color
How many pages do you want to scrape?
100
Enter delay (in seconds) between requests:
0.5
Fetching page 1: https://nhentai.net/search/?q=big+breasts+yuri+harem+full+color&page=1
Fetching page 2: https://nhentai.net/search/?q=big+breasts+yuri+harem+full+color&page=2
Fetching page 3: https://nhentai.net/search/?q=big+breasts+yuri+harem+full+color&page=3
Fetching page 4: https://nhentai.net/search/?q=big+breasts+yuri+harem+full+color&page=4
No codes found on page 4. Stopping iteration.
Retrieved 63 Codes:
540232 538466 537562 536847 534437 532622 531862 531420 529266 527232 524400 523282 521560 515888 512554 506511 506240 504337 503125 502633 501759 500794 497640 494683 488164 479476 479222 469932 460596 452780 444062 441520 436707 411045 402570 394629 380769 369519 321747 318861 298765 296887 296531 284406 272344 271317 260333 256848 256678 250975 247896 244327 244326 214494 213063 211680 188746 188085 174791 172524 80035 4590 3406
```

## Troubleshooting

1. "Access Denied" Error:
        Ensure you have enabled script execution using the Set-ExecutionPolicy command in Step 2.

2. "Invalid URI" Error:
        Double-check the script to ensure the $BaseUrl is correctly set to https://nhentai.net/search?q=

3. No Results Found:
        This could mean:
            1. The search query yielded no results.
            2. The website's structure has changed, breaking the script's functionality.

#### Notes:

This script respects the website's usage terms and introduces a delay to avoid overloading the server. Avoid using it excessively.
Ensure the keywords used in the search query comply with the terms of use for nhentai.net.
Made using ChatGPT. Might not be too reliable.
