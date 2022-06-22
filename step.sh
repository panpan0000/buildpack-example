pushd jar-code/
buildjar.sh
popd

pushd my-customizer-builder
# build my own running image based on java
docker build  . -t peter-java-run-image --target run -f Dockerfile_run_image
# build my own builder associate with above new image
pack builder create my-builder:bionic --config ./builder.toml  --pull-policy if-not-present
popd

# build a new test-jar as output
pack build test-jar  --path ./jar-code/ --buildpack ./jar-buildpack/  --pull-policy never --builder my-builder:bionic
