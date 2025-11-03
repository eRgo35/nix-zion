final: prev: {
  python3 = prev.python3.override (old: {
    self = final.python3;
    packageOverrides = pythonFinal: pythonPrev: let
      prevOverrides =
        if old ? packageOverrides
        then old.packageOverrides pythonFinal pythonPrev
        else {};
    in
      prevOverrides
      // {
        fbjson2table = pythonFinal.buildPythonPackage rec {
          pname = "fbjson2table";
          version = "1.2.0";

          src = prev.fetchPypi {
            inherit pname version;
            hash = "sha256-qODeA0ncIRemXpcpyh8kkC+41a5dMkzxM2wguyQ5KXM=";
          };

          pyproject = true;
          doCheck = false;

          build-system = with pythonFinal; [
            setuptools
          ];

          dependencies = with pythonFinal; [
            pandas
          ];
        };
      };
  });

  python3Packages = final.python3.pkgs;
}
