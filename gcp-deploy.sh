str1=$(sudo docker ps -q)
str2=""
if [ "$str1" != "$str2" ];
then
	sudo docker stop spe_db_instance
	sudo docker rm spe_db_instance
	sudo docker rmi ubuntu:spe-database
else
	echo "no containers found building by default"
fi
sudo docker build -t ubuntu:spe-database ./SPEMT2018068-70/databaseQueries/
sudo docker run  --name spe_db_instance -p 3306:3306 -d ubuntu:spe-database
