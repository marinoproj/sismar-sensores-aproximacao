sudo rm -f master.zip
sudo rm -rf sismar-sensores-aproximacao-master/
sudo wget https://github.com/marinoproj/sismar-sensores-aproximacao/archive/refs/heads/master.zip
sudo unzip master.zip
cd sismar-sensores-aproximacao-master/
sudo chmod 777 -Rf executavel/
sudo mv executavel/ /opt/sismar_sensores
cd ..
sudo rm -f master.zip
sudo rm -rf sismar-sensores-aproximacao-master/
cd /opt/sismar_sensores
sudo cp sismar_sensores.service /etc/systemd/system/sismar_sensores.service
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable sismar_sensores.service