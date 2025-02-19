import os
import requests
from bs4 import BeautifulSoup
import markdownify
from urllib.parse import urljoin

def download_image(image_url, output_dir):
    """Download an image and save it to the specified directory."""
    try:
        response = requests.get(image_url, stream=True)
        response.raise_for_status()
        image_name = os.path.basename(image_url)
        image_path = os.path.join(output_dir, image_name)
        with open(image_path, 'wb') as image_file:
            for chunk in response.iter_content(chunk_size=8192):
                image_file.write(chunk)
        return image_name
    except Exception as e:
        print(f"Failed to download image {image_url}: {e}")
        return None

def convert_to_markdown(url, output_path, name,selector=None):
    """Convert a web page to markdown and save images in the same directory."""
    try:
        # Fetch the web page
        response = requests.get(url)
        response.raise_for_status()
        soup = BeautifulSoup(response.content, 'lxml')

        # Select the element to convert
        if selector:
            element = soup.select_one(selector)
            if not element:
                raise ValueError(f"No element found with selector: {selector}")
        else:
            element = soup.body


        # Create the output directory if it doesn't exist
        output_dir = output_path+'/'+name
        os.makedirs(output_dir, exist_ok=True)

        # Download images and replace image URLs in the markdown
        for img in element.find_all('img'):
            img_url = img.get('src')
            if img_url:
                full_img_url = urljoin(url, img_url)
                image_name = download_image(full_img_url, output_dir)
                if image_name:
                    img['src'] = name+'/'+image_name

        # Convert the element to markdown
        markdown_text = markdownify.markdownify(str(element), heading_style="ATX")
        # Save the markdown file
        with open(output_path+'/'+name+".md", 'w', encoding='utf-8') as md_file:
            md_file.write(markdown_text)

        print(f"Markdown saved to {output_path}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    # Example usage
    url = "https://hive.blog/bitshares/@ihashfury/run-your-own-decentralised-exchange"
    output_path = "docs/docs/docs/nodes"
    name="Guide-to-setup-personal-nodes"
    selector = ".App__content"  # Optional: specify a CSS selector

    convert_to_markdown(url, output_path, name, selector)


    url='https://hive.blog/bitshares/@ihashfury/distributed-access-to-the-bitshares-decentralised-exchange'
    output_path = "docs/docs/docs/nodes"
    name="distributed-access-to-the-bitshares-decentralised-exchange"
    selector = ".App__content"  # Optional: specify a CSS selector

    convert_to_markdown(url, output_path, name, selector)
