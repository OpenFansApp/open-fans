import { pgTable } from "drizzle-orm/pg-core";
import { hasLinkToTier } from "../tiers";
import { hasLinkToUser } from "../users";
import { hasLinkToPermission } from "../permissions";

export const userPermissionToTier = pgTable('UserPermissionToTier', {
  ...hasLinkToTier(),
  ...hasLinkToUser(),
  ...hasLinkToPermission(),
});