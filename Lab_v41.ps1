#1 run WinRM to set the connection
winrm qc


#2 Check that you have a listening port for WinRM

#2a Wich port and Protocol do you have?

#2b Check port 88 to see if Kerberos is running

#3 Test to connect to your Server (Domain Controller)
LAB 2
1.
How can you check Services on the Remote computer?
a.
Use Invoke-command.
LAB 3
1.
Start and stop the Spooler Service on the remote server with script.
LAB 4
1.
Create one Variable that will start a Remote Session against your Server with a user credential