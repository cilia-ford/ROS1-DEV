# ROS2-DEV 

## Steps to Grant X11 Socket Permission:

1) Manually Grant Access:

- Run the following command on your host system to grant X11 access to the local user:
```
xhost +SI:localuser:$USER
```

2) Automate Permission on Startup:

- To avoid typing the command every time you restart your PC or laptop, you can automate this by adding it to your ~/.profile file.

- Add the following line to ~/.profile:
```
echo "xhost +SI:localuser:$USER" >> ~/.profiles
```
**NOTE:** This approach assumes that the user created inside the Docker container has the same UID as the host user. If the UID does not match, you might encounter permission issues.


## TODO

add a readme
add ros2-devcontaioner like admiring samples ,
add about windows, codespaces, and linux support, 
explain the setup , ssh , docker build workflow, and so on .... 
explain the .env file things and everything else etc ...
also explain ( yet to be added ) build tasks configurations... 
might also wanna add linting and batches for verifing features...