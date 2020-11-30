#!/usr/bin/env bash

usage()
{ 
  echo "Usage: chrome_restrictions.sh on|off"
}

if [ "$#" -eq "0" ]; then
  usage
  exit 1
else
  if [ "$1" != "on" ] && [ "$1" != "off" ]; then
    usage
    exit 4
  fi
fi

if [ "$(uname)" = "Darwin" ]; then
  if [ "$1" = "on" ]; then
    defaults write com.google.Chrome BrowserAddPersonEnabled -bool false
    defaults write com.google.Chrome BrowserGuestModeEnabled -bool false
    defaults write com.google.Chrome AllowDeletingBrowserHistory -bool false
    defaults write com.google.Chrome IncognitoModeAvailability -integer 1
    echo "policy enabled"
  else
    defaults write com.google.Chrome BrowserAddPersonEnabled -bool true
    defaults write com.google.Chrome BrowserGuestModeEnabled -bool true
    defaults write com.google.Chrome AllowDeletingBrowserHistory -bool true
    defaults write com.google.Chrome IncognitoModeAvailability -integer 0
    echo "policy disabled"
  fi
  # restart cache service
  killall cfprefsd
  echo "plist cache cleared"
elif [ "$(uname)" = "Linux" ]; then
  if [ "$1" = "on" ]; then
    cat << EOF > /tmp/policy.json
      {
      "BrowserAddPersonEnabled": false,
      "BrowserGuestModeEnabled": false,
      "AllowDeletingBrowserHistory": false,
      "IncognitoModeAvailability": 1
      }
EOF
    sudo cp /tmp/policy.json /etc/opt/chrome/policies/managed/managed_policies.json
    echo "policy enabled"
  else
    cat << EOF > /tmp/policy.json
      {
      "BrowserAddPersonEnabled": true,
      "BrowserGuestModeEnabled": true,
      "AllowDeletingBrowserHistory": true,
      "IncognitoModeAvailability": 0
      }
EOF
    sudo cp /tmp/policy.json /etc/opt/chrome/policies/managed/managed_policies.json
    echo "policy disabled"
  fi
else 
  echo "Unsupported OS"
  exit 3
fi
