# TODO if context doesn't exist or empty create from preferences

cat chatcontext newprompt > tempin
ollama run Llama3.1-noheat < tempin --nowordwrap > lastreponse
rm tempin
cat chatcontext lastreponse > tempout
mv tempout chatcontext
