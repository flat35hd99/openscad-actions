# eval openscad
OpenSCAD environment on github actions

## Usage

Set `scad_file` and `output_file` with extension you want to build.
If needed set `options` as openscad command line options.

```yaml
runs-on: ubuntu-latest
steps:
  - name: Setup
    uses: actions/checkout@v2
  - name: Build stl file
    uses: flat35hd99/openscad-actions@v1.3
    with:
      scad_file: test/test.scad
      output_file: test.stl
```

This workflow create `test.stl` file at working directory.

You can use built file like:

```yaml
- name: Upload stl file as artifact
  uses: actions/upload-artifact@v2
  with:
    name: built_stl
    path: test.stl
    options: "-D var=value -hardwarnings"
```

## Image galery

If you store multiple `.scad` files in one repo, just path the directory and it will create the images a `readme.md` file for you.

```yaml
runs-on: ubuntu-latest
steps:
  - name: Setup
    uses: actions/checkout@v2
  - name: Create galery
    uses: flat35hd99/openscad-actions@main
    with:
      scad_file: ./test/
      output_file: ./output/
      target_format_for_bulk: png
```

This action use [OpenSCAD CLI](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_OpenSCAD_in_a_command_line_environment).


## Local dev of action

To run the action locally, you can call the entrypoint script as well but openscad needs to be installed before.

single test
```
./entrypoint.sh ./test/test.scad test.png "-D size1=10 -D size2=100" ""
```
bulk test
```
./entrypoint.sh ./test/ ./output/ "-D size1=10 -D size2=100" png
```



