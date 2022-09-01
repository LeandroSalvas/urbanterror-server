#image used
FROM ubuntu:22.04

#creating user urt
RUN useradd -ms /bin/bash urt

#set the workdirectori
WORKDIR /home/urt

#Copy files from urbanterror to image
ADD urbanterror43 /home/urt/urbanterror43

#grant permissions on /home/urt to user urt
RUN chown -R urt:urt /home/urt

#create symbolic link to config files
RUN ln -s /home/urt/urbanterror43/config/server.cfg /home/urt/urbanterror43/q3ut4/server.cfg
RUN ln -s /home/urt/urbanterror43/config/mapcycle.txt /home/urt/urbanterror43/q3ut4/mapcycle.txt

#expose port UDB
EXPOSE 27960/udp

#entrypoint
USER urt
ENTRYPOINT ["/home/urt/urbanterror43/start.sh"]
