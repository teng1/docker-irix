#!/bin/bash

echo "Updating Reanimator server..." 
wget $remotedir/Reanimator/Reanimator.tgz -O - | sudo tar -xz
