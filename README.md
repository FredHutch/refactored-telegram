# awsbatch

wrapper for AWS batch service.

`awsbatch <file>`

Where `file` is a path to a script on the local file system.  `awsbatch` will
start an AWS Batch job and run that script in the Batch container.

`awsbatch` will honor some "#SBATCH" declarations in the script.

`awsbatchd <uri>`

A pseudo-daemon that will run the script indicated at `<URI>`. Executed by docker as the CMD argument.

This agent sets up the node, mounting necessary file systems, gathering resources, configuring the environment, and performing any tear-down operations.

> _NOTE:_ Many of these functions are merely dreams at the moment and won't be available until well into the 1.x release.

This agent is necessary as running multiple command inside the docker
environment is not robust: the strings become very complicated and subject to
error.  This agent allows a certain amount of standardization, ensuring that
certain steps are performed before the client script is run

Services provided by `awsbatchd` are available to the client script by adding comments at the beginning of the script that start with "#AWSBATCH"

`#AWSBATCH load <uri> <path>`

Load data from <uri> onto <path> in the local system

`#AWSBATCH unload <path> <uri>`

After the script is complete, move data from `<path>` to `<uri>`

`#AWSBATCH mount <source> <dest> <options>`

Mount NFS filesystem `<source>` on mount point `<dest>` with options `<options>`


