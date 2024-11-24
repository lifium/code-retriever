import requests
from bs4 import BeautifulSoup
import time

def fetch_nhentai_codes(search_query, max_pages, delay):
    """
    Fetches numeric codes from the search results on nhentai.net for a given query.
    
    :param search_query: A string containing the search query (e.g., 'ibuki no gotoku').
    :param max_pages: The maximum number of pages to scrape.
    :param delay: Delay in seconds between requests to avoid overloading the server.
    :return: A list of numeric codes extracted from the search results.
    """
    # Base URL for search
    base_url = "https://nhentai.net/search/"
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
    }

    all_codes = []

    # Replace spaces with '+' in the search query
    formatted_query = search_query.replace(" ", "+")

    # Iterate through pages
    for page in range(1, max_pages + 1):
        # Construct the page URL
        search_url = f"{base_url}?q={formatted_query}&page={page}"
        print(f"Fetching page {page}: {search_url}")

        # Send the GET request
        response = requests.get(search_url, headers=headers)

        # Check if the request was successful
        if response.status_code != 200:
            print(f"Failed to fetch page {page}. Status code: {response.status_code}")
            break

        # Parse the HTML content
        soup = BeautifulSoup(response.text, 'html.parser')

        # Extract gallery links and their numeric codes
        codes = []
        for a_tag in soup.select('.gallery a'):
            href = a_tag.get('href')
            if href:
                # Extract the numeric part from the URL (e.g., "/g/123456/" → "123456")
                code = href.split('/')[2]
                codes.append(code)

        # Stop if no codes are found (likely the last page)
        if not codes:
            print(f"No codes found on page {page}. Stopping iteration.")
            break

        # Add codes to the master list
        all_codes.extend(codes)

        # Respectful delay to avoid overloading the server
        time.sleep(delay)

    return all_codes

if __name__ == "__main__":
    # Get the search query from the user
    search_query = input("Enter the title or keywords for your search: ").strip()
    if not search_query:
        print("No search query entered. Exiting.")
    else:
        # Prompt the user for dynamic parameters
        try:
            max_pages_to_scrape = int(input("How many pages do you want to scrape? "))
            delay_between_requests = float(input("Enter delay (in seconds) between requests: "))
        except ValueError:
            print("Invalid input. Please enter valid numbers.")
            exit()

        # Fetch the numeric codes
        results = fetch_nhentai_codes(search_query, max_pages_to_scrape, delay_between_requests)

        # Print the retrieved codes
        if results:
            print(f"Retrieved {len(results)} Codes:")
            for code in results:
                print(code)
        else:
            print("No results found or failed to fetch codes.")

