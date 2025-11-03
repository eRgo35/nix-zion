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
        pl-core-news-lg = pythonFinal.buildPythonPackage {
          pname = "pl_core_news_lg";
          version = "3.7.0";
          format = "wheel";

          src = prev.fetchurl {
            url = "https://github.com/explosion/spacy-models/releases/download/pl_core_news_lg-3.7.0/pl_core_news_lg-3.7.0-py3-none-any.whl";
            hash = "sha256-X2042LqkCw32EnruxgcOf14kG14aPoPh9T7fpks9vA0=";
          };

          propagatedBuildInputs = with pythonFinal; [
            spacy
          ];

          doCheck = false;
          pythonImportsCheck = ["pl_core_news_lg"];
        };

        en-core-web-lg = pythonFinal.buildPythonPackage {
          pname = "en_core_web_lg";
          version = "3.7.1";
          format = "wheel";

          src = prev.fetchurl {
            url = "https://github.com/explosion/spacy-models/releases/download/en_core_web_lg-3.7.1/en_core_web_lg-3.7.1-py3-none-any.whl";
            hash = "sha256-q3Cuthcs3oJQj3c58168mRij0H3r7tY3QDyPeUuj09w=";
          };
          propagatedBuildInputs = with pythonFinal; [
            spacy
          ];

          doCheck = false;
          pythonImportsCheck = ["en_core_web_lg"];
        };
      };
  });

  python3Packages = final.python3.pkgs;
}
