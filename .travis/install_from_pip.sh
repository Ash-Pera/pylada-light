#! /usr/bin/env bash
set -e
set -o

cat > install_from_pip.sh << EOF
set -e
set -o
if [ "$TRAVIS_PULL_REQUEST" = "false" ] ; then
  pip install --user git+git://github.com/$TRAVIS_REPO_SLUG@$TRAVIS_COMMIT
  python -c "import pylada; pylada.test()"
fi
EOF