final: prev: {
  fbjson2table = prev.python3Packages.buildPythonPackage rec {
    pname = "fbjson2table";
    version = "1.2.0";

    src = prev.fetchPypi {
      inherit pname version;
      hash = "sha256-qODeA0ncIRemXpcpyh8kkC+41a5dMkzxM2wguyQ5KXM=";
    };

    pyproject = true;

    doCheck = false;

    build-system = with prev.python3Packages; [
      setuptools
    ];

    dependencies = with prev.python3Packages; [
      pandas
    ];
  };
}
