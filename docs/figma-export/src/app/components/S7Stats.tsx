import { F, FC, G, NavBar, StatusBar, SectionLabel, Card, ProgressBar } from "./shared";

const weeklyKm  = [42, 55, 38, 61, 70, 48, 65];
const weeklyPace = [5.2, 5.1, 5.3, 5.0, 4.9, 5.1, 4.85];
const months     = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];
const monthlyKm  = [120, 145, 98, 162, 188, 148];

export function S7Stats() {
  const maxKm   = Math.max(...weeklyKm);
  const maxMKm  = Math.max(...monthlyKm);

  return (
    <div className="flex flex-col h-full bg-background">
      <StatusBar />

      <div className="px-5 pt-2 pb-4 shrink-0">
        <h1 className="text-foreground" style={{ fontFamily: FC, fontSize: "1.625rem", fontWeight: 800 }}>Statistics</h1>
        <p className="text-muted-foreground text-xs mt-0.5" style={{ fontFamily: F }}>Jun 2026 · All sports</p>
      </div>

      <div className="flex-1 overflow-y-auto px-5 pb-4" style={{ scrollbarWidth: "none" }}>

        {/* Global totals */}
        <Card className="px-5 py-4 mb-4" gradient={G.cardAlt}>
          <div className="flex items-center justify-around">
            {[{ v: "68", l: "Workouts" }, { v: "861 km", l: "Total dist." }, { v: "82h 14m", l: "Train. time" }].map((s) => (
              <div key={s.l} className="flex flex-col items-center gap-0.5">
                <span className="text-foreground" style={{ fontFamily: FC, fontSize: "1.25rem", fontWeight: 800, lineHeight: 1 }}>{s.v}</span>
                <span className="text-muted-foreground text-[9px] font-semibold uppercase tracking-wider" style={{ fontFamily: F }}>{s.l}</span>
              </div>
            ))}
          </div>
        </Card>

        {/* Weekly km bar chart */}
        <SectionLabel>Weekly Distance — km</SectionLabel>
        <Card className="px-4 pt-4 pb-4 mb-4" gradient={G.card}>
          <div className="flex items-end gap-2" style={{ height: 72 }}>
            {weeklyKm.map((km, i) => {
              const h = Math.round((km / maxKm) * 60);
              return (
                <div key={i} className="flex-1 flex flex-col items-center gap-1.5">
                  <div className="flex items-end w-full" style={{ height: 60 }}>
                    <div
                      className="w-full rounded-t-sm"
                      style={{ height: `${h}px`, background: G.bar }}
                    />
                  </div>
                  <span className="text-muted-foreground text-[8px] font-semibold" style={{ fontFamily: F }}>
                    Wk{i + 1}
                  </span>
                </div>
              );
            })}
          </div>
          <div className="flex justify-between mt-1">
            <span className="text-muted-foreground text-[9px]" style={{ fontFamily: F }}>Min: {Math.min(...weeklyKm)} km</span>
            <span className="text-muted-foreground text-[9px]" style={{ fontFamily: F }}>Avg: {(weeklyKm.reduce((a,b)=>a+b,0)/weeklyKm.length).toFixed(1)} km</span>
            <span className="text-muted-foreground text-[9px]" style={{ fontFamily: F }}>Max: {maxKm} km</span>
          </div>
        </Card>

        {/* Pace evolution */}
        <SectionLabel>Average Pace — min/km</SectionLabel>
        <Card className="px-4 pt-4 pb-4 mb-4" gradient={G.card}>
          <div className="flex items-end gap-2 relative" style={{ height: 56 }}>
            {/* SVG line */}
            <svg className="absolute inset-0" width="100%" height="56" preserveAspectRatio="none">
              <defs>
                <linearGradient id="paceGrad" x1="0" y1="0" x2="1" y2="0">
                  <stop offset="0%" stopColor="#888" />
                  <stop offset="100%" stopColor="#e8e8e8" />
                </linearGradient>
              </defs>
              <polyline
                points={weeklyPace.map((p, i) => {
                  const x = (i / (weeklyPace.length - 1)) * 100;
                  const y = ((p - 4.8) / (5.4 - 4.8)) * 44 + 6;
                  return `${x}%,${y}`;
                }).join(" ")}
                fill="none"
                stroke="url(#paceGrad)"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
              />
              {weeklyPace.map((p, i) => {
                const x = (i / (weeklyPace.length - 1)) * 100;
                const y = ((p - 4.8) / (5.4 - 4.8)) * 44 + 6;
                return <circle key={i} cx={`${x}%`} cy={y} r="3" fill="#d0d0d0" />;
              })}
            </svg>
          </div>
          <div className="flex justify-between mt-2">
            <span className="text-muted-foreground text-[9px]" style={{ fontFamily: F }}>Best: 4:51/km</span>
            <span className="text-foreground text-[9px] font-bold" style={{ fontFamily: FC }}>↓ Improving</span>
          </div>
        </Card>

        {/* Monthly distance */}
        <SectionLabel>Monthly Distance — km</SectionLabel>
        <Card className="px-4 pt-4 pb-4 mb-4" gradient={G.card}>
          <div className="flex items-end gap-2" style={{ height: 80 }}>
            {monthlyKm.map((km, i) => {
              const h = Math.round((km / maxMKm) * 64);
              return (
                <div key={i} className="flex-1 flex flex-col items-center gap-1.5">
                  <div className="flex items-end w-full" style={{ height: 64 }}>
                    <div
                      className="w-full rounded-t-sm"
                      style={{ height: `${h}px`, background: i === months.length - 1 ? G.bar : "linear-gradient(180deg, #3a3a3a 0%, #1e1e1e 100%)" }}
                    />
                  </div>
                  <span className="text-muted-foreground text-[8px] font-semibold" style={{ fontFamily: F }}>{months[i]}</span>
                </div>
              );
            })}
          </div>
        </Card>

        {/* Strength stats */}
        <SectionLabel>Strength — Last 30 days</SectionLabel>
        <div className="grid grid-cols-2 gap-2 mb-4">
          {[
            { v: "14",     l: "Sessions" },
            { v: "22.4t",  l: "Vol. lifted" },
            { v: "↑ 8%",   l: "Vol. vs prev." },
            { v: "85 kg",  l: "Bench 1RM est." },
          ].map((s) => (
            <Card key={s.l} className="px-4 py-3" gradient={G.card}>
              <span className="text-foreground block" style={{ fontFamily: FC, fontSize: "1.25rem", fontWeight: 800, lineHeight: 1 }}>{s.v}</span>
              <span className="text-muted-foreground text-[10px] font-semibold uppercase tracking-wider mt-1 block" style={{ fontFamily: F }}>{s.l}</span>
            </Card>
          ))}
        </div>

        {/* PR tracker */}
        <SectionLabel>Personal Records</SectionLabel>
        <Card className="px-4 py-4 mb-4" gradient={G.card}>
          {[
            { ex: "5 km",       val: "24:10",   date: "May 14" },
            { ex: "10 km",      val: "50:22",   date: "Apr 28" },
            { ex: "Bench 1RM",  val: "85 kg",   date: "Jun 8" },
            { ex: "Squat 1RM",  val: "110 kg",  date: "May 30" },
          ].map((pr, i) => (
            <div key={i} className="flex items-center justify-between py-2.5 border-b border-border last:border-0">
              <span className="text-foreground text-sm font-semibold" style={{ fontFamily: F }}>{pr.ex}</span>
              <div className="flex items-center gap-3">
                <span className="text-muted-foreground text-[10px]" style={{ fontFamily: F }}>{pr.date}</span>
                <span className="text-foreground font-bold" style={{ fontFamily: FC, fontSize: "0.9375rem" }}>{pr.val}</span>
              </div>
            </div>
          ))}
        </Card>

        {/* Sport split */}
        <SectionLabel>Activity Split</SectionLabel>
        <Card className="px-4 py-4 mb-4" gradient={G.card}>
          {[{ l: "Running", pct: 52, km: "448 km" }, { l: "Cycling", pct: 28, km: "241 km" }, { l: "Strength", pct: 14, km: "14 sess." }, { l: "Trail", pct: 6, km: "52 km" }].map((s) => (
            <div key={s.l} className="mb-3 last:mb-0">
              <div className="flex justify-between mb-1.5">
                <span className="text-foreground text-xs font-semibold" style={{ fontFamily: F }}>{s.l}</span>
                <div className="flex items-center gap-2">
                  <span className="text-muted-foreground text-[10px]" style={{ fontFamily: F }}>{s.km}</span>
                  <span className="text-foreground text-[10px] font-bold" style={{ fontFamily: FC }}>{s.pct}%</span>
                </div>
              </div>
              <ProgressBar pct={s.pct} height={5} />
            </div>
          ))}
        </Card>
      </div>

      <NavBar active="stats" />
    </div>
  );
}
