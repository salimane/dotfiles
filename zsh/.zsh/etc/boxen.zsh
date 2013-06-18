if [[ -f /opt/boxen/env.sh ]]; then
  source /opt/boxen/env.sh
fi
if [[ -f /opt/boxen/repo/script ]]; then
  export PATH="$PATH:/opt/boxen/repo/script"
fi
