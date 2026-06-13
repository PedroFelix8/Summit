import { ChevronRight, Activity, Dumbbell, Mountain, Bike } from "lucide-react";
import { F, FC, G, NavBar, StatusBar, SectionLabel, Card } from "./shared";

type WType = "run" | "cycle" | "trail" | "strength";

interface WItem {
  type: WType;
  name: string;
  date: string;
  primary: string;
  secondary: string;
  duration: string;
}

const ICON: Record<WType, React.ReactNode> = {
  run:      <Activity size={15} />,
  cycle:    <Bike size={15} />,
  trail:    <Mountain size={15} />,
  strength: <Dumbbell size={15} />,
};

const TYPE_LABEL: Record<WType, string> = {
  run: "Run", cycle: "Cycle", trail: "Trail", strength: "Strength",
};

const workouts: WItem[] = [
  { type: "run",      name: "Morning Run",       date: "Thu, Jun 12",  primary: "8.4 km",  secondary: "5:03/km", duration: "42:30" },
  { type: "strength", name: "Upper Body — Push",  date: "Wed, Jun 11",  primary: "3 exer.", secondary: "9 sets",  duration: "55:00" },
  { type: "cycle",    name: "Afternoon Ride",     date: "Mon, Jun 9",   primary: "34.2 km", secondary: "29.8 km/h", duration: "1:08:14" },
  { type: "run",      name: "Tempo Run",          date: "Sun, Jun 8",   primary: "6.0 km",  secondary: "4:42/km", duration: "28:12" },
  { type: "trail",    name: "Weekend Trail",      date: "Sat, Jun 7",   primary: "12.3 km", secondary: "+480 m",  duration: "1:22:05" },
  { type: "strength", name: "Lower Body — Squat", date: "Fri, Jun 6",   primary: "4 exer.", secondary: "12 sets", duration: "1:00:00" },
  { type: "run",      name: "Easy Zone 2",        date: "Thu, Jun 5",   primary: "10.1 km", secondary: "5:38/km", duration: "56:58" },
  { type: "cycle",    name: "Interval Ride",      date: "Tue, Jun 3",   primary: "28.0 km", secondary: "32.1 km/h", duration: "52:20" },
];

const grouped: Record<string, WItem[]> = {};
workouts.forEach((w) => {
  const key = w.date.includes("Jun 12") || w.date.includes("Jun 11") || w.date.includes("Jun 9")
    ? "This week — Jun 9–15"
    : "Last week — Jun 2–8";
  if (!grouped[key]) grouped[key] = [];
  grouped[key].push(w);
});

export function S5History() {
  return (
    <div className="flex flex-col h-full bg-background">
      <StatusBar />

      <div className="px-5 pt-2 pb-4 shrink-0">
        <h1 className="text-foreground" style={{ fontFamily: FC, fontSize: "1.625rem", fontWeight: 800 }}>History</h1>
        <p className="text-muted-foreground text-xs font-medium mt-0.5" style={{ fontFamily: F }}>
          {workouts.length} workouts logged
        </p>
      </div>

      {/* Month summary card */}
      <div className="px-5 mb-4 shrink-0">
        <Card className="px-5 py-4" gradient={G.cardAlt}>
          <p className="text-muted-foreground text-[10px] font-bold uppercase tracking-widest mb-3" style={{ fontFamily: F }}>June 2026</p>
          <div className="flex items-center justify-around">
            {[{ v: "12", l: "Workouts" }, { v: "148 km", l: "Distance" }, { v: "14h 20m", l: "Time" }].map((s) => (
              <div key={s.l} className="flex flex-col items-center gap-0.5">
                <span className="text-foreground" style={{ fontFamily: FC, fontSize: "1.25rem", fontWeight: 800, lineHeight: 1 }}>{s.v}</span>
                <span className="text-muted-foreground text-[9px] font-semibold uppercase tracking-wider" style={{ fontFamily: F }}>{s.l}</span>
              </div>
            ))}
          </div>
        </Card>
      </div>

      <div className="flex-1 overflow-y-auto px-5 pb-4" style={{ scrollbarWidth: "none" }}>
        {Object.entries(grouped).map(([week, items]) => (
          <div key={week} className="mb-5">
            <SectionLabel>{week}</SectionLabel>
            <div className="flex flex-col gap-2">
              {items.map((w, i) => (
                <Card key={i} className="px-4 py-3 flex items-center gap-3">
                  <div
                    className="flex items-center justify-center rounded-xl shrink-0"
                    style={{ width: 38, height: 38, background: G.pill, border: "1px solid #2a2a2a" }}
                  >
                    <div className="text-muted-foreground">{ICON[w.type]}</div>
                  </div>
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2 mb-0.5">
                      <p className="text-foreground text-sm font-semibold leading-tight truncate" style={{ fontFamily: F }}>{w.name}</p>
                      <span
                        className="shrink-0 text-[9px] font-bold uppercase tracking-wider px-1.5 py-0.5 rounded-full"
                        style={{ fontFamily: F, background: "#222", color: "#666", border: "1px solid #2a2a2a" }}
                      >
                        {TYPE_LABEL[w.type]}
                      </span>
                    </div>
                    <div className="flex items-center gap-2">
                      <span className="text-muted-foreground text-[10px]" style={{ fontFamily: F }}>{w.date}</span>
                      <span className="text-border text-[10px]">·</span>
                      <span className="text-muted-foreground text-[10px]" style={{ fontFamily: F }}>{w.primary}</span>
                      <span className="text-border text-[10px]">·</span>
                      <span className="text-muted-foreground text-[10px]" style={{ fontFamily: F }}>{w.duration}</span>
                    </div>
                  </div>
                  <ChevronRight size={14} className="text-muted-foreground shrink-0" />
                </Card>
              ))}
            </div>
          </div>
        ))}
      </div>

      <NavBar active="history" />
    </div>
  );
}
