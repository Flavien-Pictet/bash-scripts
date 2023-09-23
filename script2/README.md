# Pomodoro Timer Script

## Description

The Pomodoro Timer script is a command-line utility that helps you manage your work time using the Pomodoro time management technique. The Pomodoro technique involves dividing your time into focused work periods (usually 25 minutes, I setted up at 50 / 55 minutes because it was too short) followed by short breaks (typically 5 minutes), with longer breaks after a certain number of cycles.

This script allows you to set the number of Pomodoro sessions you want to perform and choose the duration of your breaks. The script then displays a countdown timer for each work session and sends notifications when work and break periods are completed.

## Prerequisites

Before using the Pomodoro Timer script, make sure you have the following:

1. **Bash**: The script is designed to be run in a Bash environment. Ensure you have Bash installed on your system.

2. **macOS**: The script uses macOS-specific commands for notifications and playing audio files. It may not work correctly on other operating systems.

3. **Audio Files**: You will need audio files for startup, notification, and session completion sounds. You can download free audio files from websites like [Mixkit](https://mixkit.co/free-sound-effects/) and specify them in the appropriate environment variables.

## Installation and Usage

1. Clone this repository on your system:

```bash
git clone https://github.com/YourUsername/PomodoroScript.git
```

2. Configure the paths to your audio files in your .zshrc or .bashrc file as environment variables:
```bash
    export WORK_SOUND="/path/to/your/file/start.wav"
    export NOTIFICATION_SOUND="/path/to/your/file/notification.wav"
    export END_SOUND="/path/to/your/file/end.wav"
```

Run the script using Bash:

```bash
bash pomodoro.sh [sessions_num]
```
## Note

The script is designed to work on macOS and may require adjustments to work on other operating systems.

Ensure you have valid audio files at the paths specified in your environment variables for the sounds to work correctly.
