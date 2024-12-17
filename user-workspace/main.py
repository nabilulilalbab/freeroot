import requests
import time
import random

# URL yang ingin dikunjungi
url = 'https://www.example.com'

# Header dengan User-Agent untuk meniru browser manusia
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
}

# Loop untuk mengunjungi website secara periodik
while True:
    # Melakukan GET request dengan header yang disesuaikan
    response = requests.get(url, headers=headers)
    
    # Menampilkan status dan sebagian konten dari halaman
    print(f"Status Code: {response.status_code}")
    print(response.text[:500])  # Menampilkan 500 karakter pertama dari halaman

    # Menunggu antara 10 hingga 15 menit (600 hingga 900 detik)
    wait_time = random.randint(600, 900)
    print(f"Waiting for {wait_time} seconds...")
    time.sleep(wait_time)  # Tidur untuk interval acak
