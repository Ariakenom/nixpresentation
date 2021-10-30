with import <nixpkgs> {};
let
    pythonWithPackages = python3.withPackages (p: [
        (p.callPackage ./python-libnfs.nix {})
    ]);
in
mkShell {
    buildInputs = [ pythonWithPackages ];
}
