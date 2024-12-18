#!/bin/bash

while true; do
    echo "Preventing idle timeout..." >> /dev/null
    curl -s https://khlj77.csb.app > /dev/null
    sleep 300  # Ulangi setiap 5 menit
done

