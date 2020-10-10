# General instructions

You must use terminal commands only to solve all the exercises in this subject.

There are three types of questions in this project. You can identify the type of
answer expected thanks to a color code:

In blue : a command In green : a command output In red : a deduction, written in
your own words

• Create a folder for each part of this subject at the root of your repository.
These folders should be named network, system and scripts. Write your answers in
a file named after the number of the question, over two digits.

For instance :

The answer to the question 01 of the network part should be in the network/01
file.

• Hand in your scripts as executable. The part 1 “Network” must be done on
school’s Macs. The part 2 and 3, “System” and “Scripting” must be done on a
Debian virtual machine (Think about live CD debian).

# Network

1. Get the list of the network interfaces of the machine without displaying any
   detail for these interfaces. Only the list of names.

ifconfig -l

2. Identify and display the Ethernet interface characteristics: (a) Identify
    broadcast address (b) Identify all IP adresses which are part of the same
    subnet

ifconfig | grep "broadcast" | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"

arp -a

3. Identify the MAC address of the Wi-Fi card

en0..X refer to your physical network interfaces. Most new Mac devices will just
have en0 - your WiFi. en0 is the first device to start, en1 the second, etc.

4. Identify the default gateway in the routing table.

netstat -nr | grep 'default' | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"
https://td.unh.edu/TDClient/60/Portal/KB/ArticleDet?ID=784
https://www.techrepublic.com/article/understanding-routing-tables/

5. Identify the IP address of the DNS that responds to the following url:
   slash16.org

nslookup slahs16.org | grep 'Server' | grep -E -o
"([0-9]{1,3}[\.]){3}[0-9]{1,3}"
https://www.java67.com/2012/12/unix-command-to-find-ip-address-from-hostname.html

6. Get the complete path of the file that contains the IP address of the DNS
   server you’re using

/etc/resolv.conf


7. Query an external DNS server on the slash16.org domain name (ie. : google
   8.8.8.8)

nslookup slash16.org 8.8.8.8

8. Find the provider of slash16.org

AWS (amazon web services)

9. Find the external IP of 42.fr

163.172.250.12 163.172.250.13 dig +short 42.fr

10. Identify the network devices between your computer and the slash16.org
    domain

traceroute slash16.org

11. Use the output of the previous command to find the name and IP address of
    the device that makes the link between you (local network) and the outside
    world

Run traceroute slash16.org, line 1 is the local IP adress, then line 2 is the
NAT router who's remaping the local IP to a public IP pointing to dc3, the host
of our public IP..
- 1 : Local IP
- 2 : NAT IP: 10.60.1.1
- 3 : Public IP

12. Find the IP that was assigned to you by dhcp server

ifconfig en0 | grep "inet " | awk '{print $2}'

13. Thanks to the previous question and the reverse DNS find the name of your
    host

host 10.60.1.1

14. What file contains the local DNS entries?

/etc/hosts

15. Make the intra.42.fr address reroute to 46.19.122.85

sudo echo "45.19.122.85         intra.42.fr" > /etc/hosts

# System

1. In what file can you find the installed version of your Debian?
2. What command can you use to rename your system?
3. What file has to be modified to make it permanent?
4. What command gives you the time since your system was last booted?
5. Name the command that determines the state of the SSH service.
6. Name the command that reboots the SSH service.
7. Figure out the PID of the SSHD service.
8. What file contains the RSA keys of systems that are authorized to connect via
   SSH?
9. What command lets you know who is connected to the System?
10. Name the command that lists the partition tables of drives?
11. Name the command that displays the available space left and used on the
    system in an humanly understandable way
12. Figure out the exact size of each folder of /var in a humanly understandable
    way followed by the path of it.
13. Name the command that find, in real time, currently running processes
14. Run the ‘tail -f /var/log/syslog‘ command in background
15. Find the command that kills the background command’s process
16. Find the service which makes it possible to run specific tasks following a
    regular schedule
17. Find the command that allows you to connect via ssh on the VM.(In parallel
    with the graphic session)
18. Find the command that kills ssh service
19. List all services which are started at boot time and name this kind of
    services
20. List all existing users on the VM
21. List all real users on the VM
22. Find the command that add a new local user
23. Explain how connect yourself as new user. (With graphic session and ssh
    session)
24. Find the command that list all packages

# Scripting

1. Write a script which displays only the login, UID and Path of each entry of
   the /etc/passwd file.
2. Write a script which delete an ACTIVE user on the VM. 3. Three’s a Charm.
   Write a script of you choice.

# Chapter VII

Turn-in and peer-evaluation Turn in your work using your GiT repository, as
usual. Only the work that’s in your repository will be graded during the
evaluation. Do remember to pay attention to the names of the files and folders
you hand in.

Turn-in and peer-evaluation Turn in your work using your GiT repository, as
usual. Only the work that’s in your repository will be graded during the
evaluation. Do remember to pay attention to the names of the files and folders
you hand in.
