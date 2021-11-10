#! /bin/env nix-shell
#! nix-shell --pure default.nix -i python3

# nix shebang - Define your dependencies in the file!
# Create a shell specified by default.nix and then run a "chained script interpreter" using "-i".

import libnfs

# "--pure" means we do dont inherit the environment into the shell
# useful for making sure you specified all dependencies.
import os
os.system('less')  # will fail!




