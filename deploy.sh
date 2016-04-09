# Create a new orphand branch (no commit history) named gh-pages
git checkout --orphan gh-pages

# Unstage all files
git rm --cached $(git ls-files)

# Grab one file from the master branch so we can make a commit
git checkout master README.md

# Add and commit that file
git add .
git commit -m "INIT: initial commit on gh-pages branch"

# Push to remote gh-pages branch
git push origin gh-pages

# Return to master branch
git checkout master

# Remove the public folder to make room for the gh-pages subtree
rm -rf public

# Add the gh-pages branch of the repository. It will look like a folder named public
git subtree add --prefix=public https://github.com/caiofralmeida/caiofralmeida.github.io.git gh-pages --squash

# Pull down the file we just committed. This helps avoid merge conflicts
#git subtree pull --prefix=public https://github.com/caiofralmeida/caiofralmeida.github.io.git gh-pages

hugo -t beautifulhugo

# Add everything
git add -A

# Commit and push to master
git commit -m "Updating site" && git push origin master

# Push the public subtree to the gh-pages branch
git subtree push --prefix=public https://github.com/caiofralmeida/caiofralmeida.github.io.git gh-pages
