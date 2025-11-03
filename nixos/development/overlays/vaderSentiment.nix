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
        vaderSentiment = pythonFinal.buildPythonPackage rec {
          pname = "vaderSentiment";
          version = "3.3.2";

          src = prev.fetchPypi {
            inherit pname version;
            hash = "sha256-XXwG4Cf8i5kjjtsNU9lwz5cGbvl2VACYkLg3A4SWMvk=";
          };

          doCheck = false;
          pyproject = true;

          build-system = with pythonFinal; [
            setuptools
          ];

          dependencies = with pythonFinal; [
            pandas
            requests
          ];
        };
      };
  });

  python3Packages = final.python3.pkgs;
}
