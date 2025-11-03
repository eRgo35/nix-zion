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
        presidio-anonymizer = pythonFinal.buildPythonPackage {
          pname = "presidio-anonymizer";
          version = "2.2.360";
          format = "wheel";

          src = prev.fetchurl {
            url = "https://files.pythonhosted.org/packages/f0/79/d8438168402057092a36ba8f7aee099f107a7960a38eee505f1948f9e0c9/presidio_anonymizer-2.2.360-py3-none-any.whl";
            sha256 = "sha256-X0bza/OguIF7kfCe0+UQk8wzEZLhSDEfHNaa4L8/Smw=";
          };

          propagatedBuildInputs = with pythonFinal; [
            cryptography
            flask
            pydantic
          ];

          doCheck = false;

          pythonImportsCheck = ["presidio_anonymizer"];
        };
      };
  });

  python3Packages = final.python3.pkgs;
}
