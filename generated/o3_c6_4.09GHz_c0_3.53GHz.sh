#!/system/bin/sh

# Frequencies
C0=3532800
C6=4089600

stop perfd
stop vendor.perf-hal-1-0
stop vendor.perf-hal-2-0

chmod 666 /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
chmod 666 /sys/devices/system/cpu/cpufreq/policy6/scaling_max_freq

echo $C0 > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
echo $C6 > /sys/devices/system/cpu/cpufreq/policy6/scaling_max_freq

chmod 444 /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
chmod 444 /sys/devices/system/cpu/cpufreq/policy6/scaling_max_freq

echo "CPU Preset: $C0_FREQ / $C6_FREQ"
