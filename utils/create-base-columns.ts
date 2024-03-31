import { timestamp, uuid } from "drizzle-orm/pg-core";

export function createBaseColumns() {
  return {
    id: uuid("id").defaultRandom().notNull().primaryKey(),
    createdAt: timestamp("createdAt").defaultNow().notNull(),
    updatedAt: timestamp("updatedAt").defaultNow().notNull(),
  };
} 