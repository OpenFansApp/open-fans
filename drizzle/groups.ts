import {
  pgTable, uuid,
} from 'drizzle-orm/pg-core'
import { createBaseColumns } from '@/utils/create-base-columns';
import { createSoftDeleteColumns } from '@/utils/create-soft-delete-columns';
import { createNameColumn } from '@/utils/create-name-column';

export const groups = pgTable("group", {
  ...createBaseColumns(),
  ...createSoftDeleteColumns(),
  ...createNameColumn(),
});

export function hasLinkToGroup() {
  return {
    groupId: uuid('groupId').notNull().references(() => groups.id),
  }
}
