#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "Adding Ubuntu Universe repository..."
apt update
apt upgrade
apt install -y software-properties-common
add-apt-repository -y universe

echo "Adding ROS 2 GPG key..."
apt update && apt install -y curl
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "Adding ROS 2 repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

echo "Updating package lists..."
apt update

echo "Upgrading system packages..."
apt upgrade -y

echo "Installing ROS 2 Humble Desktop..."
apt install -y ros-humble-desktop

echo "ROS 2 installation completed successfully!"

echo "Install UR driver"
apt install ros-humble-ur