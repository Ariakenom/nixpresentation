with import <nixpkgs> {};

# python3Packages.buildPythonPackage
stdenv.mkDerivation
rec {
  pname = "python-libnfs";
  version = "0";

  src = fetchFromGitHub { # https://github.com/sahlberg/libnfs-python/
    owner = "sahlberg";
    repo = "libnfs-python";
    rev = "fa501f944563b442ff16c7af54581473b342e4ad";
    sha256 = "0008zm05jdi2j4qgj2s55ix6f31lzj04cl5jd46gp04bxz1m8kb0";
  };

  buildInputs = [ ncurses swig python3 ];
  propagatedBuildInputs = [ libnfs ];

  buildPhase = ''
    cd  libnfs
    make
    cd ..
  '';
  installPhase = ''
    python3 setup.py install
  '';

}