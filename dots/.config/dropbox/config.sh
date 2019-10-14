dropbox help > /dev/null 2>&1
if [ $? -eq 0 ]; then
    dropbox exclude add Dropbox/events
fi
