#!/bin/sh -e
repo_root="$(dirname $0)/.."
sub_path=deps/linux
sub_repo="$repo_root/$sub_path"
git submodule init "$sub_path"
git clone "$(git config submodule.$sub_path.url)" --depth=1 --sparse --filter=blob:none "$sub_repo"
git -C "$sub_repo" sparse-checkout set --stdin < "$sub_repo/../linux-sparse.txt"
git config --local submodule.$sub_path.update checkout
