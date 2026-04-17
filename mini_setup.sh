# # Install Xcode tools
# xcode-select --install
#
# # Download Target CA Bundle Cert
# curl -L http://browserconfig.target.com/tgt-certs/tgt-ca-bundle.crt -o ~/tgt-ca-bundle.crt
#
# # Install Brew and brewfile refs
# if which brew > /dev/null; then
#   echo "brew is already installed"
# else
#   curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | NONINTERACTIVE=1 bash -
# fi
# brew tap go-vela/vela
# brew tap tgt/brewhouse git@git.target.com:brew/house.git
# brew update
# brew bundle install --no-lock --verbose --file=brewfile
#
# # Install and manage Java certs
# cpe-install-java-certs
#
# # Install SDKMan, nvm, and poetry
# curl -s "https://get.sdkman.io" | bash
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# pipx install poetry
#
# # Install Colima
# /bin/bash -c "$(curl -fsSL https://binrepo.target.com/artifactory/toolshed/docker-helper-scripts/latest/colima_full_clean_install_script.command)"
