#!/bin/bash
set -e

if [[ "$*" == npm*start* ]]; then

	# force upgrade of config file
    if [ -e "$GHOST_CONTENT/config.js" ]; then
        rm "$GHOST_CONTENT/config.js"
    fi

    # copy default directories from source to content if needed
	for dir in "$GHOST_SOURCE/content"/*/; do
		targetDir="$GHOST_CONTENT/$(basename "$dir")"
		mkdir -p "$targetDir"
		if [ -z "$(ls -A "$targetDir")" ]; then
			tar -c --one-file-system -C "$dir" . | tar xC "$targetDir"
		fi
	done

	# upgrade target theme
	if [ ${NODE_ENV} == "production" ]; then
    	rm -rf "$GHOST_CONTENT/themes/${TARGET_THEME}"
    	cp -R "$GHOST_SOURCE/content/themes/${TARGET_THEME}" "$GHOST_CONTENT/themes/${TARGET_THEME}"
    fi

    # create a correct config file out of config.example.js if needed
	if [ ! -e "$GHOST_CONTENT/config.js" ]; then
		sed -r '
			s/127\.0\.0\.1/0.0.0.0/g;
			s!path.join\(__dirname, (.)/content!path.join(process.env.GHOST_CONTENT, \1!g;
		' "$GHOST_SOURCE/config.example.js" > "$GHOST_CONTENT/config.js"
	fi

	ln -sf "$GHOST_CONTENT/config.js" "$GHOST_SOURCE/config.js"

	chown -R user "$GHOST_CONTENT"

	set -- gosu user "$@"
fi

exec "$@"