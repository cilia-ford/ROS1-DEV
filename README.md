add a readme
add ros2-devcontaioner like admiring samples ,
add about windows, codespaces, and linux support, 
explain the setup , ssh , docker build workflow, and so on .... 
explain the .env file things and everything else etc ...
also explain ( yet to be added ) build tasks configurations... 
might also wanna add linting and batches for verifing features...


# EPs:

- ~~EP01 get and update deps using rosdep .~~
- ~~EP06 use prebuild docker image in the compose ( with ep01 of this specific repo)~~ 
- ~~EP19 x11 TO USE XEPHYR~~
- ~~EP05 update the file execution permission level for the .sh files in the root of this workspace ( build , setup, test bash scripts )~~
- ~~DROPPED: EP21 tasks not opening inside devcontainer using keybindings ctrl + ;~~
- ~~EP18 workspace ownership needs to be updated~~
- ~~EP02 post-create-script.sh make it inline file if possible~~ 
- ~~EP11 mount /dev as devices instead of volumes add that so it is working if devices are present in local devcontainers or in the remote codespace~~
- ~~DROPPED : EP16 add username uid and gid from the devcontainer, however much that is possible... and care for that the packages generated from ros2 pkg use the system username as the maintainer name :: WILL BE CARED ABOUT IN TEMPLATING~~
- ~~DROPPED : EP09 use a mock package to have the dev dependencies and once its been to prod , we can do something like colcon_ignore inside the dir. :: EVERYTHING FOR DEVELOPMENT WILL BE IN DEVCONTAINER~~
- ~~EP07 guess need to chown -r developer /tmp in post-start.script~~


- ~~DROPPED : EP10 need a add an additional file that will be sourced in post-scripts(one time sourceable or put in bashrc upto the user but need to provide provisions) which is for the particular project. :: DROPPING IN MERCY OF CONFIGURED TASKS~~

- EP22 add templating from rtworking group into tasks
- EP12 need to use the rosteamworkspace folder structure for development

- EP23 why not mounting everything inside of /tmp/workspace so that one can easily save the contaienr for tools and softwares and the source code remains clean outside of container.






### for later

- EP03 check and find if we can control the default location where the rosdep install python pacakges( using envs) and do multiple versions of things in one program using .dsv.in files' help // solved ; only needed in jazzy 
- EP17 colcon hooks location updated in jazzy, ( why not maintain two branch )
- EP20 RSS FEED OF github action builds of ros and other projects
- EP15 add the platformio within here 

## usbip
        - EP08 if codespace add the methods and tools if possible to connect local devices to the codespacee and create a compatible companion script 
        - EP04 also keep an eye for wsl2 development to know updates about usb integration in dev contianers

- EP14 add contributing guide (devcontainer and so) along with the above how to run with in the readme 

- EP13 give a robot start script here in the repo, for anyone to just run it and pull the build foss docker image (or probably private docker repo prompting a docker access secret to enter) 



### issues : 
- i01: configured task ( purge failed saying cannot allocate ptr in this ros-tws-shell) :: solved when not mounting /dev:/dev have to look into it
- setup-robot-description added the add_test twice in cmakelist, which causing failure of the package // it seems running init of setup-robot-description twice without removing dir is the issue..
- when templating hardware interface package the cmake cannot find some files that are of hardware interface package and related, should preinstall any necessary packages for the template to work when giving the template option :: updated:: after rosdep install deps , it is reduced to only ament_add_gmock cmake command not found  :: updated ::: adding this line solves the error ```find_package(ament_cmake_gmock REQUIRED)```


- also add .gitkeep in templated empty folder or keep the .gitkeep within the templates :: mostly it is done internally