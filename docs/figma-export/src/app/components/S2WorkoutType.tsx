import { Activity, Dumbbell, ChevronRight } from "lucide-react";
import { F, FC, G, StatusBar, Card } from "./shared";

export function S2WorkoutType() {
  return (
    <div className="flex flex-col h-full bg-background">
      <StatusBar />

      {/* Header */}
      <div className="px-5 pt-2 pb-6 shrink-0">
        <button className="flex items-center gap-1.5 text-muted-foreground mb-4" style={{ fontFamily: F, fontSize: "0.8125rem", fontWeight: 600 }}>
          <svg width="7" height="12" viewBox="0 0 7 12" fill="none"><path d="M6 1L1 6L6 11" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/></svg>
          Cancel
        </button>
        <h1 className="text-foreground" style={{ fontFamily: FC, fontSize: "1.75rem", fontWeight: 800, lineHeight: 1.1 }}>
          New Workout
        </h1>
        <p className="text-muted-foreground text-sm mt-1" style={{ fontFamily: F }}>
          Choose the type of session to log
        </p>
      </div>

      {/* Type cards */}
      <div className="flex-1 px-5 flex flex-col gap-4 justify-center pb-16">

        {/* Endurance */}
        <Card
          gradient="linear-gradient(145deg, #1f1f28 0%, #131318 100%)"
          className="p-6 cursor-pointer active:scale-[0.98] transition-transform"
          style={{ border: "1px solid #2e2e3e" }}
        >
          <div className="flex items-start justify-between">
            <div
              className="flex items-center justify-center rounded-2xl"
              style={{ width: 52, height: 52, background: "linear-gradient(135deg, #2e2e42 0%, #1a1a28 100%)", border: "1px solid #3a3a52" }}
            >
              <Activity size={24} className="text-foreground" />
            </div>
            <ChevronRight size={20} className="text-muted-foreground mt-1" />
          </div>
          <h2 className="text-foreground mt-4" style={{ fontFamily: FC, fontSize: "1.375rem", fontWeight: 800 }}>
            Endurance
          </h2>
          <p className="text-muted-foreground text-sm mt-1" style={{ fontFamily: F }}>
            Running · Cycling · Trail Running
          </p>
          <div className="flex gap-2 mt-4">
            {["Running", "Cycling", "Trail"].map((t) => (
              <span
                key={t}
                className="text-[10px] font-semibold uppercase tracking-wide px-2 py-1 rounded-full"
                style={{ fontFamily: F, background: "#2a2a3a", color: "#888", border: "1px solid #333" }}
              >
                {t}
              </span>
            ))}
          </div>
        </Card>

        {/* Strength */}
        <Card
          gradient="linear-gradient(145deg, #1e201e 0%, #121412 100%)"
          className="p-6 cursor-pointer active:scale-[0.98] transition-transform"
          style={{ border: "1px solid #2a302a" }}
        >
          <div className="flex items-start justify-between">
            <div
              className="flex items-center justify-center rounded-2xl"
              style={{ width: 52, height: 52, background: "linear-gradient(135deg, #2a322a 0%, #181e18 100%)", border: "1px solid #344034" }}
            >
              <Dumbbell size={24} className="text-foreground" />
            </div>
            <ChevronRight size={20} className="text-muted-foreground mt-1" />
          </div>
          <h2 className="text-foreground mt-4" style={{ fontFamily: FC, fontSize: "1.375rem", fontWeight: 800 }}>
            Strength
          </h2>
          <p className="text-muted-foreground text-sm mt-1" style={{ fontFamily: F }}>
            Gym sessions · Free weights · Machines
          </p>
          <div className="flex gap-2 mt-4">
            {["Upper", "Lower", "Full body"].map((t) => (
              <span
                key={t}
                className="text-[10px] font-semibold uppercase tracking-wide px-2 py-1 rounded-full"
                style={{ fontFamily: F, background: "#202a20", color: "#888", border: "1px solid #2a342a" }}
              >
                {t}
              </span>
            ))}
          </div>
        </Card>

        {/* Hint */}
        <p className="text-muted-foreground text-xs text-center mt-2" style={{ fontFamily: F }}>
          More sport types coming soon
        </p>
      </div>
    </div>
  );
}
