
#!/bin/bash
while true; do
  curl -s https://<your-vscode-url> > /dev/null
  sleep 300  # Simulasi setiap 5 menit
done

