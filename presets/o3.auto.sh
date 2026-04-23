#!/system/bin/sh

# 1. Add write permissions to the frequency files
chmod 666 /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
chmod 666 /sys/devices/system/cpu/cpufreq/policy6/scaling_max_freq

# 2. Start the services that override CPU settings
start vendor.perf-hal-1-0
start vendor.perf-hal-2-0
start perfd

# 3. Reset permissions on frequency files (Return to standard system control)
chmod 644 /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpufreq/policy6/scaling_max_freq

echo "CPU Preset: Auto"