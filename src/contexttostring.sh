#!/bin/bash

# Combine all files in context directory as context
> tempchatcontext
for file in context/*; do
    # Get the text after the last hyphen in filename
    separator=$(basename "$file" | rev | cut -d'-' -f1 | rev)
    # Add separator and file contents
    echo "${separator}: " >> tempchatcontext
    cat "$file" >> tempchatcontext
    echo "" >> tempchatcontext
done 