#! /usr/bin/env bash

# 根据 lazy-lock.json 文件指定插件版本

cd "$(dirname "$(readlink -f "$0")")" || exit 1

git pull --rebase

nvim --headless "+Lazy! restore" +qa
