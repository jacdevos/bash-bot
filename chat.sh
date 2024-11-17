# Check if no arguments were provided
if [ $# -eq 0 ]; then
    echo "Provide text prompt as argument or use '--new' flag to start a new chat"
    echo "E.g. ./chat.sh 'What is 1+1=' or ./chat.sh --new"
    exit 1
fi

# todo implement --justlisten / -noresponse - to just add context 
# todo implement --undo (delete lastuserinput)
# todo implement --retry (just redo lastuserinput)
# todo implement --interactive

# Check if --new flag was provided
if [ "$1" = "--new" ]; then
    ./src/new.sh
    echo "New chat Ready!"
    exit 0
fi

# assume new if there is no preferences file
if ! ls context/*-preferences 1> /dev/null 2>&1; then
    ./src/new.sh
    # don't exit here, we want to continue to process user input
fi

current_date=$(date '+%y-%m-%d %H:%M:%S')

# Create new user input from command line arguments
lastuserinputfile="context/${current_date}-user"
> $lastuserinputfile
echo "$@" >> $lastuserinputfile

# Generate context string from all files
./src/contexttostring.sh

# cat chatcontext newprompt > tempin
# ollama run Llama3.1-noheat < tempin --nowordwrap > lastreponse
# rm tempin
# cat chatcontext lastreponse > tempout
# mv tempout chatcontext
