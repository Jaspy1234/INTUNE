/// @function intune_gate_step(_gate_id, _required)
function intune_gate_step(_gate_id, _required) {
    if (_gate_id.gate_is_open) {
        return;
    }

    var p = instance_nearest(_gate_id.x, _gate_id.y, obj_player);
    if (p != noone && point_distance(_gate_id.x, _gate_id.y, p.x, p.y) < 48) {
        if (keyboard_check_pressed(ord("E"))) {
            if (intune_progression_matches(_required)) {
                intune_start_rhythm(
                    function() {
                        _gate_id.gate_is_open = true;
                        global.intune.resonance += 20;
                    },
                    function() {
                        // fail callback
                    }
                );
            }
        }
    }
}

/// @function intune_start_rhythm(_success_callback, _fail_callback)
function intune_start_rhythm(_success_callback, _fail_callback) {
    global.intune.rhythm_active = true;
    global.intune.rhythm_hits = 0;
    global.intune.rhythm_timer = global.intune.rhythm_total_beats * global.intune.rhythm_beat_window;
    global.intune.rhythm_next_tick = global.intune.rhythm_metronome_interval;
    global.intune.rhythm_success_callback = _success_callback;
    global.intune.rhythm_fail_callback = _fail_callback;
}

/// @function intune_update_rhythm()
function intune_update_rhythm() {
    if (!global.intune.rhythm_active) {
        return;
    }

    global.intune.rhythm_timer--;
    global.intune.rhythm_next_tick--;

    // metronome tick placeholder
    if (global.intune.rhythm_next_tick <= 0) {
        global.intune.rhythm_next_tick = global.intune.rhythm_metronome_interval;
        // audio_play_sound(snd_metronome, 1, false);
    }

    if (keyboard_check_pressed(vk_space)) {
        global.intune.rhythm_hits++;
    }

    if (global.intune.rhythm_hits >= global.intune.rhythm_total_beats) {
        global.intune.rhythm_active = false;
        if (global.intune.rhythm_success_callback != noone) {
            global.intune.rhythm_success_callback();
        }
        return;
    }

    if (global.intune.rhythm_timer <= 0) {
        global.intune.rhythm_active = false;
        if (global.intune.rhythm_fail_callback != noone) {
            global.intune.rhythm_fail_callback();
        }
    }
}
