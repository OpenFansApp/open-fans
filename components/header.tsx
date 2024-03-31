'use client';

import { signIn, signOut, useSession } from "next-auth/react";

export function Header() {
  const session = useSession();

  return (
    <header className="flex lg:w-10/12 mx-auto py-2 flex-row items-center justify-between">
      <div className="flex flex-row items-center justify-between">
        <div className="flex flex-row items-center">
          LOGO
        </div>
      </div>
      <div id="header-actions" className="flex flex-row">
        {
          session.data ? (
            <>
              <button
                className="font-sans px-4 py-3 border-b border rounded-xl backdrop-blur-2xl border-neutral-800 hover:bg-slate-900"
                onClick={() => signOut()}
              >
                Sign Out
              </button>
              <img
                src={session.data?.user?.image ?? "/avatar.png"}
                alt="User Image"
                className="rounded-full flex-shrink-0 w-12 h-12 ml-4 flex"
                />
            </>
          ) : (
            <button
              className="font-sans px-4 py-3 border-b border rounded-xl backdrop-blur-2xl border-neutral-800 hover:bg-slate-900"
              onClick={() => signIn("patreon")}
            >
              Sign In
            </button>
          )
        }
      </div>
    </header>
  );
}