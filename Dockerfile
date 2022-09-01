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


#add execution permission to scritp thats init the server
RUN ls -lha /home/urt/urbanterror43

#expose port UDB
EXPOSE 27960/udp

#entrypoint
USER urt
ENTRYPOINT ["/home/urt/urbanterror43/start.sh"]
