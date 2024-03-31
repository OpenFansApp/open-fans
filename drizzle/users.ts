import {
  pgTable,
  text,
  timestamp,
  uuid,
} from 'drizzle-orm/pg-core'
import { createBaseColumns } from '@/utils/create-base-columns';
import { createSoftDeleteColumns } from '@/utils/create-soft-delete-columns';
import { createNameColumn } from '@/utils/create-name-column';

export const users = pgTable("user", {
  ...createBaseColumns(),
  ...createSoftDeleteColumns(),
  ...createNameColumn(),
  fullName: text("fullName"),
  email: text("email").notNull(),
  emailVerified: timestamp("emailVerified", { mode: "date" }),
  image: text("image"),
});

export function hasLinkToUser() {
  return {
    userId: uuid('userId').notNull().references(() => users.id),
  }
}
