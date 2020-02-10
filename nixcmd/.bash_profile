stty erase ^?
stty erase ^H
stty intr ^C
stty kill ^X
stty susp ^Z

#stty istrip
stty -istrip

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi
