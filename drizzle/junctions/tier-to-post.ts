import { pgTable } from "drizzle-orm/pg-core";
import { hasLinkToPost } from "../posts";
import { hasLinkToTier } from "../tiers";

export const tierToPost = pgTable('tierToPost', {
  ...hasLinkToPost(),
  ...hasLinkToTier(),
});