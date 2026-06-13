// Sport Tracker — 10-screen wireframe canvas
import { S1Home }         from "./components/S1Home";
import { S2WorkoutType }  from "./components/S2WorkoutType";
import { S3Endurance }    from "./components/S3Endurance";
import { S4Strength }     from "./components/S4Strength";
import { S5History }      from "./components/S5History";
import { S6Details }      from "./components/S6Details";
import { S7Stats }        from "./components/S7Stats";
import { S8Goals }        from "./components/S8Goals";
import { S9Profile }      from "./components/S9Profile";
import { S10Strava }      from "./components/S10Strava";
import { F, FC }          from "./components/shared";

/* MARKER-MAKE-KIT-INVOKED */

// ── Types ─────────────────────────────────────────────────────
interface ScreenDef {
  id: string;
  label: string;
  component: React.ReactNode;
  group: "main" | "workout" | "detail";
}

// ── Flow arrows ───────────────────────────────────────────────
function Arrow({ dir = "h" }: { dir?: "h" | "v" }) {
  if (dir === "v") {
    return (
      <div className="flex flex-col items-center gap-0.5 self-center" style={{ height: 32 }}>
        <div className="w-px flex-1" style={{ background: "#222" }} />
        <svg width="10" height="6" viewBox="0 0 10 6" fill="none">
          <path d="M1 1L5 5L9 1" stroke="#333" strokeWidth="1.5" strokeLinecap="round" />
        </svg>
      </div>
    );
  }
  return (
    <div className="flex items-center gap-0.5 self-center shrink-0" style={{ marginTop: -32 }}>
      <div className="h-px" style={{ width: 24, background: "#222" }} />
      <svg width="12" height="10" viewBox="0 0 12 10" fill="none">
        <path d="M7 1L11 5L7 9M1 5H11" stroke="#333" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
      </svg>
      <div className="h-px" style={{ width: 24, background: "#222" }} />
    </div>
  );
}

// ── Phone frame ───────────────────────────────────────────────
function PhoneFrame({ id, label, children }: { id: string; label: string; children: React.ReactNode }) {
  return (
    <div className="flex flex-col items-center gap-3 shrink-0">
      {/* Label */}
      <div className="flex items-center gap-2" style={{ width: 320 }}>
        <span style={{ fontFamily: FC, fontSize: "0.6875rem", fontWeight: 700, color: "#555", letterSpacing: "0.08em", textTransform: "uppercase" }}>
          {id}
        </span>
        <div className="flex-1 h-px" style={{ background: "#1e1e1e" }} />
        <span style={{ fontFamily: F, fontSize: "0.625rem", fontWeight: 600, color: "#444", letterSpacing: "0.06em", textTransform: "uppercase" }}>
          {label}
        </span>
      </div>

      {/* Shell */}
      <div
        style={{
          width: 320,
          height: 693,
          borderRadius: 36,
          border: "1.5px solid #252525",
          background: "#0a0a0a",
          overflow: "hidden",
          boxShadow: "0 0 0 5px #0f0f0f, 0 20px 56px rgba(0,0,0,0.9), inset 0 0 0 1px #1e1e1e",
          position: "relative",
          display: "flex",
          flexDirection: "column",
          transform: "scale(0.8205)",
          transformOrigin: "top center",
        }}
      >
        {/* Notch */}
        <div
          style={{
            position: "absolute",
            top: 0,
            left: "50%",
            transform: "translateX(-50%)",
            width: 96,
            height: 28,
            background: "#0a0a0a",
            borderBottomLeftRadius: 14,
            borderBottomRightRadius: 14,
            zIndex: 20,
          }}
        />
        {children}
      </div>

      <span style={{ fontFamily: F, fontSize: "0.5625rem", fontWeight: 600, color: "#2e2e2e", letterSpacing: "0.1em", textTransform: "uppercase" }}>
        iPhone 14 · 390×844
      </span>
    </div>
  );
}

// ── Row of frames ─────────────────────────────────────────────
function ScreenRow({ screens, arrows = true }: { screens: ScreenDef[]; arrows?: boolean }) {
  return (
    <div className="flex items-start gap-2">
      {screens.map((s, i) => (
        <div key={s.id} className="flex items-center gap-2">
          <PhoneFrame id={s.id} label={s.label}>
            {s.component}
          </PhoneFrame>
          {arrows && i < screens.length - 1 && <Arrow />}
        </div>
      ))}
    </div>
  );
}

// ── App ───────────────────────────────────────────────────────
const ROW1: ScreenDef[] = [
  { id: "S1", label: "Home",           component: <S1Home />,        group: "main" },
  { id: "S2", label: "Workout Type",   component: <S2WorkoutType />, group: "workout" },
  { id: "S3", label: "Endurance",      component: <S3Endurance />,   group: "workout" },
  { id: "S4", label: "Strength",       component: <S4Strength />,    group: "workout" },
  { id: "S5", label: "History",        component: <S5History />,     group: "main" },
];

