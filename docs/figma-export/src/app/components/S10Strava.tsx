import { useState } from "react";
import { RefreshCw, Unlink, CheckCircle, AlertCircle } from "lucide-react";
import { F, FC, G, StatusBar, Card, BackHeader } from "./shared";

export function S10Strava() {
  const [connected, setConnected] = useState(true);

  return (
    <div className="flex flex-col h-full bg-background">
      <StatusBar />
      <BackHeader title="Strava Connection" />

      <div className="flex-1 overflow-y-auto px-5 pb-6" style={{ scrollbarWidth: "none" }}>

        {/* Strava brand card */}
        <Card
          className="px-5 py-5 mb-5 flex flex-col items-center text-center"
          gradient="linear-gradient(145deg, #20202c 0%, #101018 100%)"
          style={{ border: "1px solid #2e2e42" }}
        >
          {/* Strava logo placeholder */}
          <div
            className="rounded-2xl flex items-center justify-center mb-4"
            style={{ width: 64, height: 64, background: "linear-gradient(135deg, #2e2e48 0%, #1a1a2e 100%)", border: "1px solid #3a3a52" }}
          >
            <svg width="32" height="32" viewBox="0 0 40 40" fill="none">
              <path d="M16 6L8 24H14L16 18L18 24H24L16 6Z" fill="#e8e8e8" />
              <path d="M24 18L21 24H27L30 30L33 24H39L30 6L24 18Z" fill="#aaa" />
            </svg>
          </div>
          <h2 className="text-foreground" style={{ fontFamily: FC, fontSize: "1.25rem", fontWeight: 800 }}>Strava</h2>
          <p className="text-muted-foreground text-xs mt-1 max-w-[200px]" style={{ fontFamily: F }}>
            Sync your activities and track performance across platforms
          </p>
        </Card>

        {connected ? (
          <>
            {/* Connection status */}
            <Card className="px-4 py-4 mb-4" gradient={G.card}>
              <div className="flex items-center gap-3 mb-4 pb-4 border-b border-border">
                <div className="flex items-center justify-center rounded-full" style={{ width: 32, height: 32, background: "#1a2a1a", border: "1px solid #2a3a2a" }}>
                  <CheckCircle size={16} className="text-foreground" />
                </div>
                <div className="flex-1">
                  <p className="text-foreground text-sm font-bold" style={{ fontFamily: F }}>Connected</p>
                  <p className="text-muted-foreground text-[10px] mt-0.5" style={{ fontFamily: F }}>marcus.elliot@strava.com</p>
                </div>
                <div className="h-2 w-2 rounded-full" style={{ background: "#4a4" }} />
              </div>
              <div className="flex flex-col gap-3">
                {[
                  { label: "Last sync",          value: "Today 07:52 AM" },
                  { label: "Activities imported", value: "148" },
                  { label: "Auto-sync",           value: "Enabled" },
                ].map((row) => (
                  <div key={row.label} className="flex items-center justify-between">
                    <span className="text-muted-foreground text-xs font-medium" style={{ fontFamily: F }}>{row.label}</span>
                    <span className="text-foreground text-xs font-bold" style={{ fontFamily: FC }}>{row.value}</span>
                  </div>
                ))}
              </div>
            </Card>

            {/* Sync now */}
            <button
              className="w-full flex items-center justify-center gap-2.5 rounded-xl mb-3"
              style={{ height: 52, background: G.accent, color: "#0a0a0a", fontFamily: FC, fontSize: "0.9375rem", fontWeight: 800, letterSpacing: "0.06em" }}
            >
              <RefreshCw size={17} />
              Sync Now
            </button>

            {/* Last sync info */}
            <p className="text-muted-foreground text-[10px] text-center mb-6" style={{ fontFamily: F }}>
              Last synced · Today at 07:52 AM · 3 new activities
            </p>

            {/* Recent imports */}
            <p className="text-muted-foreground text-[10px] font-bold uppercase tracking-widest mb-3" style={{ fontFamily: F }}>
              Recently Imported
            </p>
            <div className="flex flex-col gap-2 mb-6">
              {[
                { name: "Morning Run",     date: "Today",        dist: "8.4 km", src: "Strava" },
                { name: "Afternoon Ride",  date: "Mon, Jun 9",   dist: "34.2 km", src: "Strava" },
                { name: "Weekend Trail",   date: "Sat, Jun 7",   dist: "12.3 km", src: "Strava" },
              ].map((a, i) => (
                <Card key={i} className="px-4 py-3 flex items-center justify-between" gradient={G.card}>
                  <div>
                    <p className="text-foreground text-sm font-semibold" style={{ fontFamily: F }}>{a.name}</p>
                    <p className="text-muted-foreground text-[10px] mt-0.5" style={{ fontFamily: F }}>{a.date} · {a.dist}</p>
                  </div>
                  <span
                    className="text-[9px] font-bold uppercase tracking-wider px-2 py-0.5 rounded-full"
                    style={{ fontFamily: F, background: "#1e1e2e", color: "#666", border: "1px solid #2a2a3a" }}
                  >
                    {a.src}
                  </span>
                </Card>
              ))}
            </div>

            {/* Disconnect */}
            <button
              onClick={() => setConnected(false)}
              className="w-full flex items-center justify-center gap-2 rounded-xl py-3.5"
              style={{ background: "#1a1010", border: "1px solid #2e1e1e" }}
            >
              <Unlink size={14} className="text-muted-foreground" />
              <span className="text-muted-foreground text-sm font-semibold uppercase tracking-wider" style={{ fontFamily: F }}>Disconnect Account</span>
            </button>
          </>
        ) : (
          <>
            {/* Disconnected state */}
            <Card className="px-4 py-4 mb-5 flex items-center gap-3" gradient={G.card} style={{ border: "1px solid #2e2020" }}>
              <AlertCircle size={18} className="text-muted-foreground shrink-0" />
              <div>
                <p className="text-foreground text-sm font-bold" style={{ fontFamily: F }}>Not connected</p>
                <p className="text-muted-foreground text-[10px] mt-0.5" style={{ fontFamily: F }}>
                  Connect your Strava account to sync activities automatically.
                </p>
              </div>
            </Card>

            {/* Benefits */}
            <p className="text-muted-foreground text-[10px] font-bold uppercase tracking-widest mb-3" style={{ fontFamily: F }}>
              What you get
            </p>
            <div className="flex flex-col gap-2 mb-6">
              {[
                "Automatic activity import after each workout",
                "Sync personal records and performance data",
                "Keep all stats in one place",
                "No manual entry needed",
              ].map((b, i) => (
                <div key={i} className="flex items-start gap-3">
                  <CheckCircle size={14} className="text-foreground shrink-0 mt-0.5" />
                  <p className="text-foreground text-sm" style={{ fontFamily: F }}>{b}</p>
                </div>
              ))}
            </div>

            {/* Connect button */}
            <button
              onClick={() => setConnected(true)}
              className="w-full flex items-center justify-center gap-2.5 rounded-xl"
              style={{ height: 52, background: G.accent, color: "#0a0a0a", fontFamily: FC, fontSize: "0.9375rem", fontWeight: 800, letterSpacing: "0.06em" }}
            >
              Connect with Strava
            </button>

            <p className="text-muted-foreground text-[10px] text-center mt-3" style={{ fontFamily: F }}>
              You will be redirected to Strava to authorize access
            </p>
          </>
        )}
      </div>
    </div>
  );
}
