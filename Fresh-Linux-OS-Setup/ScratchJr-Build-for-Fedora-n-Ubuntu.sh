# Go to Github directory, and clone the ScratchJr-Desktop repository
    # https://github.com/jfo8000/ScratchJr-Desktop/issues/44#issuecomment-852197567

cd Github
#git clone https://github.com/leonskb4/ScratchJr-Desktop
git clone https://github.com/jfo8000/ScratchJr-Desktop

# Install Node.js and npm
sudo apt-get install -y nodejs npm
sudo dnf install -y nodejs npm

# Install ScratchJr-Desktop dependencies
cd ScratchJr-Desktop
npm install && npm run publish

# Output
This should generate *.deb/*.rpm file in out/make.

