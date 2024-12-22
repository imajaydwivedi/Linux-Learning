#!/bin/bash
# Purpose: Run basic admin task
# Modifications: 03-Sep-2024 - Initial Draft

echo Running basic admin tasks
top | head -10
echo
df -h
echo 
free -m
echo
uptime
echo
iostat
echo
echo End of the script

