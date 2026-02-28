/// @function intune_player_create()
function intune_player_create() {
    move_speed = 2.6;
    cast_cooldown = 0;
    health = 5;
}

/// @function intune_player_step()
function intune_player_step() {
    var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

    x += h * move_speed;
    y += v * move_speed;

    if (cast_cooldown > 0) {
        cast_cooldown--;
    }

    // Reset chord buffer quickly.
    if (keyboard_check_pressed(ord("R"))) {
        global.intune.selected_chords = [];
    }

    // Optional harpoon attack placeholder.
    if (keyboard_check_pressed(vk_space) && cast_cooldown <= 0) {
        cast_cooldown = 20;
    }
}
