/// @function intune_enemy_create()
function intune_enemy_create() {
    hp = 3;
    state = "detuned";
    move_speed = 1.1;
    stun_timer = 0;
}

/// @function intune_enemy_step()
function intune_enemy_step() {
    var p = instance_nearest(x, y, obj_player);

    if (state == "stunned") {
        stun_timer--;
        if (stun_timer <= 0) {
            state = "detuned";
        }
        return;
    }

    if (p != noone) {
        var dir = point_direction(x, y, p.x, p.y);
        x += lengthdir_x(move_speed, dir);
        y += lengthdir_y(move_speed, dir);
    }

    // Harmony stun check with key T for testing.
    if (keyboard_check_pressed(ord("T"))) {
        if (intune_is_jazz_resolution(global.intune.selected_chords)) {
            state = "stunned";
            stun_timer = room_speed * 2;
            global.intune.resonance += 10;
        }
    }
}

/// @function intune_boss_create()
function intune_boss_create() {
    hp = 12;
    phase = 1;
    expected = ["Dm7", "G7", "Cmaj7"];
    phase_timer = room_speed * 10;
}

/// @function intune_boss_step()
function intune_boss_step() {
    phase_timer--;

    switch (phase) {
        case 1:
            // Call & response phase.
            if (intune_progression_matches(expected) && keyboard_check_pressed(ord("E"))) {
                intune_start_rhythm(
                    function() {
                        hp -= 3;
                        phase = 2;
                        expected = ["Fm7", "Bb7", "Cmaj7"];
                    },
                    function() {}
                );
            }
        break;

        case 2:
            // Backdoor correction.
            if (intune_progression_matches(expected) && keyboard_check_pressed(ord("E"))) {
                intune_start_rhythm(
                    function() {
                        hp -= 4;
                        phase = 3;
                        expected = ["Dm7", "Db7", "Cmaj7"];
                    },
                    function() {}
                );
            }
        break;

        case 3:
            // Tritone substitution finale.
            if (intune_progression_matches(expected) && keyboard_check_pressed(ord("E"))) {
                intune_start_rhythm(
                    function() {
                        hp -= 5;
                        if (hp <= 0) {
                            instance_destroy();
                            global.intune.zones_cleared = 5;
                        }
                    },
                    function() {}
                );
            }
        break;
    }
}
