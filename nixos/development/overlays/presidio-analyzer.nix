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
        presidio-analyzer = pythonFinal.buildPythonPackage {
          pname = "presidio-analyzer";
          version = "2.2.360";
          format = "wheel";

          src = prev.fetchurl {
            url = "https://files.pythonhosted.org/packages/04/dd/df0d00ff44977868878f391b08feb65b8269904262d0f1387de827c13c7d/presidio_analyzer-2.2.360-py3-none-any.whl";
            sha256 = "sha256-qm6Dd5uPI1hwAMz6PvR6o0NWpgtRKEdC4NKpazMgXE4=";
          };

          propagatedBuildInputs = with pythonFinal; [
            spacy
            regex
            pyyaml
            tqdm
            phonenumbers
            cryptography
            tldextract
          ];

          doCheck = false;

          pythonImportsCheck = ["presidio_analyzer"];

          meta = with prev.lib; {
            description = "Context based, pluggable and customizable PII anonymization service for text and images";
            homepage = "https://github.com/microsoft/presidio";
            license = licenses.mit;
            maintainers = [];
          };
        };
      };
  });

  python3Packages = final.python3.pkgs;
}
