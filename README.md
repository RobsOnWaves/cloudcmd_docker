# cloudcmd_docker
 
docker run -v $PWD/host_folder:/mnt/ls -e  "CLOUDCMD_USR=your_username" -e "CLOUDCMD_PASS=your_password" -p 8000:8000 -it --rm  robinatorondocker/cloudcmd