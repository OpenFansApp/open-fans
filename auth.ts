import NextAuth from "next-auth";
import Patreon from "@auth/core/providers/patreon"
import { drizzleAdapter } from "./utils/drizzle-adapter";

export const { handlers, auth } = NextAuth((req) => {
  return { 
    adapter: drizzleAdapter(),
    providers: [
      Patreon({
        clientId: process.env.PATREON_CLIENT_ID,
        clientSecret: process.env.PATREON_CLIENT_SECRET
      }),
    ],
  };
})