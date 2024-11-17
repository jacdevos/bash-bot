#!/bin/bash

# Combine all files in context directory as context
> chatcontext
for file in context/*; do
    # Get the text after the last hyphen in filename
    separator=$(basename "$file" | rev | cut -d'-' -f1 | rev)
    # Add separator and file contents
    echo "${separator}: " >> chatcontext
    echo "" >> chatcontext
    cat "$file" >> chatcontext
    echo "" >> chatcontext
done 