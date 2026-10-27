# Data and AI notice: what is sent, where, and why

> This is a translation for convenience; the Korean version prevails in case of discrepancy.

This document lists **everything** the app sends outside your Mac. Anything not listed here is not sent.
**Recordings (audio files) are never sent anywhere.** Transcription happens on your Mac.

## 1. What Baryon Labs receives: anonymous usage stats only
| Sent | Not sent |
|---|---|
| A random install ID (not tied to any account or device), app version, macOS version | Recordings, transcripts, summaries, meeting titles, file names |
| Per-day **counts** of feature use (e.g. app launches 2, DJI recordings processed 1, summaries copied 3) | Names of people, accounts, email addresses, location |

- Only the collected counts are sent, at most once a day. After sending, the counts stored on your Mac are deleted.
- In **About → Usage stats** you can see where the data goes and exactly what is sent, word for word, and **turn it off**. Turning it off also immediately deletes counts that haven't been sent yet.
- Versions without a destination address send nothing (the About tab shows "Not set").
- Your IP address reaches the collection server as part of the connection, but it is not stored in the stats or linked to the install ID.
- Purpose: to understand which features are used and improve the app. The data is not used for any other purpose or sold to third parties.
- There are no ads or tracking.
- Exception: if you choose **Baryon AI** as your AI, the text (transcript) described in section 2 goes to the Baryon AI server and is used for transcript cleanup and summaries. It is handled as described in section 1 of the Privacy Policy.

## 2. AI (to the one service you choose, only while processing)
| What is sent | When | Why |
|---|---|---|
| Raw transcription (including timestamps, volume and channel markers), in 10-minute chunks | Transcript cleanup | Separate speakers, fix typos and spacing |
| Parts of the beginning, middle and end of the transcript (up to about 9,000 characters) | When the situation is set to "auto-detect" | Pick the situation (meeting, lecture, interview, etc.) |
| The full cleaned-up transcript, meeting name and situation | Summary | Write a summary that fits the situation |
| Zoom chat (if any, up to 20,000 characters) and participant names | Processing Zoom recordings | Match speaker names and context |

| AI | Recipient | Account |
|---|---|---|
| Claude Code | Anthropic | Your Claude subscription login |
| Codex | OpenAI | Your ChatGPT login |
| Anthropic · OpenAI · Gemini API | Each company | Your API key |
| Baryon AI | Baryon Labs server | A key issued by Baryon Labs |
| None | Nobody | — |

- How each company handles what it receives (retention period, whether it is used for training) depends on that company's terms and your account settings. For work meetings, choose an AI your organization allows.
- Transcripts and summaries written by AI can be wrong. Check important decisions, numbers and names against the original.

## 3. Connections you turn on (using your own accounts and tokens)
| Connection | What is sent |
|---|---|
| Google Drive | Summary and transcript documents to your Drive folder (via rclone, with the account you logged in with) |
| Notion | Summary and transcript pages to the page you chose (with your integration token) |
| Zoom cloud API (advanced) | Listing and downloading recordings (with a Zoom app key you created) |
| Share notes (MCP) | While enabled, programs holding the token can connect to this Mac and fetch summaries, transcripts and meeting information. It is not reachable outside the same network or Tailscale unless you open it up yourself |

## 4. Update check
Once a day the app asks GitHub (the public repository baryonlabs/voice2-releases) for the latest version. Only an ordinary web request is made; no meeting content or install ID is sent. When you install a new version, the app verifies the downloaded file's checksum and the developer signature (Baryon Labs) before replacing the old version.

## 5. Downloads during installation and setup
| What is downloaded | From |
|---|---|
| uv (installer), Python, Python libraries | GitHub (astral-sh), the Python Package Index (PyPI) |
| Transcription model (whisper-large-v3-turbo) | Hugging Face |
| rclone | rclone.org |

Only ordinary download requests are made at this point. No meeting content is sent.

## 6. What stays on your Mac
| Item | Location |
|---|---|
| Copied recordings, recordings made in the app | `~/dji2note/recordings` |
| Notes (summary, transcript, raw transcription, metadata) | `~/dji2note/notes` |
| Settings (including API keys and tokens, readable only by you: 600) | `~/.config/dji2note/config.toml` |
| Processing history, record of notes fetched | `~/.config/dji2note/state.json`, `feed.json` |
| Log | `~/Library/Logs/dji2note.log` |
| Usage counts (before sending), stats on/off setting, install ID | `~/Library/Application Support/DJI2Note/usage.json` |
| Engine, Python, tools | `~/Library/Application Support/DJI2Note` |
| Transcription model | `~/.cache/huggingface` |

To remove everything, delete the folders above and move the app to the Trash. The original recordings on the DJI mic are not deleted.

## 7. Recording consent
Before recording a conversation, tell the people you're talking with and get their consent. You are responsible for complying with laws on recording and sharing.
