# <a>
# import b
# f x
# with c

with import <nixpkgs> {};

# let a=b in c

let
    # AAAAAAAH!
    pythonWithPackages = python3.withPackages (p: [
        (p.callPackage ./python-libnfs.nix {})
    ]);
in
mkShell {
    buildInputs = [ pythonWithPackages ];
}
