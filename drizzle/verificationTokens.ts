import {
  timestamp,
  pgTable,
  text,
  primaryKey,
  uuid,
} from "drizzle-orm/pg-core"

export const verificationTokens = pgTable(
  "verificationToken",
  {
    identifier: uuid("identifier").notNull(),
    token: text("token").notNull(),
    expires: timestamp("expires", { mode: "date" }).notNull(),
  },
  (vt) => ({
    compoundKey: primaryKey({ columns: [vt.identifier, vt.token] }),
  })
);