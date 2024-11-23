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

By default, PowerShell may block script execution for security reasons. To enable script execution:

`Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned`

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
Fetching page 1: https://nhentai.net/search/?q=ibuki+no+gotoku&page=1
Fetching page 2: https://nhentai.net/search/?q=ibuki+no+gotoku&page=2
No codes found on page 2. Stopping iteration.
Retrieved 5 Codes:
404504
400813
256016
201866
4311
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
