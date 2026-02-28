# GameMaker Setup Guide for INTUNE

## Objects to Create

- `obj_controller`
- `obj_player`
- `obj_chord_gate`
- `obj_chord_button` (UI element, duplicated per chord)
- `obj_detuned_enemy`
- `obj_detuner_boss`

## Scripts to Add

Import/paste files from `gml/` as scripts:
- `intune_globals.gml`
- `intune_music_logic.gml`
- `intune_player_logic.gml`
- `intune_gate_and_rhythm.gml`
- `intune_enemy_and_boss.gml`

## Room Flow

1. `rm_reef`
2. `rm_shipyard`
3. `rm_kelp_cathedral`
4. `rm_abyss`
5. `rm_queens_vault`

Assign the room progression in `intune_globals.gml`.

## Event Wiring

### obj_controller
- **Create Event**
  ```gml
  intune_init_globals();
  ```

- **Step Event**
  ```gml
  intune_update_rhythm();
  intune_update_unlocks();
  ```

- **Draw GUI Event**
  ```gml
  intune_draw_hud();
  ```

### obj_player
- **Create Event**
  ```gml
  intune_player_create();
  ```

- **Step Event**
  ```gml
  intune_player_step();
  ```

### obj_chord_gate
- **Create Event**
  ```gml
  gate_required_progression = ["Dm7", "G7", "Cmaj7"];
  gate_is_open = false;
  ```

- **Step Event**
  ```gml
  intune_gate_step(id, gate_required_progression);
  ```

### obj_chord_button
- **Create Event**
  ```gml
  chord_name = "Dm7";
  ```

- **Left Pressed Event**
  ```gml
  intune_add_chord_input(chord_name);
  ```

### obj_detuned_enemy
- **Create Event**
  ```gml
  intune_enemy_create();
  ```

- **Step Event**
  ```gml
  intune_enemy_step();
  ```

### obj_detuner_boss
- **Create Event**
  ```gml
  intune_boss_create();
  ```

- **Step Event**
  ```gml
  intune_boss_step();
  ```
