 (cd "$(git rev-parse --show-toplevel)" && git apply --3way <<'EOF' 
diff --git a/README.md b/README.md
new file mode 100644
index 0000000000000000000000000000000000000000..32e86b289a540c449a176fe98adc82ff86be2ef8
--- /dev/null
+++ b/README.md
@@ -0,0 +1,27 @@
+# INTUNE — GameMaker Game Concept Starter
+
+INTUNE is a 2D underwater action-adventure rhythm puzzle game where harmony is your magic.
+You play an adventurer exploring the Sunken Conservatory to free the Mermaid Queen from a silent prism created by **The Detuner**.
+
+This repo includes:
+- Story + world + art direction docs.
+- GameMaker GML starter code for movement, chord-casting puzzles, rhythm checks, enemy stun logic, progression unlocks, and boss phases.
+- Suggested room setup and object/event wiring.
+
+## Quick Start (GameMaker)
+
+1. Create a new GameMaker project named `INTUNE`.
+2. Add objects listed in `docs/gamemaker_setup.md`.
+3. Paste matching code from `gml/` files into each object's events.
+4. Create rooms in this order: `rm_reef`, `rm_shipyard`, `rm_kelp_cathedral`, `rm_abyss`, `rm_queens_vault`.
+5. Add placeholder sprites/sounds and test the loop:
+   - Explore
+   - Assemble progression
+   - Perform rhythm input
+   - Resolve puzzle/combat state
+
+## Core Fantasy
+
+- **Beneath the Surface**: coral cities, bioluminescent trenches, kelp cathedrals.
+- **Jazz Harmony as Magic**: ii–V–I and substitutions become spells.
+- **Rescue Arc**: each biome restores one part of the Harmonic Tides before the final vault confrontation.
 
EOF
)
