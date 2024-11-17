# only move old context if it is not empty
mv chatcontext history/previouschatchatcontextDATE
rm chatcontext lastresponse temp

# start the new context by adding preferences
cp preferences chatcontext