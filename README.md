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
- ~~EP05 update the file execution permission level for the .sh files in the root of this workspace ( build , setup, test bash scripts )~~
- EP04 also keep an eye for wsl2 development to know updates about usb integration in dev contianers
- EP08 if codespace add the methods and tools if possible to connect local devices to the codespacee and create a compatible companion script 
- EP09 use a mock package to have the dev dependencies and once its been to prod , we can do something like colcon_ignore inside the dir.
- EP10 need a add an additional file that will be sourced in post-scripts(one time sourceable or put in bashrc upto the user but need to provide provisions) which is for the particular project.
- EP02 post-create-script.sh make it inline file if possible 
- EP11 mount /dev as devices instead of volumes add that so it is working if devices are present in local devcontainers or in the remote codespace
- EP12 need to use the rosteamworkspace folder structure for development
- EP13 give a robot start script here in the repo, for anyone to just run it and pull the build foss docker image (or probably private docker repo prompting a docker access secret to enter) 
- EP14 add contributing guide (devcontainer and so) along with the above how to run with in the readme 
- EP15 add the platformio within here 
- EP17 colcon hooks location updated in jazzy, ( why not maintain two branch )
- EP18 workspace ownership needs to be updated
- EP20 RSS FEED OF github action builds of ros and other projects
- EP21 tasks not opening inside devcontainer using keybindings ctrl + ;
- EP22 add templating from rtworking group into tasks
- EP23 why not mounting everything inside of /tmp/workspace so that one can easily save the contaienr for tools and softwares and the source code remains clean outside of container.



- EP19 x11 TO USE XEPHYR
- EP16 add username uid and gid from the devcontainer, however much that is possible... and care for that the packages generated from ros2 pkg use the system username as the maintainer name
- EP07 guess need to chown -r developer /tmp in post-start.script





- EP03 check and find if we can control the default location where the rosdep install python pacakges( using envs) and do multiple versions of things in one program using .dsv.in files' help // solved ; only needed in jazzy 