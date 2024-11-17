# bash-bot
Simple terminal based GenAI chat assistant using local open source LLM model and use bash commands. It's all file based so use git to backup your chat history or sync it with any other machine.

## Starting a New Chat Session & Saving Previous Chat
To start a new chat session:
1. Run `./new.sh`

This will:
- Create a fresh chat context
- Initialize it with your preferences
- Save your previous chat (if any) to the history folder, organized by date and time

2. Run `./prompt.sh` to start the chat

This will:
- Use the current chat context and preferences to generate a response to your input
- Append the response to the chat context
- Display the response in the terminal
