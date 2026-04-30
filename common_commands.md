# Common Commands

## The Rust Programming Language
`rustup doc --book`

## Disabling Address-Space Randomization temporarily (learned from OSTEP + StackOverflow)

```bash
setarch `uname -m` -R ./myProgram
```
Aliased to: `random_off`

## How to List Running Jobs
`list jobs`

## How to kill a running job
`kill %1`
### multiple jobs
`kill %1 %2 %3 ...`

## How to `echo` string without `\n` character:
`echo -n "some text"`

## ROS2 Specific

### Sourcing the environment
`jazzy`
`humble`
`export ROS_DOMAIN_ID=0`

## Running DistroBox for Container (Ubuntu 22)
`distrobox enter roboracer-env`

