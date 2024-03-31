import {
  pgTable,
  text,
  uuid,
} from 'drizzle-orm/pg-core'
import { createBaseColumns } from '@/utils/create-base-columns';
import { createSoftDeleteColumns } from '@/utils/create-soft-delete-columns';

export const posts = pgTable("post", {
  ...createBaseColumns(),
  ...createSoftDeleteColumns(),
  title: text("title").notNull(),
});

export function hasLinkToPost() {
  return {
    postId: uuid('postId').notNull().references(() => posts.id),
  }
}