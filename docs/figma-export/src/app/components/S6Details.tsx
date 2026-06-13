import { Activity, Clock, MapPin, TrendingUp, Mountain, FileText, Pencil, Trash2 } from "lucide-react";
import { F, FC, G, StatusBar, Card, BackHeader, ProgressBar } from "./shared";

const exercises = [
  { name: "Bench Press",       sets: [{ r: 5, w: 80 }, { r: 5, w: 80 }, { r: 5, w: 82.5 }] },
  { name: "Incline DB Press",  sets: [{ r: 10, w: 32 }, { r: 10, w: 32 }] },
  { name: "Cable Fly",         sets: [{ r: 12, w: 15 }, { r: 12, w: 15 }, { r: 12, w: 15 }] },
];

export function S6Details() {
  const mode: "endurance" | "strength" = "endurance";

  return (
    <div className="flex flex-col h-full bg-background">
      <StatusBar />
      <BackHeader
        title="Workout Details"
        right={
          <div className="flex items-center gap-2">
            <button><Pencil size={15} className="text-muted-foreground" /></button>
            <button><Trash2 size={15} className="text-muted-foreground" /></button>
          </div>
        }
      />

      <div className="flex-1 overflow-y-auto px-5 pb-6" style={{ scrollbarWidth: "none" }}>

        {/* Hero */}
        <Card
          className="px-5 py-5 mb-4"
          gradient="linear-gradient(145deg, #1f1f28 0%, #111118 100%)"
          style={{ border: "1px solid #2e2e3e" }}
        >
          <div className="flex items-center gap-2 mb-2">
            <div className="rounded-xl flex items-center justify-center" style={{ width: 32, height: 32, background: "#2a2a3e", border: "1px solid #3a3a52" }}>
              <Activity size={16} className="text-foreground" />
            </div>
            <span className="text-muted-foreground text-xs font-bold uppercase tracking-widest" style={{ fontFamily: F }}>Morning Run</span>
          </div>
          <h2 className="text-foreground" style={{ fontFamily: FC, fontSize: "1.75rem", fontWeight: 800, lineHeight: 1 }}>8.4 km</h2>
          <p className="text-muted-foreground text-sm mt-1" style={{ fontFamily: F }}>Thu, Jun 12 2026 · 07:15 AM</p>
        </Card>

        {/* Metrics grid */}
        <div className="grid grid-cols-2 gap-2 mb-4">
          {[
            { icon: <Clock size={14}/>,     label: "Duration",  value: "42:30" },
            { icon: <TrendingUp size={14}/>, label: "Pace",      value: "5:03/km" },
            { icon: <MapPin size={14}/>,     label: "Distance",  value: "8.4 km" },
            { icon: <Mountain size={14}/>,   label: "Elevation", value: "+124 m" },
          ].map((m) => (
            <Card key={m.label} className="px-4 py-3 flex flex-col gap-1.5" gradient={G.card}>
              <div className="flex items-center gap-1.5 text-muted-foreground">{m.icon}<span className="text-[10px] font-bold uppercase tracking-wider" style={{ fontFamily: F }}>{m.label}</span></div>
              <span className="text-foreground" style={{ fontFamily: FC, fontSize: "1.25rem", fontWeight: 800, lineHeight: 1 }}>{m.value}</span>
            </Card>
          ))}
        </div>

        {/* Pace zones */}
        <Card className="px-4 py-4 mb-4" gradient={G.card}>
          <p className="text-muted-foreground text-[10px] font-bold uppercase tracking-widest mb-3" style={{ fontFamily: F }}>
            Pace by km
          </p>
          <div className="flex items-end gap-1.5" style={{ height: 52 }}>
            {[68, 82, 90, 75, 88, 95, 72, 85].map((h, i) => (
              <div key={i} className="flex-1 flex flex-col items-center gap-1">
                <div className="w-full rounded-sm" style={{ height: `${(h / 100) * 44}px`, background: `linear-gradient(180deg, #d0d0d0 0%, #555 100%)` }} />
                <span className="text-muted-foreground text-[8px]" style={{ fontFamily: F }}>{i + 1}</span>
              </div>
            ))}
          </div>
          <div className="flex justify-between mt-2">
            <span className="text-muted-foreground text-[9px]" style={{ fontFamily: F }}>Best: 4:45/km</span>
            <span className="text-muted-foreground text-[9px]" style={{ fontFamily: F }}>Avg: 5:03/km</span>
          </div>
        </Card>

        {/* Heart rate placeholder */}
        <Card className="px-4 py-4 mb-4" gradient={G.card}>
          <div className="flex items-center justify-between mb-3">
            <p className="text-muted-foreground text-[10px] font-bold uppercase tracking-widest" style={{ fontFamily: F }}>Heart Rate Zones</p>
            <span className="text-muted-foreground text-[10px]" style={{ fontFamily: F }}>Avg 158 bpm</span>
          </div>
          {[["Zone 1 — Easy", 8], ["Zone 2 — Aerobic", 32], ["Zone 3 — Tempo", 41], ["Zone 4 — Threshold", 16], ["Zone 5 — Max", 3]].map(([z, p]) => (
            <div key={z} className="flex items-center gap-3 mb-2">
              <span className="text-muted-foreground text-[10px] w-28 shrink-0" style={{ fontFamily: F }}>{z}</span>
              <div className="flex-1"><ProgressBar pct={p as number} height={5} /></div>
              <span className="text-muted-foreground text-[10px] w-6 text-right shrink-0" style={{ fontFamily: F }}>{p}%</span>
            </div>
          ))}
        </Card>

        {/* Notes */}
        <Card className="px-4 py-4 mb-4" gradient={G.card}>
          <div className="flex items-center gap-2 mb-2">
            <FileText size={13} className="text-muted-foreground" />
            <span className="text-muted-foreground text-[10px] font-bold uppercase tracking-widest" style={{ fontFamily: F }}>Notes</span>
          </div>
          <p className="text-foreground text-sm" style={{ fontFamily: F }}>
            Felt strong in the first 5km, legs a bit heavy on the last stretch. Good negative split overall.
          </p>
        </Card>

        {mode === "strength" && (
          <Card className="px-4 py-4 mb-4" gradient={G.card}>
            <p className="text-muted-foreground text-[10px] font-bold uppercase tracking-widest mb-3" style={{ fontFamily: F }}>Exercises</p>
            {exercises.map((ex) => (
              <div key={ex.name} className="mb-4 last:mb-0">
                <p className="text-foreground text-sm font-bold mb-2" style={{ fontFamily: FC }}>{ex.name}</p>
                {ex.sets.map((s, i) => (
                  <div key={i} className="flex items-center gap-3 py-1 border-b border-border last:border-0">
                    <span className="text-muted-foreground text-[10px] w-4" style={{ fontFamily: FC }}>{i + 1}</span>
                    <span className="text-foreground text-xs flex-1" style={{ fontFamily: F }}>{s.r} reps × {s.w} kg</span>
                    <span className="text-muted-foreground text-[10px]" style={{ fontFamily: FC }}>{(s.r * s.w).toFixed(0)} kg</span>
                  </div>
                ))}
              </div>
            ))}
          </Card>
        )}
      </div>
    </div>
  );
}
