{ lib, stdenv
, fetchFromGitHub
, cmake
, extra-cmake-modules
, uthash
, xcbutil
, xcbutilkeysyms
, xorgproto
}:

stdenv.mkDerivation rec {
  pname = "xcb-imdkit";
  version = "1.0.7";

  src = fetchFromGitHub {
    owner = "fcitx";
    repo = "xcb-imdkit";
    rev = version;
    sha256 = "sha256-trfKWCMIuYV0XyCcIsNP8LCTc0MYotXvslRvp76YnKU=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    xorgproto
    uthash
  ];

  buildInputs = [
    xcbutil
    xcbutilkeysyms
  ];

  meta = with lib; {
    description = "input method development support for xcb";
    homepage = "https://github.com/fcitx/xcb-imdkit";
    license = licenses.lgpl21Plus;
    maintainers = with maintainers; [ poscat ];
    platforms = platforms.linux;
  };
}
