bool get_retro_tapping(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case LT(1,KC_SPACE):
        case LT(4,DE_DQOT):
            return true;
        default:
            return false;
    }
}


// achordion
void matrix_scan_user(void) {
  achordion_task();
}

uint16_t achordion_timeout(uint16_t tap_hold_keycode) {
  switch (tap_hold_keycode) {
    case MT(MOD_LALT, KC_S):
    case MT(MOD_LCTL, KC_D):
    case MT(MOD_LGUI, KC_F):
    case MT(MOD_RGUI, KC_J):
    case MT(MOD_RCTL, KC_K):
    case MT(MOD_RALT, KC_L):
      return 800;  // Use a timeout of 800 ms for these keys
  }

  return 0;  // Bypass Achordion for all other keys
}

// bool get_hold_on_other_key_press(uint16_t keycode, keyrecord_t *record) {
//     switch (keycode) {
//         case TD(DANCE_0): // TODO: This is the LT(4, ") key
//             // Immediately select the hold action when another key is pressed.
//             return true;
//         default:
//             // Do not select the hold action when another key is pressed.
//             return false;
//     }
// }
