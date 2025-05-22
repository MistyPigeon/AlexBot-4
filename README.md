# 🤖 AlexBot 4

**AlexBot 4** is a next-generation Discord moderation bot written entirely in **Elixir**, built for powerful automation, multilingual moderation, and advanced server security. It features community-driven ban voting, pattern detection, evidence-based punishments, and even meme-worthy responses like `"Bru"` if someone pastes the entire Bible in Japanese.

---

## ✨ Features

- `/;START:` – Activates the bot if you're staff
- `/:o;]` – Owner-only superban mode
- `;func()` – Auto-bans all users with 1–3 warnings
- 🧠 **Speedy Agreementoring**:
  - Bans users *automatically* based on 6+ evidence logs, past bans, and 2 warnings in the same day
  - Requires staff voting with a 30-second decision window
- 🔁 Translation tools for Morse, Caesar, Atbash, etc.
- 🌐 Language scanning across English, Chinese, Japanese, Urdu, Arabic, and more
- 🧍 `"Bru"` detection when Bible-length spam appears in Japanese
- Modular and extendable architecture using Elixir + Timex + Nostrum

---

## 🧰 Requirements

- Elixir (1.12 or newer recommended)
- Discord bot token
- Your bot added to a server (with message and moderation permissions)
- Dependencies:
  - `:nostrum`
  - `:timex`

Add these to `mix.exs`:

```elixir
defp deps do
  [
    {:nostrum, ">= 0.5.0"},
    {:timex, ">= 3.7.8"}
  ]
end
🧪 Running the Bot
Clone this repo

Set your bot token as an environment variable:

bash
Copy
Edit
export DISCORD_TOKEN="your_token_here"
Run the bot:

bash
Copy
Edit
mix deps.get
mix run --no-halt
🗃 File Structure
lib/alexbot4/bot.ex – Discord event handler

lib/alexbot4/commands.ex – Moderation command logic

lib/alexbot4/speedy_agreementoring.ex – Ban logic core

lib/alexbot4/vote.ex – Voting system for staff decisions

lib/alexbot4/translate.ex – Translator utilities

lib/alexbot4/detectors.ex – Bible spam detector

lib/alexbot4/util.ex – Staff/owner logic

🔧 You will also need to implement WarnStore, Evidence, BanHistory, and Config modules (or mock them).

👨‍⚖️ Speedy Agreementoring Explained
This feature checks:

If a user has 6+ pieces of evidence

Has been banned previously

Got 2 warnings today (adjusted to owner’s timezone)

Then initiates a 30-second staff vote:

Requires 6 !agree votes (including the owner and top 2 ranked staff)

If passed → Immediate ban

Logged with timestamps and reasons

🔐 Safety & Ethics
AlexBot 4 is designed to respect Discord’s Terms of Service

Includes ban timers, evidence thresholds, and manual unban routes

Includes humorous and serious moderation features — all opt-in by server owner

📝 License
This project is licensed under the MIT License. See LICENSE file for details.

💬 Credits & Inspiration
Inspired by the moderation needs of real communities and the creativity of friends in the Roblox and Discord dev scenes.

🙌 Contribute
Pull requests are welcome! If you want to add:

New languages

More moderation logic

Voting UI features

Web dashboard

...feel free to fork and build!

vbnet
Copy
Edit

