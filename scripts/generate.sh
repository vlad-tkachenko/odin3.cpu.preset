#!/system/bin/sh

C0_FREQUENCIES=(384000 556800 748800 960000 1152000 1363200 1555200 1785600 1996800 2227200 2400000 2745600 2918400 3072000 3321600 3532800)
C6_FREQUENCIES=(1017600 1209600 1401600 1689600 1958400 2246400 2438400 2649600 2841600 3072000 3283200 3513600 3801600 4089600 4204800 4320000)

# Ensure the target directory exists
mkdir -p ../generated

for c6 in "${C6_FREQUENCIES[@]}"; do
    for c0 in "${C0_FREQUENCIES[@]}"; do

        # Calculate readable strings
        C0_FREQ=$(awk -v f=$c0 'BEGIN {printf "%.2fGHz", f/1000000}')
        C6_FREQ=$(awk -v f=$c6 'BEGIN {printf "%.2fGHz", f/1000000}')

        # Use 'EOF' (quoted) to prevent premature variable expansion
        cat <<'EOF' > "../generated/o3_c6_${C6_FREQ}_c0_${C0_FREQ}.sh"
#!/system/bin/sh

# Frequencies
C0=__C0_VAL__
C6=__C6_VAL__

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
EOF

        # Replace placeholders with actual values
        sed -i "s/__C0_VAL__/$c0/g" "../generated/o3_c6_${C6_FREQ}_c0_${C0_FREQ}.sh"
        sed -i "s/__C6_VAL__/$c6/g" "../generated/o3_c6_${C6_FREQ}_c0_${C0_FREQ}.sh"

        echo "Generated: o3_c6_${C6_FREQ}_c0_${C0_FREQ}.sh"
    done
done