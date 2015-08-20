#!/bin/sh

gh_pfx="https://github.com/cosmicexplorer/speech-tagger/releases/download"
version="0.0.0"
jar_url="$gh_pfx/$version/speech-tagger-0.0.0-SNAPSHOT-standalone.jar"
model_url="$gh_pfx/$version/english-left3words-distsim.tagger"
tags_url="$gh_pfx/$version/penn_treebank_tags.json"
bindir="/usr/bin/speech-tagger"

mkdir "$bindir"
for url in "$jar_url" "$model_url" "$tags_url"; do
  wget "$url" -o "$bindir"
done

cat >/usr/bin/speech-tagger <<EOF
#!/bin/sh
prefix="/usr/bin/speech-tagger"
java -jar "$prefix/speech-tagger-0.0.0-SNAPSHOT-standalone.jar" \
  "$prefix/english-left3words-distsim.tagger" "$prefix/penn_treebank_tags.json"
EOF