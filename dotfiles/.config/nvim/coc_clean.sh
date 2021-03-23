#!/bin/bash
set -euo pipefail

COC_EXTENSIONS_PATH=~/.config/coc/extensions
COC_DEFINITION_FILE=$DOTFILES/dotfiles/.config/nvim/plugins/coc.vim

echo "Comparing CoC extensions list with installed extensions"
expected=$(grep -ioh "'coc-.*'" $COC_DEFINITION_FILE | tr -d "'" | sort)
actual=$(jq -r ".dependencies | keys | sort | .[]" "$COC_EXTENSIONS_PATH/package.json")

if [[ "$expected" = "$actual" ]]; then
    echo "Expected extensions and actual extensions are the same. Nothing to do"
else
    echo "Found difference(s) between expected and actual extensions:"
    diff <(echo "$expected") <(echo "$actual") || true
    echo "Removing extensions to trigger reinstall"
    rm -r $COC_EXTENSIONS_PATH
fi
