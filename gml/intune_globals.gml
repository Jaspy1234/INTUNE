/// @function intune_init_globals()
function intune_init_globals() {
    global.intune = {
        resonance: 0,
        resonance_max: 100,
        unlocked_chords: ["Cmaj7", "Dm7", "G7"],
        selected_chords: [],
        rhythm_active: false,
        rhythm_total_beats: 4,
        rhythm_hits: 0,
        rhythm_timer: 0,
        rhythm_beat_window: 20,
        rhythm_metronome_interval: 15,
        rhythm_next_tick: 15,
        rhythm_success_callback: noone,
        rhythm_fail_callback: noone,
        zones_cleared: 0,
        room_order: ["rm_reef", "rm_shipyard", "rm_kelp_cathedral", "rm_abyss", "rm_queens_vault"]
    };
}

/// @function intune_update_unlocks()
function intune_update_unlocks() {
    if (global.intune.resonance >= global.intune.resonance_max) {
        global.intune.resonance = 0;

        if (!intune_array_contains(global.intune.unlocked_chords, "Bb7")) {
            array_push(global.intune.unlocked_chords, "Bb7");
        } else if (!intune_array_contains(global.intune.unlocked_chords, "Db7")) {
            array_push(global.intune.unlocked_chords, "Db7");
        } else if (!intune_array_contains(global.intune.unlocked_chords, "A7")) {
            array_push(global.intune.unlocked_chords, "A7");
        }
    }
}

/// @function intune_draw_hud()
function intune_draw_hud() {
    var hud_x = 24;
    var hud_y = 24;

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    draw_text(hud_x, hud_y, "RESONANCE: " + string(global.intune.resonance) + "/" + string(global.intune.resonance_max));
    draw_text(hud_x, hud_y + 24, "CHORDS: " + intune_array_join(global.intune.selected_chords, " -> "));

    if (global.intune.rhythm_active) {
        draw_text(hud_x, hud_y + 48, "RHYTHM: " + string(global.intune.rhythm_hits) + "/" + string(global.intune.rhythm_total_beats));
    }
}
