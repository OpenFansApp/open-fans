import {
  pgTable, uuid,
} from 'drizzle-orm/pg-core'
import { createBaseColumns } from '@/utils/create-base-columns';
import { createSoftDeleteColumns } from '@/utils/create-soft-delete-columns';
import { createNameColumn } from '@/utils/create-name-column';

export const tiers = pgTable("tier", {
  ...createBaseColumns(),
  ...createSoftDeleteColumns(),
  ...createNameColumn(),
  // include: uuid("include").references(() => tiers?.id),
});

export function hasLinkToTier() {
  return {
    tierId: uuid('tierId').notNull().references(() => tiers.id),
  }
}
