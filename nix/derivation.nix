{ black
, buildPythonApplication
, mergedeep
, procps
, psutil
, pytestCheckHook
, pyxdg
, tomli-w
, setuptools
}:
buildPythonApplication {
  pname = "with-alacritty";
  version = "1.0";
  pyproject = true;
  build-system = [ setuptools ];

  checkInputs = [ pytestCheckHook ];
  pytestFlagsArray = [ "--ignore=result" ];

  propagatedBuildInputs = [
    mergedeep
    psutil
    pyxdg
    tomli-w
  ];

  nativeBuildInputs = [
    black
  ];

  postPatch = ''
    substituteInPlace with_alacritty/core.py \
      --replace-fail @PS_COMMAND@ ${procps}/bin/ps
  '';

  src = ../.;
}
