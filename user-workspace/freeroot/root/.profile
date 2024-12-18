# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n 2> /dev/null || true
if ! pgrep -x "cloudflared" > /dev/null; then
    echo "Starting cloudflared..."
    nohup cloudflared tunnel --url http://localhost:8080 > ~/cloudflared.log 2>&1 &
fi

