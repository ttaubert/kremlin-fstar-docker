# kremlin-fstar-docker
A Docker image template to experiment with [KreMLin](https://github.com/FStarLang/kremlin/) and F*/Low*.

## Usage

First, build the Docker image locally.

```
docker build -t kremlin-fstar .
```

When that's done you can use the `krml` binary to verify, extract, translate, and compile.

```
docker run -ti kremlin-fstar bash
krml -skip-compilation bin/kremlin/test/Flat.fst
cat Flat.{h,c}
```
