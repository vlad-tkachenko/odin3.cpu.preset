#!/system/bin/sh

# This script should be executed on the device

echo "Policy 0 Available Frequencies:"
cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies > /sdcard/Download/p0.txt

echo "Policy 6 Available Frequencies:"
cat /sys/devices/system/cpu/cpufreq/policy6/scaling_available_frequencies > /sdcard/Download/p6.txt