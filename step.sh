pushd jar-code/
#create a jar file to be tested
bash buildjar.sh
popd

pushd my-customizer-builder
# build my own running image based on java
docker build  . -t peter-java-run-image --target run -f Dockerfile_run_image
# build my own builder associate with above new image, it will create a new builder image `my-builder:bionic`
YOUR_BUILDER="my-builder:bionic" # Your builder image
pack builder create ${YOUR_BUILDER} --config ./builder.toml  --pull-policy if-not-present
popd

# build a new test-jar as output
pushd jar-code
pack config trusted-builders add  ${YOUR_BUILDER}
pack build test-jar --pull-policy never --builder ${YOUR_BUILDER} -v
#pack build test-jar  --path ./jar-code/ --buildpack ./jar-buildpack/  --pull-policy never
popd

echo "==================== Try your final image ==================" 
# try your final java image
docker run --rm test-jar
