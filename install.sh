#!/bin/bash
# dji2note CLI 설치 (Apple Silicon Mac) — Made by Baryon Labs
#   curl -fsSL https://voice2.baryon.ai/install.sh | bash
set -euo pipefail

say() { printf "\033[1;34m==>\033[0m %s\n" "$*"; }
die() { printf "\033[1;31m오류:\033[0m %s\n" "$*" >&2; exit 1; }

[ "$(uname -s)" = "Darwin" ] || die "macOS 전용입니다."
[ "$(uname -m)" = "arm64" ] || die "Apple Silicon(M1 이상) Mac이 필요합니다."

# 최신 릴리스의 엔진 파일(.whl)
WHL="${DJI2NOTE_WHEEL:-$(curl -fsSL https://api.github.com/repos/baryonlabs/voice2-releases/releases/latest \
  | grep -o '"browser_download_url": *"[^"]*\.whl"' | head -1 | cut -d'"' -f4)}"
[ -n "$WHL" ] || die "최신 릴리스에서 엔진 파일을 찾지 못했습니다."

# uv (Python 도구 설치기)
if ! command -v uv >/dev/null 2>&1; then
  say "uv 설치"
  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"
fi

say "dji2note 설치 ($(basename "$WHL"))"
uv tool install --force --python 3.12 "$WHL"
uv tool update-shell >/dev/null 2>&1 || true
export PATH="$HOME/.local/bin:$PATH"

say "ffmpeg·rclone 준비 (Homebrew 불필요)"
dji2note setup-tools

say "설치 완료. 설정 마법사를 시작합니다."
dji2note init </dev/tty
