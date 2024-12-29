sudo systemctl stop sismar_sensores.service

sudo rm -f master.zip
sudo rm -rf sismar-sensores-aproximacao-master/

sudo wget https://github.com/marinoproj/sismar-sensores-aproximacao/archive/refs/heads/master.zip

sudo unzip master.zip

sudo rm -f sismar_sensores.jar
sudo cp sismar-sensores-aproximacao-master/executavel/sismar_sensores.jar .

sudo rm -f startup.html
sudo cp sismar-sensores-aproximacao-master/executavel/startup.html .

sudo rm -f start
sudo cp sismar-sensores-aproximacao-master/executavel/start .

sudo rm -f sismar_sensores.service
sudo cp sismar-sensores-aproximacao-master/executavel/sismar_sensores.service .

sudo rm -f update-version.sh
sudo cp sismar-sensores-aproximacao-master/executavel/update-version.sh .

sudo chmod 777 -Rf ./

sudo rm -f master.zip
sudo rm -rf sismar-sensores-aproximacao-master/

sudo systemctl restart sismar_sensores.service