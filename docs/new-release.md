# Create a new Release
This document contains notes for my future self on how to tag a new release for this package.

1. run [`release-it`](https://github.com/release-it/release-it) on the local command line
2. select the release version, create a tag, push changes, and don’t create an NPM release if `release-it` is asking for it
3. go to GitHub’s release page for this [redis-github-action](https://github.com/supercharge/redis-github-action/releases) and click the "Draft a new release" button
4. select the previously created tag and use the same tag version as the release title
5. that’s it
