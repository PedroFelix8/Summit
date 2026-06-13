import { Plus, ChevronRight, CheckCircle } from "lucide-react";
import { F, FC, G, NavBar, StatusBar, SectionLabel, Card, ProgressBar } from "./shared";

interface Goal {
  id: number;
  name: string;
  pct: number;
  current: string;
  target: string;
  deadline: string;
  done: boolean;
  category: "endurance" | "strength" | "frequency";
}

const goals: Goal[] = [
  { id: 1, name: "Run 100 km this month",    pct: 78, current: "78 km",  target: "100 km", deadline: "Jun 30",  done: false, category: "endurance" },
  { id: 2, name: "Train 20 times this month", pct: 60, current: "12",    target: "20",     deadline: "Jun 30",  done: false, category: "frequency" },
  { id: 3, name: "Bench Press 100 kg",        pct: 85, current: "85 kg", target: "100 kg", deadline: "Aug 1",   done: false, category: "strength"  },
  { id: 4, name: "Cycle 200 km this month",   pct: 100, current: "204 km", target: "200 km", deadline: "Jun 30", done: true, category: "endurance" },
  { id: 5, name: "10 km sub-50 min",          pct: 100, current: "50:22", target: "50:00", deadline: "Jun 15",  done: true, category: "endurance" },
];

const CAT_COLOR: Record<Goal["category"], string> = {
  endurance: "#2a2a3e",
  strength:  "#1e2a1e",
  frequency: "#2a2020",
};

const active = goals.filter((g) => !g.done);
const done   = goals.filter((g) => g.done);

export function S8Goals() {
  return (
    <div className="flex flex-col h-full bg-background">
      <StatusBar />

      <div className="px-5 pt-2 pb-4 shrink-0 flex items-center justify-between">
        <div>
          <h1 className="text-foreground" style={{ fontFamily: FC, fontSize: "1.625rem", fontWeight: 800 }}>Goals</h1>
          <p className="text-muted-foreground text-xs mt-0.5" style={{ fontFamily: F }}>
            {active.length} active · {done.length} completed
          </p>
        </div>
        <button
          className="flex items-center justify-center rounded-full"
          style={{ width: 36, height: 36, background: G.accent, border: "1px solid #555" }}
        >
          <Plus size={18} className="text-background" />
        </button>
      </div>

      <div className="flex-1 overflow-y-auto px-5 pb-4" style={{ scrollbarWidth: "none" }}>

        {/* Progress overview */}
        <Card className="px-5 py-4 mb-5" gradient={G.cardAlt}>
          <div className="flex items-center justify-around">
            {[{ v: `${active.length}`,                                          l: "Active" },
              { v: `${Math.round(active.reduce((a,g)=>a+g.pct,0)/active.length)}%`, l: "Avg progress" },
              { v: `${done.length}`,                                             l: "Completed" }].map((s) => (
              <div key={s.l} className="flex flex-col items-center gap-0.5">
                <span className="text-foreground" style={{ fontFamily: FC, fontSize: "1.375rem", fontWeight: 800, lineHeight: 1 }}>{s.v}</span>
                <span className="text-muted-foreground text-[9px] font-semibold uppercase tracking-wider" style={{ fontFamily: F }}>{s.l}</span>
              </div>
            ))}
          </div>
        </Card>

        {/* Active goals */}
        <SectionLabel>Active Goals</SectionLabel>
        <div className="flex flex-col gap-3 mb-6">
          {active.map((g) => (
            <Card
              key={g.id}
              className="px-4 py-4"
              gradient={`linear-gradient(145deg, ${CAT_COLOR[g.category]} 0%, #111 100%)`}
              style={{ border: "1px solid #2a2a2a" }}
            >
              <div className="flex items-start justify-between mb-3">
                <div className="flex-1 pr-2">
                  <p className="text-foreground text-sm font-bold leading-snug" style={{ fontFamily: F }}>{g.name}</p>
                  <p className="text-muted-foreground text-[10px] mt-0.5" style={{ fontFamily: F }}>
                    Deadline: {g.deadline}
                  </p>
                </div>
                <ChevronRight size={15} className="text-muted-foreground shrink-0 mt-0.5" />
              </div>

              <div className="mb-2">
                <div className="flex justify-between mb-1.5">
                  <span className="text-muted-foreground text-[10px] font-semibold" style={{ fontFamily: F }}>
                    {g.current} / {g.target}
                  </span>
                  <span className="text-foreground text-[10px] font-bold" style={{ fontFamily: FC }}>{g.pct}%</span>
                </div>
                <ProgressBar pct={g.pct} height={6} />
              </div>

              {/* Mini milestone dots */}
              <div className="flex items-center gap-1 mt-2">
                {[25, 50, 75, 100].map((m) => (
                  <div key={m} className="flex items-center gap-1 flex-1">
                    <div
                      className="w-2 h-2 rounded-full"
                      style={{ background: g.pct >= m ? "#d0d0d0" : "#2a2a2a", border: "1px solid #3a3a3a" }}
                    />
                    {m < 100 && <div className="flex-1 h-px" style={{ background: g.pct > m ? "#3a3a3a" : "#222" }} />}
                  </div>
                ))}
                <span className="text-muted-foreground text-[8px] ml-1" style={{ fontFamily: F }}>100%</span>
              </div>
            </Card>
          ))}
        </div>

        {/* Completed goals */}
        <SectionLabel>Completed</SectionLabel>
        <div className="flex flex-col gap-2 mb-4">
          {done.map((g) => (
            <Card key={g.id} className="px-4 py-3 flex items-center gap-3 opacity-70" gradient={G.card}>
              <CheckCircle size={16} className="text-foreground shrink-0" />
              <div className="flex-1">
                <p className="text-foreground text-sm font-semibold" style={{ fontFamily: F }}>{g.name}</p>
                <p className="text-muted-foreground text-[10px] mt-0.5" style={{ fontFamily: F }}>
                  {g.current} · Completed {g.deadline}
                </p>
              </div>
            </Card>
          ))}
        </div>

        {/* Add new */}
        <button
          className="w-full flex items-center justify-center gap-2 rounded-xl py-4"
          style={{ background: G.pill, border: "1px dashed #333" }}
        >
          <Plus size={16} className="text-muted-foreground" />
          <span className="text-muted-foreground text-sm font-semibold uppercase tracking-wider" style={{ fontFamily: F }}>New Goal</span>
        </button>
      </div>

      <NavBar active="goals" />
    </div>
  );
}