const ROW2: ScreenDef[] = [
  { id: "S6", label: "Workout Details", component: <S6Details />,   group: "detail" },
  { id: "S7", label: "Statistics",      component: <S7Stats />,     group: "main" },
  { id: "S8", label: "Goals",           component: <S8Goals />,     group: "main" },
  { id: "S9", label: "Profile",         component: <S9Profile />,   group: "main" },
  { id: "S10",label: "Strava",          component: <S10Strava />,   group: "detail" },
];

export default function App() {
  return (
    <div
      className="min-h-screen flex flex-col"
      style={{ background: "radial-gradient(ellipse at 50% 0%, #141414 0%, #060606 60%)", fontFamily: F }}
    >
      {/* Top bar */}
      <div className="shrink-0 px-10 py-5 flex items-center justify-between" style={{ borderBottom: "1px solid #141414" }}>
        <div>
          <h1 style={{ fontFamily: FC, fontSize: "1.375rem", fontWeight: 800, color: "#f0f0f0", letterSpacing: "-0.01em" }}>
            SPORT TRACKER
          </h1>
          <p style={{ fontFamily: F, fontSize: "0.625rem", fontWeight: 600, color: "#444", letterSpacing: "0.1em", textTransform: "uppercase", marginTop: 2 }}>
            App Wireframes · 10 Screens · iOS · Dark UI
          </p>
        </div>
        <div className="flex items-center gap-8">
          {[{ l: "Screens", v: "10" }, { l: "Platform", v: "iOS 17" }, { l: "Style", v: "Dark" }, { l: "Flow", v: "MVP" }].map((m) => (
            <div key={m.l} className="text-right">
              <span style={{ fontFamily: FC, fontSize: "0.9375rem", fontWeight: 700, color: "#f0f0f0", lineHeight: 1, display: "block" }}>{m.v}</span>
              <span style={{ fontFamily: F, fontSize: "0.5625rem", fontWeight: 700, color: "#444", letterSpacing: "0.1em", textTransform: "uppercase", marginTop: 3, display: "block" }}>{m.l}</span>
            </div>
          ))}
        </div>
      </div>

      {/* Scrollable canvas */}
      <div className="flex-1 overflow-auto" style={{ scrollbarWidth: "thin", scrollbarColor: "#1e1e1e #060606" }}>
        <div className="py-10 px-10 flex flex-col gap-12" style={{ minWidth: "max-content" }}>

          {/* Row labels */}
          <div>
            <div className="flex items-center gap-3 mb-6">
              <span style={{ fontFamily: F, fontSize: "0.625rem", fontWeight: 700, color: "#333", letterSpacing: "0.12em", textTransform: "uppercase" }}>
                Row 1 — Core flow
              </span>
              <div className="flex-1" style={{ height: 1, background: "#141414", maxWidth: 1400 }} />
            </div>
            <ScreenRow screens={ROW1} />
          </div>

          <div>
            <div className="flex items-center gap-3 mb-6">
              <span style={{ fontFamily: F, fontSize: "0.625rem", fontWeight: 700, color: "#333", letterSpacing: "0.12em", textTransform: "uppercase" }}>
                Row 2 — Details, stats & settings
              </span>
              <div className="flex-1" style={{ height: 1, background: "#141414", maxWidth: 1400 }} />
            </div>
            <ScreenRow screens={ROW2} />
          </div>
        </div>
      </div>

      {/* Footer legend */}
      <div className="shrink-0 px-10 py-3 flex items-center gap-8" style={{ borderTop: "1px solid #141414" }}>
        <span style={{ fontFamily: F, fontSize: "0.5625rem", fontWeight: 700, color: "#333", letterSpacing: "0.1em", textTransform: "uppercase" }}>
          Legend
        </span>
        {[
          { bg: "linear-gradient(135deg, #f0f0f0 0%, #aaa 100%)", label: "Primary CTA" },
          { bg: "linear-gradient(145deg, #1e1e1e 0%, #131313 100%)", label: "Card surface" },
          { bg: "linear-gradient(145deg, #1c1c22 0%, #111116 100%)", label: "Alt card" },
          { bg: "#2a2a2a", label: "Inactive / Muted" },
        ].map((l) => (
          <div key={l.label} className="flex items-center gap-2">
            <div style={{ width: 12, height: 12, borderRadius: 3, background: l.bg, border: "1px solid #2a2a2a", flexShrink: 0 }} />
            <span style={{ fontFamily: F, fontSize: "0.5625rem", fontWeight: 600, color: "#333", letterSpacing: "0.08em", textTransform: "uppercase" }}>
              {l.label}
            </span>
          </div>
        ))}

        {/* Nav flow */}
        <div className="ml-auto flex items-center gap-2">
          <span style={{ fontFamily: F, fontSize: "0.5625rem", fontWeight: 700, color: "#333", letterSpacing: "0.1em", textTransform: "uppercase" }}>
            S1 → S2 → S3/S4 &nbsp;·&nbsp; S1 → S5 → S6 &nbsp;·&nbsp; S9 → S10
          </span>
        </div>
      </div>
    </div>
  );
}
