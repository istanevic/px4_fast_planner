#!/bin/bash

CATKIN_WS=${HOME}/catkin_ws
CATKIN_SRC=${HOME}/catkin_ws/src

# catkin config --merge-devel
# catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release
# install MAVROS

####################################### mavros_controllers setup #######################################
echo -e "\e[1;33m Adding mavros_controllers \e[0m"
#Adding mavros_controllers
if [ ! -d "$CATKIN_SRC/mavros_controllers" ]; then
    echo "Cloning the mavros_controllers repo ..."
    cd $CATKIN_SRC
    git clone https://github.com/Jaeyoung-Lim/mavros_controllers.git
    cd ../
else
    echo "mavros_controllers already exists. Just pulling ..."
    cd $CATKIN_SRC/mavros_controllers
    git pull
    cd ../ 
fi

#Adding catkin_simple
if [ ! -d "$CATKIN_SRC/catkin_simple" ]; then
    echo "Cloning the catkin_simple repo ..."
    cd $CATKIN_SRC
    git clone https://github.com/catkin/catkin_simple
    cd ../
else
    echo "catkin_simple already exists. Just pulling ..."
    cd $CATKIN_SRC/catkin_simple
    git pull
    cd ../ 
fi

#Adding eigen_catkin
if [ ! -d "$CATKIN_SRC/eigen_catkin" ]; then
    echo "Cloning the eigen_catkin repo ..."
    cd $CATKIN_SRC
    git clone https://github.com/ethz-asl/eigen_catkin
    cd ../
else
    echo "eigen_catkin already exists. Just pulling ..."
    cd $CATKIN_SRC/eigen_catkin
    git pull
    cd ../ 
fi

#Adding mav_comm
if [ ! -d "$CATKIN_SRC/mav_comm" ]; then
    echo "Cloning the mav_comm repo ..."
    cd $CATKIN_SRC
    git clone https://github.com/ethz-asl/mav_comm
    cd ../
else
    echo "mav_comm already exists. Just pulling ..."
    cd $CATKIN_SRC/mav_comm
    git pull
    cd ../ 
fi


####################################### Fast-planner setup #######################################
echo -e "\e[1;33m Adding Fast-Planner \e[0m"
# Required for Fast-Planner
sudo apt install ros-melodic-nlopt libarmadillo-dev -y

#Adding Fast-Planner
if [ ! -d "$CATKIN_SRC/Fast-Planner" ]; then
    echo "Cloning the Fast-Planner repo ..."
    cd $CATKIN_SRC
    git clone https://github.com/mzahana/Fast-Planner.git
    cd ../
else
    echo "Fast-Planner already exists. Just pulling ..."
    cd $CATKIN_SRC/Fast-Planner
    git pull
    cd ../ 
fi

# Checkout ROS Mellodic branch 
cd $CATKIN_SRC/Fast-Planner
git checkout changes_for_ros_melodic

####################################### Building catkin_ws #######################################
cd $CATKIN_WS
catkin build multi_map_server
catkin build
source $CATKIN_WS/devel/setup.bash