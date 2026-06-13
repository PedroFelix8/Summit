import { useState } from "react";
import { Activity, Mountain, Bike, ChevronDown, FileText, Save } from "lucide-react";
import { F, FC, G, StatusBar, Card, BackHeader } from "./shared";

const SPORTS = [
  { id: "run",   icon: <Activity size={16}/>, label: "Running" },
  { id: "cycle", icon: <Bike size={16}/>,     label: "Cycling" },
  { id: "trail", icon: <Mountain size={16}/>, label: "Trail Run" },
];

function InputRow({ label, placeholder, unit }: { label: string; placeholder: string; unit?: string }) {
  return (
    <div className="flex items-center justify-between py-3.5 border-b border-border">
      <span className="text-muted-foreground text-sm font-semibold" style={{ fontFamily: F }}>{label}</span>
      <div className="flex items-center gap-2">
        <span className="text-foreground text-sm font-medium" style={{ fontFamily: F }}>{placeholder}</span>
        {unit && <span className="text-muted-foreground text-xs" style={{ fontFamily: F }}>{unit}</span>}
        <ChevronDown size={13} className="text-muted-foreground" />
      </div>
    </div>
  );
}

export function S3Endurance() {
  const [sport, setSport] = useState("run");

  return (
    <div className="flex flex-col h-full bg-background">
      <StatusBar />
      <BackHeader title="Endurance Workout" />

      <div className="flex-1 overflow-y-auto px-5 pb-4" style={{ scrollbarWidth: "none" }}>

        {/* Sport selector */}
        <div className="flex gap-2 mb-5">
          {SPORTS.map((s) => {
            const active = sport === s.id;
            return (
              <button
                key={s.id}
                onClick={() => setSport(s.id)}
                className="flex-1 flex flex-col items-center gap-1.5 py-3 rounded-xl transition-all active:scale-95"
                style={{
                  background: active ? G.accent : G.pill,
                  border: active ? "1px solid #555" : "1px solid #2a2a2a",
                }}
              >
                <div className={active ? "text-primary-foreground" : "text-muted-foreground"}>{s.icon}</div>
                <span
                  className={`text-[10px] font-bold uppercase tracking-wider ${active ? "text-primary-foreground" : "text-muted-foreground"}`}
                  style={{ fontFamily: F }}
                >
                  {s.label}
                </span>
              </button>
            );
          })}
        </div>

        {/* Date & time */}
        <Card className="px-4 mb-4" gradient={G.card}>
          <div className="flex items-center justify-between py-3.5 border-b border-border">
            <span className="text-muted-foreground text-sm font-semibold" style={{ fontFamily: F }}>Date</span>
            <span className="text-foreground text-sm font-medium" style={{ fontFamily: F }}>Thu, Jun 12 2026</span>
          </div>
          <div className="flex items-center justify-between py-3.5">
            <span className="text-muted-foreground text-sm font-semibold" style={{ fontFamily: F }}>Start time</span>
            <span className="text-foreground text-sm font-medium" style={{ fontFamily: F }}>07:15 AM</span>
          </div>
        </Card>

        {/* Metrics */}
        <Card className="px-4 mb-4" gradient={G.card}>
          <InputRow label="Distance" placeholder="8.40" unit="km" />
          <InputRow label="Duration" placeholder="42:30" unit="hh:mm:ss" />
          <InputRow label="Elevation" placeholder="124" unit="m" />
          <div className="flex items-center justify-between py-3.5">
            <span className="text-muted-foreground text-sm font-semibold" style={{ fontFamily: F }}>Pace</span>
            <span className="text-foreground text-sm font-medium" style={{ fontFamily: F }}>5:03 / km  <span className="text-muted-foreground text-xs">(auto)</span></span>
          </div>
        </Card>

        {/* RPE */}
        <Card className="px-4 py-4 mb-4" gradient={G.card}>
          <p className="text-muted-foreground text-[10px] font-bold uppercase tracking-widest mb-3" style={{ fontFamily: F }}>
            Perceived effort (RPE)
          </p>
          <div className="flex gap-2">
            {[1,2,3,4,5,6,7,8,9,10].map((n) => (
              <button
                key={n}
                className="flex-1 flex items-center justify-center rounded-lg py-1.5 text-xs font-bold transition-colors"
                style={{
                  fontFamily: FC,
                  background: n === 7 ? G.bar : "#1e1e1e",
                  color: n === 7 ? "#0a0a0a" : "#555",
                  border: n === 7 ? "none" : "1px solid #2a2a2a",
                }}
              >
                {n}
              </button>
            ))}
          </div>
          <p className="text-muted-foreground text-[10px] mt-2 text-center" style={{ fontFamily: F }}>
            7 — Hard
          </p>
        </Card>

        {/* Notes */}
        <Card className="px-4 py-4 mb-5" gradient={G.card}>
          <div className="flex items-center gap-2 mb-2">
            <FileText size={13} className="text-muted-foreground" />
            <span className="text-muted-foreground text-[10px] font-bold uppercase tracking-widest" style={{ fontFamily: F }}>Notes</span>
          </div>
          <div
            className="rounded-xl px-3 py-3 border border-dashed border-border min-h-[64px]"
            style={{ background: "#111" }}
          >
            <p className="text-muted-foreground text-xs" style={{ fontFamily: F }}>
              Felt strong in the first 5km, legs a bit heavy on the last stretch. Good negative split overall.
            </p>
          </div>
        </Card>

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
