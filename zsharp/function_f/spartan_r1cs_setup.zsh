#!/usr/bin/env zsh

set -ex

disable -r time

MODE=release # debug or release
BIN=./circ-mastadon/target/$MODE/examples/circ
ZK_BIN=./circ-mastadon/target/$MODE/examples/zk

modulus=28948022309329048855892746252171976963363056481941647379679742748393362948097

function spartan_r1cs {
    ex_name=$1
    $BIN --field-custom-modulus $modulus ./circ-mastadon/zsharp/function_f/$ex_name.zok r1cs --action spartan-setup --prover-key IVC_P --verifier-key IVC_V
}


spartan_r1cs function_f