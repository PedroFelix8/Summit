import { ChevronRight, Flame, Timer, MapPin, Dumbbell, Activity } from "lucide-react";
import { F, FC, G, NavBar, StatusBar, SectionLabel, Card, ProgressBar, BigMetric, Pill } from "./shared";

const recentWorkouts = [
  { type: "run",      icon: <Activity size={14}/>, label: "Morning Run",      date: "Today",       dist: "8.4 km",  time: "42:30", pace: "5:03/km" },
  { type: "strength", icon: <Dumbbell size={14}/>, label: "Upper Body",       date: "Yesterday",   dist: "—",       time: "55:00", pace: "—" },
  { type: "cycle",    icon: <Activity size={14}/>, label: "Afternoon Ride",   date: "Mon, Jun 9",  dist: "34.2 km", time: "1:08:14", pace: "29.8 km/h" },
  { type: "run",      icon: <Activity size={14}/>, label: "Tempo Run",        date: "Sun, Jun 8",  dist: "6.0 km",  time: "28:12", pace: "4:42/km" },
];

export function S1Home() {
  return (
    <div className="flex flex-col h-full bg-background">
      <StatusBar />

      {/* Hero header */}
      <div
        className="px-5 pt-2 pb-5 shrink-0"
        style={{ background: G.hero, borderBottom: "1px solid #1e1e1e" }}
      >
        <p className="text-muted-foreground text-xs font-semibold uppercase tracking-widest" style={{ fontFamily: F }}>
          Good morning
        </p>
        <h1 className="text-foreground mt-0.5" style={{ fontFamily: FC, fontSize: "1.625rem", fontWeight: 800, lineHeight: 1.1 }}>
          Marcus
        </h1>

        {/* Weekly summary card */}
        <Card className="mt-4 px-5 py-4" gradient={G.cardAlt}>
          <p className="text-muted-foreground text-[10px] font-bold uppercase tracking-widest mb-3" style={{ fontFamily: F }}>
            Week of Jun 9–15
          </p>
          <div className="flex items-center justify-around">
            <BigMetric value="4" label="Workouts" />
            <div className="w-px h-10 bg-border" />
            <BigMetric value="48.6" label="km" sub="this week" />
            <div className="w-px h-10 bg-border" />
            <BigMetric value="3h 24m" label="Time" />
          </div>
          <div className="mt-4 pt-3 border-t border-border">
            <div className="flex justify-between mb-1.5">
              <span className="text-muted-foreground text-[10px] font-semibold uppercase tracking-wider" style={{ fontFamily: F }}>Weekly goal</span>
              <span className="text-foreground text-[10px] font-bold" style={{ fontFamily: FC }}>64%</span>
            </div>
            <ProgressBar pct={64} height={5} />
          </div>
        </Card>
      </div>

      {/* Scrollable body */}
      <div className="flex-1 overflow-y-auto px-5 pt-5 pb-2" style={{ scrollbarWidth: "none" }}>

        {/* Quick stats row */}
        <div className="flex gap-2 mb-5">
          {[
            { icon: <MapPin size={13}/>,  value: "214 km", label: "This month" },
            { icon: <Timer size={13}/>,   value: "18h 40m", label: "Train. time" },
            { icon: <Flame size={13}/>,   value: "12",      label: "Streak days" },
          ].map((s) => (
            <Card key={s.label} className="flex-1 px-3 py-3 flex flex-col items-center gap-1.5">
              <div className="text-muted-foreground">{s.icon}</div>
              <span className="text-foreground" style={{ fontFamily: FC, fontSize: "1rem", fontWeight: 700, lineHeight: 1 }}>{s.value}</span>
              <span className="text-muted-foreground text-[9px] font-semibold uppercase tracking-wider text-center" style={{ fontFamily: F }}>{s.label}</span>
            </Card>
          ))}
        </div>

        {/* Recent workouts */}
        <SectionLabel>Recent Workouts</SectionLabel>
        <div className="flex flex-col gap-2">
          {recentWorkouts.map((w, i) => (
            <Card key={i} className="px-4 py-3 flex items-center gap-3">
              <div
                className="flex items-center justify-center rounded-xl shrink-0"
                style={{ width: 36, height: 36, background: G.pill, border: "1px solid #2a2a2a" }}
              >
                <div className="text-muted-foreground">{w.icon}</div>
              </div>
              <div className="flex-1 min-w-0">
                <p className="text-foreground text-sm font-semibold leading-tight" style={{ fontFamily: F }}>{w.label}</p>
                <div className="flex items-center gap-2 mt-0.5">
                  <span className="text-muted-foreground text-[10px]" style={{ fontFamily: F }}>{w.date}</span>
                  {w.dist !== "—" && (
                    <>
                      <span className="text-border">·</span>
                      <span className="text-muted-foreground text-[10px]" style={{ fontFamily: F }}>{w.dist}</span>
                    </>
                  )}
                  <span className="text-border">·</span>
                  <span className="text-muted-foreground text-[10px]" style={{ fontFamily: F }}>{w.time}</span>
                </div>
              </div>
              <ChevronRight size={15} className="text-muted-foreground shrink-0" />
            </Card>
          ))}
        </div>

        {/* Sport pills */}
        <div className="flex gap-2 mt-5 mb-1">
          <Pill filled>Running</Pill>
          <Pill>Cycling</Pill>
          <Pill>Strength</Pill>
        </div>

        <div style={{ height: 20 }} />
      </div>

      <NavBar active="home" onFab={() => {}} />
    </div>
  );
}
