/// @function intune_array_contains(_arr, _value)
function intune_array_contains(_arr, _value) {
    for (var i = 0; i < array_length(_arr); i++) {
        if (_arr[i] == _value) {
            return true;
        }
    }
    return false;
}

/// @function intune_array_join(_arr, _sep)
function intune_array_join(_arr, _sep) {
    var out = "";
    for (var i = 0; i < array_length(_arr); i++) {
        out += string(_arr[i]);
        if (i < array_length(_arr) - 1) {
            out += _sep;
        }
    }
    return out;
}

/// @function intune_add_chord_input(_chord)
function intune_add_chord_input(_chord) {
    if (!intune_array_contains(global.intune.unlocked_chords, _chord)) {
        return;
    }

    if (array_length(global.intune.selected_chords) >= 4) {
        array_delete(global.intune.selected_chords, 0, 1);
    }

    array_push(global.intune.selected_chords, _chord);
}

/// @function intune_progression_matches(_required)
function intune_progression_matches(_required) {
    if (array_length(global.intune.selected_chords) != array_length(_required)) {
        return false;
    }

    for (var i = 0; i < array_length(_required); i++) {
        if (global.intune.selected_chords[i] != _required[i]) {
            return false;
        }
    }

    return true;
}

/// @function intune_is_jazz_resolution(_prog)
/// Basic recognition for ii-V-I and tritone-sub versions in C.
function intune_is_jazz_resolution(_prog) {
    if (array_length(_prog) != 3) {
        return false;
    }

    var a = _prog[0];
    var b = _prog[1];
    var c = _prog[2];

    var is_classic = (a == "Dm7" && b == "G7" && c == "Cmaj7");
    var is_backdoor = (a == "Fm7" && b == "Bb7" && c == "Cmaj7");
    var is_tritone = (a == "Dm7" && b == "Db7" && c == "Cmaj7");

    return is_classic || is_backdoor || is_tritone;
}
