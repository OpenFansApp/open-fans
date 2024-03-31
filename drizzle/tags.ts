import {
  pgTable,
  uuid,
} from 'drizzle-orm/pg-core'
import { createBaseColumns } from '@/utils/create-base-columns';
import { createSoftDeleteColumns } from '@/utils/create-soft-delete-columns';
import { createNameColumn } from '@/utils/create-name-column';

export const tags = pgTable("tag", {
  ...createBaseColumns(),
  ...createSoftDeleteColumns(),
  ...createNameColumn(),
});

export function hasLinkToTag() {
  return {
    tagId: uuid('tagId').notNull().references(() => tags.id),
  }
}