#!/bin/bash
## Faz `git push` em todos remotes

BRANCH="`git branch | grep -e '*' | sed -e 's/^* //'`"

for REMOTE in `git remote`
do
	git push ${REMOTE} ${BRANCH}
done

