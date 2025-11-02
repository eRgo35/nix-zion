final: prev: {
  vaderSentiment = prev.python3Packages.buildPythonPackage rec {
    pname = "vaderSentiment";
    version = "3.3.2";
    pyproject = true;

    src = prev.fetchPypi {
      inherit pname version;
      sha256 = "sha256-XXwG4Cf8i5kjjtsNU9lwz5cGbvl2VACYkLg3A4SWMvk=";
    };

    build-system = with prev.python3Packages; [
      setuptools
    ];

    dependencies = with prev.python3Packages; [
      pandas
      requests
    ];

    doCheck = false;
  };
}
