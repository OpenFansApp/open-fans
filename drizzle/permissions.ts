import { boolean, pgTable, timestamp, uuid } from "drizzle-orm/pg-core";
import { createBaseColumns } from '@/utils/create-base-columns';
import { createSoftDeleteColumns } from '@/utils/create-soft-delete-columns';
import { createNameColumn } from '@/utils/create-name-column';

export const permissions = pgTable("permission", {
  ...createBaseColumns(),
  ...createSoftDeleteColumns(),
  ...createNameColumn(),
  create: boolean("read").notNull().default(false),
  read: boolean("read").notNull().default(false),
  update: boolean("write").notNull().default(false),
  delete: boolean("delete").notNull().default(false),
  expiration: timestamp("expiration", { mode: "date" }),
});

export function hasLinkToPermission() {
  return {
    permissionId: uuid('permissionId').notNull().references(() => permissions.id),
  }
}