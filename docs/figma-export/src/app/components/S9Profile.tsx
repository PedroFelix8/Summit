import { User, ChevronRight, Activity, Dumbbell, Mountain, Bike, Bell, Shield, HelpCircle, LogOut } from "lucide-react";
import { F, FC, G, NavBar, StatusBar, SectionLabel, Card, ProgressBar } from "./shared";

const sports = [
  { icon: <Activity size={14}/>, label: "Running",  active: true },
  { icon: <Bike size={14}/>,     label: "Cycling",  active: true },
  { icon: <Mountain size={14}/>, label: "Trail",    active: true },
  { icon: <Dumbbell size={14}/>, label: "Strength", active: false },
];

const menuItems = [
  { icon: <Bell size={15}/>,      label: "Notifications",  right: "On" },
  { icon: <Shield size={15}/>,    label: "Privacy & Data", right: null },
  { icon: <HelpCircle size={15}/>,label: "Help & Support", right: null },
];

export function S9Profile() {
  return (
    <div className="flex flex-col h-full bg-background">
      <StatusBar />

      {/* Hero */}
      <div
        className="px-5 pt-2 pb-5 shrink-0"
        style={{ background: G.hero, borderBottom: "1px solid #1e1e1e" }}
      >
        <div className="flex items-center gap-4">
          <div
            className="rounded-full border-2 border-border flex items-center justify-center shrink-0"
            style={{ width: 60, height: 60, background: "linear-gradient(135deg, #2a2a2a 0%, #1a1a1a 100%)" }}
          >
            <User size={28} className="text-muted-foreground" />
          </div>
          <div className="flex-1">
            <h1 className="text-foreground" style={{ fontFamily: FC, fontSize: "1.375rem", fontWeight: 800 }}>Marcus Elliot</h1>
            <p className="text-muted-foreground text-xs mt-0.5" style={{ fontFamily: F }}>marcus.elliot@email.com</p>
          </div>
          <button
            className="text-muted-foreground text-xs font-semibold uppercase tracking-wider px-3 py-1.5 rounded-lg"
            style={{ fontFamily: F, background: "#1e1e1e", border: "1px solid #2a2a2a" }}
          >
            Edit
          </button>
        </div>

        {/* Quick stats */}
        <div className="flex gap-2 mt-4">
          {[{ v: "68", l: "Workouts" }, { v: "861 km", l: "Distance" }, { v: "82h", l: "Time" }].map((s) => (
            <div key={s.l} className="flex-1 flex flex-col items-center gap-0.5 py-2.5 rounded-xl" style={{ background: "#1a1a1a", border: "1px solid #262626" }}>
              <span className="text-foreground" style={{ fontFamily: FC, fontSize: "1.0625rem", fontWeight: 800, lineHeight: 1 }}>{s.v}</span>
              <span className="text-muted-foreground text-[9px] font-semibold uppercase tracking-wider" style={{ fontFamily: F }}>{s.l}</span>
            </div>
          ))}
        </div>
      </div>

      <div className="flex-1 overflow-y-auto px-5 pt-5 pb-4" style={{ scrollbarWidth: "none" }}>

        {/* Preferred sports */}
        <SectionLabel>Preferred Sports</SectionLabel>
        <div className="flex gap-2 mb-5">
          {sports.map((s) => (
            <button
              key={s.label}
              className="flex-1 flex flex-col items-center gap-1.5 py-3 rounded-xl"
              style={{
                background: s.active ? G.accent : G.pill,
                border: s.active ? "1px solid #555" : "1px solid #2a2a2a",
              }}
            >
              <div className={s.active ? "text-primary-foreground" : "text-muted-foreground"}>{s.icon}</div>
              <span
                className={`text-[9px] font-bold uppercase tracking-wider ${s.active ? "text-primary-foreground" : "text-muted-foreground"}`}
                style={{ fontFamily: F }}
              >
                {s.label}
              </span>
            </button>
          ))}
        </div>

        {/* This year */}
        <SectionLabel>2026 Progress</SectionLabel>
        <Card className="px-4 py-4 mb-5" gradient={G.card}>
          {[{ l: "Running",  pct: 62, val: "448 km" }, { l: "Cycling", pct: 28, val: "241 km" }, { l: "Strength", pct: 10, val: "14 sess." }].map((s) => (
            <div key={s.l} className="mb-3 last:mb-0">
              <div className="flex justify-between mb-1.5">
                <span className="text-foreground text-xs font-semibold" style={{ fontFamily: F }}>{s.l}</span>
                <span className="text-muted-foreground text-[10px]" style={{ fontFamily: F }}>{s.val}</span>
              </div>
              <ProgressBar pct={s.pct} height={5} />
            </div>
          ))}
        </Card>

        {/* Strava connection promo */}
        <Card
          className="px-4 py-4 mb-5 flex items-center gap-3"
          gradient="linear-gradient(145deg, #1e1e26 0%, #111116 100%)"
          style={{ border: "1px solid #2e2e3e" }}
        >
          <div className="rounded-xl flex items-center justify-center shrink-0" style={{ width: 36, height: 36, background: "#2a2a3e", border: "1px solid #3a3a52" }}>
            <svg width="18" height="18" viewBox="0 0 32 32" fill="none">
              <path d="M12 4L6 18H10L12 14L14 18H18L12 4Z" fill="#fff" fillOpacity="0.8"/>
              <path d="M18 14L16 18H20L22 22L24 18H28L22 6L18 14Z" fill="#fff" fillOpacity="0.5"/>
            </svg>
          </div>
          <div className="flex-1">
            <p className="text-foreground text-sm font-bold" style={{ fontFamily: F }}>Connect Strava</p>
            <p className="text-muted-foreground text-[10px] mt-0.5" style={{ fontFamily: F }}>Sync your activities automatically</p>
          </div>
          <ChevronRight size={15} className="text-muted-foreground" />
        </Card>

        {/* Settings */}
        <SectionLabel>Settings</SectionLabel>
        <Card className="px-4 mb-5" gradient={G.card}>
          {menuItems.map((item, i) => (
            <div key={item.label} className={`flex items-center gap-3 py-3.5 ${i < menuItems.length - 1 ? "border-b border-border" : ""}`}>
              <div className="text-muted-foreground">{item.icon}</div>
              <span className="text-foreground text-sm font-medium flex-1" style={{ fontFamily: F }}>{item.label}</span>
              {item.right && <span className="text-muted-foreground text-xs" style={{ fontFamily: F }}>{item.right}</span>}
              <ChevronRight size={14} className="text-muted-foreground" />
            </div>
          ))}
        </Card>

        {/* Log out */}
        <button
          className="w-full flex items-center justify-center gap-2 rounded-xl py-3.5"
          style={{ background: "#1a1010", border: "1px solid #2e1e1e" }}
        >
          <LogOut size={15} className="text-muted-foreground" />
          <span className="text-muted-foreground text-sm font-semibold uppercase tracking-wider" style={{ fontFamily: F }}>Log Out</span>
        </button>
      </div>

      <NavBar active="profile" />
    </div>
  );
}
