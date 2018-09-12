#!/bin/bash -x
export plugin_name=${PWD##*/}
echo "PLUGIN_NAME=$plugin_name"
chmod -R 777 . # This is necessary if your plugin installs gems

echo "travis_fold:start:starting_docker_container"

docker run \
  -t \
  -e "COMMIT_HASH=origin/plugin-ci-changes" \
  -e "SKIP_CORE=1" \
  -e TRAVIS=$TRAVIS \
  -e SINGLE_PLUGIN=$plugin_name \
  -v $(pwd):/var/www/discourse/plugins/$plugin_name \
  discourse/discourse_test:release