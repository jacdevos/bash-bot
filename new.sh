# Check if current-chat folder exists and has more than one file
if [ -d "context" ] && [ $(ls -1 context | wc -l) -gt 1 ]; then
    # Get first file which should be th
    first_file=$(ls -1 context | head -n 1)
    
    # Extract date and time (YY-MM-DD HH:MM:SS) from filename
    date_str=$(echo "$first_file" | grep -o '[0-9]\{2\}-[0-9]\{2\}-[0-9]\{2\} [0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\}')
    if [ ! -z "$date_str" ]; then
        # Create new folder in history with the ISO date
        mkdir -p "history/$date_str"
        
        # Move all files from current-chat to the new history folder
        mv context/* "history/$date_str/"
    fi
fi

# Remove context directory and its contents
rm -rf context

# Initialise new chat context with preferences
mkdir context
current_date=$(date '+%y-%m-%d %H:%M:%S')
echo "Always use the following preferences in creating responses: " > "context/${current_date}-preferences"
cat preferences >> "context/${current_date}-preferences"


