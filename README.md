cmusphinx-docker
================

This project only houses a Dockerfile which encapsulates all (or, most of) the dependencies to get started with the Cmusphinx Grapheme-to-Phoneme (G2P) conversion library called [g2p-seq2seq](https://github.com/cmusphinx/g2p-seq2seq).

The Dockerfile extends from a Tensorflow image and adds additional dependencies.

It shares an Apache License, like the g2p-seq2seq project.

## Usage
For a more detailed usage, see the [g2p-seq2seq](https://github.com/cmusphinx/g2p-seq2seq) project page.

In summary, you can quickly get started with the following

Build the docker image
```bash
docker build -t deontaljaard/g2p .
```

Run it
```bash
docker run -it deontaljaard/g2p
```

You can then play with the g2p-seq2seq lib. Here is a quick example.
```bash
echo "test" >> words.txt
g2p-seq2seq --decode words.txt --model_dir /g2p-seq2seq-model/g2p-seq2seq-model-6.2-cmudict-nostress
``` 

Happy G2P!