sudo systemctl stop sismar_sensores.service
sudo rm -f master.zip
sudo rm -rf sismar-sensores-aproximacao-master/
sudo wget https://github.com/marinoproj/sismar-sensores-aproximacao/archive/refs/heads/master.zip
sudo unzip master.zip
sudo rm sismar_sensores.jar
sudo cp sismar-sensores-aproximacao-master/executavel/sismar_sensores.jar .
sudo chmod 777 -Rf sismar_sensores.jar
sudo rm -f master.zip
sudo rm -rf sismar-sensores-aproximacao-master/
sudo systemctl restart sismar_sensores.service