import { pgTable } from "drizzle-orm/pg-core";
import { hasLinkToPost } from "../posts";
import { hasLinkToTag } from "../tags";

export const postToTag = pgTable('postToTag', {
  ...hasLinkToPost(),
  ...hasLinkToTag(),
});