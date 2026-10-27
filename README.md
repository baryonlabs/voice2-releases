# Voice2 — 설치 파일

DJI 무선 마이크·Zoom·Mac 녹음을 받아쓰고, 화자를 나눠 회의록 요약을 만들어 Google Drive·Notion에 올려 주는 Mac·Windows 앱입니다.
**Made by Baryon Labs (바리온랩스)** · 문의 hello@baryon.ai · 소개 https://voice2.baryon.ai/

이 저장소에는 설치 파일(릴리스)만 있습니다. 최신 버전은 [Releases](../../releases/latest)에서 받으세요.

- 필요: Apple Silicon(M1 이상) Mac(macOS 14 이상) 또는 Windows 10·11 64비트
- 설치 (터미널 한 줄, 경고 없이 바로 열림):
  ```sh
  curl -fsSL https://voice2.baryon.ai/install-app.sh | bash
  ```
- 또는 DMG를 열고 앱을 Applications(또는 그 안의 Baryon 폴더)로 끌어 놓기 → 처음 열 때 「시스템 설정 → 개인정보 보호 및 보안 → 그래도 열기」
- **Windows 10·11 (64비트)**: PowerShell에 붙여 넣기 (경고 없이 설치)
  ```powershell
  irm https://voice2.baryon.ai/install.ps1 | iex
  ```
  또는 Releases의 `DJI2NoteSetup.exe` 실행 (처음엔 "Windows의 PC 보호" → 추가 정보 → 실행)
- 터미널(CLI)만 쓰려면:
  ```sh
  curl -fsSL https://voice2.baryon.ai/install.sh | bash
  ```
- 안내: [사용법](legal/HELP.md) · [데이터·AI 안내](legal/DATA.md) · [개인정보 처리방침](legal/PRIVACY.md) · [이용약관](legal/TERMS.md) · [이용 허락](LICENSE.md) · [오픈소스 고지](legal/THIRD_PARTY.md) · [저작권·상표](legal/COPYRIGHT.md)
- 문의·의견: hello@baryon.ai · Windows 버전 알림 신청은 [소개 페이지](https://voice2.baryon.ai/)에서

© 2026 Baryon Labs. All rights reserved.

---

## English

Voice2 is a Mac app that transcribes recordings from DJI wireless mics, Zoom and your Mac on-device, separates speakers, writes a summary that fits the situation with the AI you choose, and uploads it to Google Drive or Notion.
**Made by Baryon Labs** · hello@baryon.ai · https://voice2.baryon.ai/en/

This repository contains installers (releases) only. Get the latest version from [Releases](../../releases/latest).

- Requires: Apple Silicon (M1 or later) Mac, macOS 14 or later. Free.
- Install (one line in Terminal, opens without a security warning):
  ```sh
  curl -fsSL https://voice2.baryon.ai/install-app.sh | bash
  ```
- Documents: [User guide](legal/en/HELP.md) · [Data and AI notice](legal/en/DATA.md) · [Privacy policy](legal/en/PRIVACY.md) · [Terms of use](legal/en/TERMS.md) · [License](legal/en/LICENSE.md) · [Open source notices](legal/en/THIRD_PARTY.md) · [Copyright and trademarks](legal/en/COPYRIGHT.md)
- Windows version notification: sign up on the [intro page](https://voice2.baryon.ai/en/#windows)
