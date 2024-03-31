import { varchar } from "drizzle-orm/pg-core";

export function createNameColumn() {
  return {
    name: varchar("name", { length: 256 }).notNull(),
  };
} 