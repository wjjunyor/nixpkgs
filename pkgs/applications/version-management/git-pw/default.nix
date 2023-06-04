{ lib
, git
, python3
, fetchFromGitHub
}:

python3.pkgs.buildPythonApplication rec {
  pname = "git-pw";
  version = "2.5.0";

  PBR_VERSION = version;

  src = fetchFromGitHub {
    owner = "getpatchwork";
    repo = "git-pw";
    rev = version;
    hash = "sha256-MUothqfdDALKpHzFy5O67vAfbyZOa11YuWRsvpwrSPY=";
  };

  propagatedBuildInputs = with python3.pkgs; [
    pyyaml
    arrow
    click
    requests
    tabulate
    pbr
  ];

  nativeCheckInputs = with python3.pkgs; [
    pytest
    pytest-cov
    git
  ];

  pythonImportsCheck = [ "git_pw" ];

  meta = with lib; {
    description = "A tool for integrating Git with Patchwork, the web-based patch tracking system";
    homepage = "https://github.com/getpatchwork/git-pw";
    license = licenses.mit;
    maintainers = with maintainers; [ raitobezarius ];
  };
}
