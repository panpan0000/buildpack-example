Run the step.sh to do all the magic.



NOTE: you may need to pull some images(there may be some error promoted)
```
cnbs/sample-stack-run:bionic
cnbs/sample-stack-build:bionic
buildpacksio/lifecycle:0.13.3
buildpacksio/pack:latest
docker.m.daocloud.io/java:8
```

File Content:

```
├── jar-buildpack # buildpack main logic
│   ├── bin
│   │   ├── build
│   │   └── detect
│   └── buildpack.toml
├── jar-code         # a sample java code to be tested
│   ├── buildjar.sh
│   ├── MANIFEST.MF
│   └── Test.java
├── LICENSE
├── my-customizer-builder # create a new running image and a new builder
│   ├── builder-sample.toml
│   ├── builder.toml
│   └── Dockerfile_run_image
├── README.md
└── step.sh
```

