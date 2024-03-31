import { boolean, timestamp } from "drizzle-orm/pg-core";

export function createSoftDeleteColumns() {
  return {
    deletedAt: timestamp("deletedAt"),
    deleted: boolean("deleted").default(false).notNull(),
  };
} 