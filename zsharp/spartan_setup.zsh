#!/usr/bin/env zsh

#cargo build --release --features r1cs,zok,spartan --example circ
#cargo build --release --features r1cs,zok,spartan --example zk

set -ex

disable -r time

MODE=release # debug or release
BIN=/Users/jiwonkim/research/tmp/Mastadon/circ-mastadon/target/$MODE/examples/circ
ZK_BIN=/Users/jiwonkim/research/tmp/Mastadon/circ-mastadon/target/$MODE/examples/zk

modulus=28948022309329048855892746252171976963363056481941647379679742748393362948097

function spartan_test_prove {
      ex_name=$1
      $BIN --field-custom-modulus $modulus /Users/jiwonkim/research/tmp/Mastadon/circ-mastadon/zsharp/$ex_name.zok r1cs --action spartan-setup
}

spartan_test_prove relation_r_tmp
