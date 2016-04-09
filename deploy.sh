# Remove the public folder to make room for the gh-pages subtree
rm -rf public

# Add the gh-pages branch of the repository. It will look like a folder named public
git subtree add --prefix=public https://github.com/caiofralmeida/caiofralmeida.github.io.git gh-pages --squash

# Pull down the file we just committed. This helps avoid merge conflicts
git subtree pull --prefix=public https://github.com/caiofralmeida/caiofralmeida.github.io.git gh-pages

hugo -t beautifulhugo

# Add everything
git add -A

# Commit and push to master
git commit -m "Updating site" && git push origin master

# Push the public subtree to the gh-pages branch
git subtree push --prefix=public https://github.com/caiofralmeida/caiofralmeida.github.io.git gh-pages
