{ lib
, python3Packages
}:

with python3Packages;

buildPythonApplication rec {
  pname = "miniplayer";
  version = "1.7.3";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-GxbsDIZ5LvxMqbDC81rerrk0mn94qHlX1uxrNL+vxSU=";
  };

  propagatedBuildInputs = [
    colorthief
    ffmpeg-python
    mpd2
    pillow
    pixcat
    requests
    ueberzug
  ];

  # pythonImportsCheck is disabled because this package doesn't expose any modules.

  meta = with lib; {
    description = "A curses-based MPD client with basic functionality that can also display an album art";
    homepage = "https://github.com/GuardKenzie/miniplayer";
    license = licenses.mit;
    maintainers = with maintainers; [ azahi ];
  };
}
