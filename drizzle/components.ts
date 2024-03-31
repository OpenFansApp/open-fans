import {
  integer,
  json,
  pgTable,
  uuid,
  varchar,
} from 'drizzle-orm/pg-core'
import { createBaseColumns } from '@/utils/create-base-columns';
import { createSoftDeleteColumns } from '@/utils/create-soft-delete-columns';
import { createNameColumn } from '@/utils/create-name-column';
import { hasLinkToPost } from './posts';

export const components = pgTable("component", {
  ...createBaseColumns(),
  ...createSoftDeleteColumns(),
  ...createNameColumn(),
  ...hasLinkToPost(),
  type: varchar("type", { length: 256 }).notNull(),
  order: integer("order").notNull(),
  data: json("data").notNull(),
});

export function hasLinkToComponent() {
  return {
    componentId: uuid('componentId').notNull().references(() => components.id),
  }
}