import { useState } from "react";
import { Plus, Trash2, ChevronDown, Save } from "lucide-react";
import { F, FC, G, StatusBar, Card, BackHeader } from "./shared";

interface Exercise {
  id: number;
  name: string;
  sets: { reps: number; weight: number }[];
}

const initial: Exercise[] = [
  { id: 1, name: "Bench Press",       sets: [{ reps: 5, weight: 80 }, { reps: 5, weight: 80 }, { reps: 5, weight: 82.5 }] },
  { id: 2, name: "Incline DB Press",  sets: [{ reps: 10, weight: 32 }, { reps: 10, weight: 32 }] },
  { id: 3, name: "Cable Fly",         sets: [{ reps: 12, weight: 15 }, { reps: 12, weight: 15 }, { reps: 12, weight: 15 }] },
];

function SetRow({ set, idx }: { set: { reps: number; weight: number }; idx: number }) {
  return (
    <div className="flex items-center gap-2 py-1.5">
      <span className="text-muted-foreground text-[10px] font-bold w-5" style={{ fontFamily: FC }}>{idx + 1}</span>
      <div
        className="flex-1 flex items-center justify-center rounded-lg py-1.5 text-xs font-bold"
        style={{ fontFamily: FC, background: "#1a1a1a", border: "1px solid #2a2a2a", color: "#ccc" }}
      >
        {set.reps} reps
      </div>
      <span className="text-muted-foreground text-xs" style={{ fontFamily: F }}>×</span>
      <div
        className="flex-1 flex items-center justify-center rounded-lg py-1.5 text-xs font-bold"
        style={{ fontFamily: FC, background: "#1a1a1a", border: "1px solid #2a2a2a", color: "#ccc" }}
      >
        {set.weight} kg
      </div>
    </div>
  );
}

export function S4Strength() {
  const [exercises] = useState<Exercise[]>(initial);
  const totalVol = exercises.reduce((acc, ex) => acc + ex.sets.reduce((s, set) => s + set.reps * set.weight, 0), 0);

  return (
    <div className="flex flex-col h-full bg-background">
      <StatusBar />
      <BackHeader title="Strength Workout" />

      <div className="flex-1 overflow-y-auto px-5 pb-4" style={{ scrollbarWidth: "none" }}>

        {/* Workout name */}
        <Card className="px-4 py-3 mb-4 flex items-center justify-between" gradient={G.card}>
          <span className="text-foreground text-sm font-semibold" style={{ fontFamily: F }}>Upper Body — Push A</span>
          <ChevronDown size={14} className="text-muted-foreground" />
        </Card>

        {/* Date */}
        <Card className="px-4 py-3 mb-5 flex items-center justify-between" gradient={G.card}>
          <span className="text-muted-foreground text-sm font-semibold" style={{ fontFamily: F }}>Date</span>
          <span className="text-foreground text-sm font-medium" style={{ fontFamily: F }}>Thu, Jun 12 2026</span>
        </Card>

        {/* Volume summary */}
        <div className="flex gap-2 mb-5">
          {[
            { v: `${exercises.length}`, l: "Exercises" },
            { v: `${exercises.reduce((a,e) => a + e.sets.length, 0)}`, l: "Total sets" },
            { v: `${(totalVol/1000).toFixed(1)}t`, l: "Volume" },
          ].map((s) => (
            <Card key={s.l} className="flex-1 px-3 py-3 flex flex-col items-center gap-1" gradient={G.cardAlt}>
              <span className="text-foreground" style={{ fontFamily: FC, fontSize: "1.125rem", fontWeight: 800, lineHeight: 1 }}>{s.v}</span>
              <span className="text-muted-foreground text-[9px] font-semibold uppercase tracking-wider" style={{ fontFamily: F }}>{s.l}</span>
            </Card>
          ))}
        </div>

        {/* Exercise list */}
        {exercises.map((ex) => (
          <Card key={ex.id} className="px-4 pt-4 pb-3 mb-3" gradient={G.card}>
            <div className="flex items-center justify-between mb-3">
              <h3 className="text-foreground font-bold" style={{ fontFamily: FC, fontSize: "1rem" }}>{ex.name}</h3>
              <div className="flex items-center gap-2">
                <span className="text-muted-foreground text-[10px] font-semibold uppercase tracking-wider" style={{ fontFamily: F }}>
                  {ex.sets.length} sets
                </span>
                <button><Trash2 size={13} className="text-muted-foreground" /></button>
              </div>
            </div>
            {/* Set header */}
            <div className="flex items-center gap-2 mb-1">
              <span className="text-muted-foreground text-[9px] font-bold uppercase tracking-wider w-5" style={{ fontFamily: F }}>#</span>
              <span className="flex-1 text-muted-foreground text-[9px] font-bold uppercase tracking-wider text-center" style={{ fontFamily: F }}>Reps</span>
              <span className="text-muted-foreground text-[9px] opacity-0">×</span>
              <span className="flex-1 text-muted-foreground text-[9px] font-bold uppercase tracking-wider text-center" style={{ fontFamily: F }}>Weight</span>
            </div>
            {ex.sets.map((set, i) => <SetRow key={i} set={set} idx={i} />)}
            <button
              className="w-full flex items-center justify-center gap-1.5 mt-2 py-2 rounded-lg text-muted-foreground text-xs font-semibold uppercase tracking-wider"
              style={{ fontFamily: F, background: "#111", border: "1px dashed #2a2a2a" }}
            >
              <Plus size={11} /> Add set
            </button>
          </Card>
        ))}

        {/* Add exercise */}
        <button
          className="w-full flex items-center justify-center gap-2 rounded-xl py-3.5 mb-4"
          style={{ background: G.pill, border: "1px dashed #333" }}
        >
          <Plus size={16} className="text-muted-foreground" />
          <span className="text-muted-foreground text-sm font-semibold uppercase tracking-wider" style={{ fontFamily: F }}>Add Exercise</span>
        </button>

        {/* Save */}
        <button
          className="w-full flex items-center justify-center gap-2.5 rounded-xl font-bold uppercase tracking-wider"
          style={{ height: 52, fontFamily: FC, fontSize: "0.9375rem", letterSpacing: "0.06em", background: G.accent, color: "#0a0a0a" }}
        >
          <Save size={18} />
          Save Workout
        </button>
      </div>
    </div>
  );
}
