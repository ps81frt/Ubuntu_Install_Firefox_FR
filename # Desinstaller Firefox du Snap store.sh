#! /bin/sh

# Desinstaller Firefox du Snap store

sudo snap remove firefox

# Crees un APT keyring (si elle n'exixte deja pas):

sudo install -d -m 0755 /etc/apt/keyrings

# Importer le cle mozilla

wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

# Ajout de la cle signer a sources.list:

echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

# Ont met le priorité su le packer Debian

echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla


# Installation du paquet Firefox en Francais

sudo apt update && sudo apt install firefox


# Pour voir toutes les langues disponibles
apt-cache search firefox-l10n