# How to release a new version

1. Add a new version to CHANGELOG.md. Browse through https://github.com/teamniteo/pyramid_customerio/commits/master to see what was done since last release. Remember to set the correct release date.
1. Set the same version in setup.py.
1. `make tests`
1. `git add -p && git ci -m "release VERSION"`
1. `git push origin master` and wait for CircleCI to pass the build.
1. `git tag VERSION`
1. `git push --tags`
