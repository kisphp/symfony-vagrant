https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04


After the installation of Jenkins and Docker. Add jenkins user to dockergroup (like you did)

sudo gpasswd -a jenkins docker
Edit the following file

vi /usr/lib/systemd/system/docker.service
And edit this rule to expose the API :

ExecStart=/usr/bin/docker daemon -H unix:// -H tcp://localhost:2375
Now it's time to reload and restart your Docker daemon

systemctl daemon-reload
systemctl restart docker
Then I restarted jenkins and I was able to perform docker commands as jenkins user in my jenkins jobs

sudo service jenkins restart
