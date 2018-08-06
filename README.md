# ar_tools [![Build Status](https://travis-ci.org/MoriKen254/ar_tools.svg?branch=w/o_artoolkit)](https://travis-ci.org/MoriKen254/ar_tools)


## Install ARToolKit as 3rd-party
```bash
https://github.com/MoriKen254/ARToolKit_Release/raw/master/ARToolKit_2.72.1_Ubuntu_amd64.deb
dpkg -i ARToolKit_2.72.1_Ubuntu_amd64.deb
```

## Create catkin workspace and get ar_tools
```bash
mkdir -p <catkin_ws>/src
cd catkin_ws/src
catkin_init_workspace
git clone -b w/o_artoolkit https://travis-ci.org/MoriKen254/ar_tools.git 

## Resolve dependencies, Build and Test
cd <catkin_ws>
rosdep update
rosdep install --from-paths src -iy
catkin build
catkin run_tests
```

