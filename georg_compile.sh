#! /bin/bash

set -e

newest_file=$(ls -t zsa_moonlander*.zip | head -1)

unzip $newest_file -d zsa_moonlander_export

rm -rf zsa_moonlander_georg.bin

rm -rf keyboards/zsa/moonlander/keymaps/georg
cp -r zsa_moonlander_export/zsa_moonlander_main_source keyboards/zsa/moonlander/keymaps/georg

echo "" >> keyboards/zsa/moonlander/keymaps/georg/keymap.c
cat georg_custom_keymap.c >> keyboards/zsa/moonlander/keymaps/georg/keymap.c

echo "" >> keyboards/zsa/moonlander/keymaps/georg/config.h
cat georg_config.h >> keyboards/zsa/moonlander/keymaps/georg/config.h

# achordion
sed -i '' '1i\
#include "features/achordion.h"

' keyboards/zsa/moonlander/keymaps/georg/keymap.c
sed -i '' '/bool process_record_user(uint16_t keycode, keyrecord_t \*record) {/a\
    if (!process_achordion(keycode, record)) { return false; }' keyboards/zsa/moonlander/keymaps/georg/keymap.c
echo "" >> keyboards/zsa/moonlander/keymaps/georg/rules.mk
echo "SRC += features/achordion.c" >> keyboards/zsa/moonlander/keymaps/georg/rules.mk
cp -r features/ keyboards/zsa/moonlander/keymaps/georg/features

rm -rf zsa_moonlander_export

echo "Compiling..."
make zsa/moonlander:georg


