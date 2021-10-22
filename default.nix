with import <nixpkgs> {};
let
    pythonWithPackages = python3.withPackages (p: with p; [
        p.libnfs
    ]);
in
mkShell {
    buildInputs = [ pythonWithPackages libnfs ];
}
