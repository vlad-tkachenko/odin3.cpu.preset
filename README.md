# Odin 3 CPU Presets

Odin 3 CPU default configuration prioritised CPU over GPU. Scripts in this repository allow to tune CPU clocks to release more power to GPU and to significantly lower CPU heat \ fan noise.

Repository contains scripts to limit CPU frequences on Odin 3 (Snapdragon 8 Elite 3)

## Instructions

- Download [repository archive](https://github.com/vlad-tkachenko/odin3.cpu.preset/archive/refs/heads/master.zip)
- Unzip folder to the desired location
- Choose performance profile on your device (to unlock GPU clocks)
- Go to Settings -> Odin Settings
- Scroll to the bottom
- Click on `Run script as root`
- Select script to run.

| Script               | Performance Cores | Efficiency Cores | Description                                                 |
| -------------------- | ----------------- | ---------------- | ----------------------------------------------------------- |
| `presets/o3.low.sh`  | 1.95GHz           | 1.99GHz          | Battery saver option                                        |
| `presets/o3.mid.sh`  | 3.07GHz           | 1.99GHz          | Generally the best choice for most situations               |
| `presets/o3.high.sh` | 4.32GHz           | 1.99GHz          | Generally works better with CPU demanding tasks (emulation) |

### Revert changes

- Run `presets/o3_auto.sh` to revert changes

OR

- Simply restart your device

### Advanced Users

Advanced users may want to have more control over the clocks, thus all possible variants are available inside `generated` folder.

File name convention: `o3_c6_[C6_FREQUENCY]_c0_[C0_FREQUENCY].sh`, where:

- `[C6_FREQUENCY]` is the frequency of performance cores
- `[C0_FREQUENCY]` is the frequency of efficiency cores

## Dev Instructions

To generate all possible combinations of presets run:

```bash
rm -rf generated/
cd scripts
bash generate.sh
```

Find possible frequencies:

- Copy `scripts/test.sh` to the device.
- Run as root script
- View `Download` folder for `p0.txt` and `p6.txt` for the frequences of `efficiency` and `performance` cores.
