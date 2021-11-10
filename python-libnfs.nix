# x:y       is a function accepting argument x and returning y
# {a,b}:y   is a function accepting a dict with keys a and b and returning y

{ fetchFromGitHub
, buildPythonPackage
, swig
, libnfs
}:

# we call the function buildPythonPackage with a dict

buildPythonPackage {

  # the dict sets some standard package keys

  pname = "python-libnfs";
  version = "0";

  # src is the suorce code that will be made available when building

  src = fetchFromGitHub { # https://github.com/sahlberg/libnfs-python/
    owner = "sahlberg";
    repo = "libnfs-python";
    rev = "fa501f944563b442ff16c7af54581473b342e4ad";
    sha256 = "0008zm05jdi2j4qgj2s55ix6f31lzj04cl5jd46gp04bxz1m8kb0";
  };

  # We need a tool called swig to create the python ffi.
  # Native vs target refers to that we need this tool on the building side in a cross compilation 

  # TODO: explain
  # https://www.breakds.org/post/build-python-package/

  nativeBuildInputs = [ swig ];

  # TODO: explain

  buildInputs = [ libnfs ];

  # as a test: check that we can import the package

  pythonImportsCheck = [ "libnfs" ];
}
