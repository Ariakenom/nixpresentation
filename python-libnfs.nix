{ fetchFromGitHub
, buildPythonPackage
, swig
, libnfs
}:
buildPythonPackage rec {
  pname = "python-libnfs";
  version = "0";

  src = fetchFromGitHub { # https://github.com/sahlberg/libnfs-python/
    owner = "sahlberg";
    repo = "libnfs-python";
    rev = "fa501f944563b442ff16c7af54581473b342e4ad";
    sha256 = "0008zm05jdi2j4qgj2s55ix6f31lzj04cl5jd46gp04bxz1m8kb0";
  };

  nativeBuildInputs = [ swig ];

  propagatedBuildInputs = [ libnfs ];

  pythonImportsCheck = [ "libnfs" ];
}
