#!/usr/bin/env bash

SCRIPTNAME=$(basename "$0")
DEFAULT_ITERATIONS=1
DEFAULT_REST_DURATION=5   # Changed to 5 minutes by default
MAX_REST_DURATION=60      # Maximum rest duration in minutes

# Styles
bold=$(tput bold)
normal=$(tput sgr0)

# Paths to WAV audio files

WORK_SOUND="$WORK_SOUND"
NOTIFICATION_SOUND="$NOTIFICATION_SOUND"
END_SOUND="$END_SOUND"

help(){
  cat << EOF
Usage: $SCRIPTNAME [-h] [sessions_num]

Parameters:
  sessions_num    Number of Pomodoro sessions

Options:
  -h, --help      Show this help message and exit

Default values used when parameters are provided:
  $SCRIPTNAME $DEFAULT_ITERATIONS
EOF
}

set_params(){
  iterations=${1:-$DEFAULT_ITERATIONS}
}

get_rest_duration(){
  echo "Select a break duration:"
  echo "1) 5 minutes"
  echo "2) 10 minutes"

  while true; do
    read -p "Enter your choice (1 or 2): " choice
    case $choice in
      1) rest_duration=5; work_duration=55; break ;;  # Correct duration for option 1
      2) rest_duration=10; work_duration=50; break ;;  # Correct duration for option 2
      *) echo "Invalid choice. Please enter 1 or 2." ;;
    esac
  done

  work_duration=$((work_duration * 60))
  rest_duration=$((rest_duration * 60))
}

display_timer(){
  local duration="$1"
  while [[ $duration -gt 0 ]]; do
    echo -ne "${bold}Timer: $duration seconds left${normal}" \\r
    sleep 1
    ((duration--))
  done
  echo "                                "  # Clear the countdown line
}

play_sound(){
  local sound_file="$1"
  if [[ -e "$sound_file" ]]; then
    afplay "$sound_file" &
  else
    echo "Sound file not found: $sound_file"
  fi
}

notify(){
  local message="$1"
  osascript -e 'display notification "'"$message"'" with title "Pomodoro"'
}

main(){
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    help
    exit 1
  fi

  # The number of sessions is passed as an argument, if specified

  if [[ $# -gt 0 ]]; then
    set_params "$1"
  else

    # Otherwise, ask the user how many Pomodoro sessions they want to do

    read -p "How many Pomodoro sessions would you like to do? " iterations
  fi

  session_number=1

  while [[ $iterations -gt 0 ]]; do
    # Pomodoro work phase
    echo "Pomodoro $session_number - Work phase"
    get_rest_duration  # Ask for rest duration before each session
    notify "Pomodoro $session_number - Work phase: Stay focused and productive!"
    play_sound "$WORK_SOUND"
    display_timer "$work_duration"  # Display timer during work phase
    notify "Pomodoro $session_number - Work phase completed. Take a break!"

    # Pomodoro rest phase (if there are more sessions)
    if [[ $iterations -gt 1 ]]; then
      notify "Pomodoro $session_number - Rest for $((rest_duration / 60)) minutes."
      play_sound "$NOTIFICATION_SOUND"
      display_timer "$rest_duration"  # Display timer during rest phase
    else
      notify "Pomodoro session $session_number completed. Great job!"
      play_sound "$END_SOUND"
    fi

    ((session_number++))
    ((iterations--))
  done
}

main "$@"

exit 0
