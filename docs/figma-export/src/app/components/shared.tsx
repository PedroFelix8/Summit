import { Home, Clock, BarChart2, Target, User, Plus } from "lucide-react";

export const F  = "'Barlow', sans-serif";
export const FC = "'Barlow Condensed', sans-serif";

// ── Gradient tokens ──────────────────────────────────────────
export const G = {
  card:    "linear-gradient(145deg, #1e1e1e 0%, #131313 100%)",
  cardAlt: "linear-gradient(145deg, #1c1c22 0%, #111116 100%)",
  hero:    "linear-gradient(180deg, #1f1f1f 0%, #0d0d0d 100%)",
  bar:     "linear-gradient(90deg, #e8e8e8 0%, #888 100%)",
  pill:    "linear-gradient(135deg, #2a2a2a 0%, #1a1a1a 100%)",
  accent:  "linear-gradient(135deg, #f0f0f0 0%, #aaa 100%)",
};

// ── Bottom navigation ─────────────────────────────────────────
const NAV = [
  { icon: <Home size={18} />,     label: "Home",    id: "home" },
  { icon: <Clock size={18} />,    label: "History", id: "history" },
  { icon: <BarChart2 size={18}/>, label: "Stats",   id: "stats" },
  { icon: <Target size={18} />,   label: "Goals",   id: "goals" },
  { icon: <User size={18} />,     label: "Profile", id: "profile" },
];

export function NavBar({ active, onFab }: { active: string; onFab?: () => void }) {
  return (
    <div className="relative shrink-0">
      {/* FAB */}
      {onFab !== undefined && (
        <button
          onClick={onFab}
          className="absolute -top-7 left-1/2 -translate-x-1/2 z-10 flex items-center justify-center rounded-full shadow-lg"
          style={{
            width: 52, height: 52,
            background: G.accent,
            border: "2px solid #333",
            boxShadow: "0 4px 20px rgba(255,255,255,0.08)",
          }}
        >
          <Plus size={22} className="text-background" />
        </button>
      )}
      <div
        className="flex items-center"
        style={{ height: 60, background: "#0c0c0c", borderTop: "1px solid #1e1e1e" }}
      >
        {NAV.map((item) => {
          const isActive = item.id === active;
          return (
            <div key={item.id} className="flex-1 flex flex-col items-center gap-0.5 py-2">
              <div className={isActive ? "text-foreground" : "text-muted-foreground"}>{item.icon}</div>
              <span
                className={`text-[9px] font-semibold uppercase tracking-wider ${isActive ? "text-foreground" : "text-muted-foreground"}`}
                style={{ fontFamily: F }}
              >
                {item.label}
              </span>
              {isActive && <div className="h-0.5 w-5 rounded-full mt-0.5" style={{ background: G.bar }} />}
            </div>
          );
        })}
      </div>
    </div>
  );
}

// ── Status bar ────────────────────────────────────────────────
export function StatusBar() {
  return (
    <div className="flex items-center justify-between px-5 pt-3 pb-1 shrink-0">
      <span className="text-xs text-muted-foreground" style={{ fontFamily: F }}>09:41</span>
      <div className="flex gap-1 items-center">
        <div className="h-2 w-5 border border-muted-foreground rounded-sm relative">
          <div className="absolute inset-0.5 right-1.5 bg-foreground rounded-sm" />
        </div>
      </div>
    </div>
  );
}

// ── Section label ─────────────────────────────────────────────
export function SectionLabel({ children }: { children: React.ReactNode }) {
  return (
    <p
      className="text-muted-foreground text-[10px] font-bold uppercase tracking-widest mb-3"
      style={{ fontFamily: F }}
    >
      {children}
    </p>
  );
}

// ── Gradient card ─────────────────────────────────────────────
export function Card({
  children,
  className = "",
  style = {},
  gradient = G.card,
}: {
  children: React.ReactNode;
  className?: string;
  style?: React.CSSProperties;
  gradient?: string;
}) {
  return (
    <div
      className={`rounded-2xl ${className}`}
      style={{ background: gradient, border: "1px solid #262626", ...style }}
    >
      {children}
    </div>
  );
}

// ── Progress bar ──────────────────────────────────────────────
export function ProgressBar({ pct, height = 6 }: { pct: number; height?: number }) {
  return (
    <div className="bg-muted rounded-full overflow-hidden" style={{ height }}>
      <div
        className="h-full rounded-full"
        style={{ width: `${pct}%`, background: G.bar, transition: "width 0.4s" }}
      />
    </div>
  );
}

// ── Pill badge ────────────────────────────────────────────────
export function Pill({
  children,
  filled = false,
  small = false,
}: {
  children: React.ReactNode;
  filled?: boolean;
  small?: boolean;
}) {
  return (
    <span
      className={`inline-flex items-center gap-1 rounded-full font-semibold uppercase tracking-wider ${
        small ? "px-2 py-0.5 text-[9px]" : "px-2.5 py-1 text-[11px]"
      } ${filled ? "bg-foreground text-primary-foreground" : ""}`}
      style={{
        fontFamily: F,
        background: filled ? undefined : G.pill,
        color: filled ? undefined : "#888",
        border: filled ? undefined : "1px solid #2a2a2a",
      }}
    >
      {children}
    </span>
  );
}

// ── Big metric ────────────────────────────────────────────────
export function BigMetric({ value, label, sub }: { value: string; label: string; sub?: string }) {
  return (
    <div className="flex flex-col items-center gap-0.5">
      <span className="text-foreground" style={{ fontFamily: FC, fontSize: "1.625rem", fontWeight: 800, lineHeight: 1 }}>
        {value}
      </span>
      <span className="text-muted-foreground text-[10px] font-semibold uppercase tracking-wider" style={{ fontFamily: F }}>
        {label}
      </span>
      {sub && <span className="text-muted-foreground text-[9px]" style={{ fontFamily: F }}>{sub}</span>}
    </div>
  );
}

// ── Back header ───────────────────────────────────────────────
export function BackHeader({ title, right }: { title: string; right?: React.ReactNode }) {
  return (
    <div className="px-5 pt-2 pb-4 shrink-0 flex items-center justify-between">
      <button
        className="flex items-center gap-1.5 text-muted-foreground"
        style={{ fontFamily: F, fontSize: "0.8125rem", fontWeight: 600 }}
      >
        <svg width="7" height="12" viewBox="0 0 7 12" fill="none">
          <path d="M6 1L1 6L6 11" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
        </svg>
        Back
      </button>
      <h2 className="text-foreground" style={{ fontFamily: FC, fontSize: "1rem", fontWeight: 700 }}>{title}</h2>
      <div style={{ minWidth: 48 }} className="flex justify-end">{right}</div>
    </div>
  );
}
