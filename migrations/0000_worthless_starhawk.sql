CREATE TABLE IF NOT EXISTS "account" (
	"userId" uuid NOT NULL,
	"type" text NOT NULL,
	"provider" text NOT NULL,
	"providerAccountId" text NOT NULL,
	"refresh_token" text,
	"access_token" text,
	"expires_at" integer,
	"token_type" text,
	"scope" text,
	"id_token" text,
	"session_state" text,
	CONSTRAINT "account_provider_providerAccountId_pk" PRIMARY KEY("provider","providerAccountId")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "component" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL,
	"deletedAt" timestamp,
	"deleted" boolean DEFAULT false NOT NULL,
	"name" varchar(256) NOT NULL,
	"postId" uuid NOT NULL,
	"type" varchar(256) NOT NULL,
	"order" integer NOT NULL,
	"data" json NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "groupPermissionToSystem" (
	"groupId" uuid NOT NULL,
	"permissionId" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "group" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL,
	"deletedAt" timestamp,
	"deleted" boolean DEFAULT false NOT NULL,
	"name" varchar(256) NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "permission" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL,
	"deletedAt" timestamp,
	"deleted" boolean DEFAULT false NOT NULL,
	"name" varchar(256) NOT NULL,
	"read" boolean DEFAULT false NOT NULL,
	"write" boolean DEFAULT false NOT NULL,
	"delete" boolean DEFAULT false NOT NULL,
	"expiration" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "postToTag" (
	"postId" uuid NOT NULL,
	"tagId" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "post" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL,
	"deletedAt" timestamp,
	"deleted" boolean DEFAULT false NOT NULL,
	"title" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "session" (
	"sessionToken" text PRIMARY KEY NOT NULL,
	"userId" uuid NOT NULL,
	"expires" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "tag" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL,
	"deletedAt" timestamp,
	"deleted" boolean DEFAULT false NOT NULL,
	"name" varchar(256) NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "tierToPost" (
	"postId" uuid NOT NULL,
	"tierId" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "tier" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL,
	"deletedAt" timestamp,
	"deleted" boolean DEFAULT false NOT NULL,
	"name" varchar(256) NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "userPermissionToSystem" (
	"userId" uuid NOT NULL,
	"permissionId" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "UserPermissionToTier" (
	"tierId" uuid NOT NULL,
	"userId" uuid NOT NULL,
	"permissionId" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "userToGroup" (
	"userId" uuid NOT NULL,
	"groupId" uuid NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL,
	"deletedAt" timestamp,
	"deleted" boolean DEFAULT false NOT NULL,
	"name" varchar(256) NOT NULL,
	"fullName" text,
	"email" text NOT NULL,
	"emailVerified" timestamp,
	"image" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "verificationToken" (
	"identifier" uuid NOT NULL,
	"token" text NOT NULL,
	"expires" timestamp NOT NULL,
	CONSTRAINT "verificationToken_identifier_token_pk" PRIMARY KEY("identifier","token")
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "account" ADD CONSTRAINT "account_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "component" ADD CONSTRAINT "component_postId_post_id_fk" FOREIGN KEY ("postId") REFERENCES "post"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "groupPermissionToSystem" ADD CONSTRAINT "groupPermissionToSystem_groupId_group_id_fk" FOREIGN KEY ("groupId") REFERENCES "group"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "groupPermissionToSystem" ADD CONSTRAINT "groupPermissionToSystem_permissionId_permission_id_fk" FOREIGN KEY ("permissionId") REFERENCES "permission"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "postToTag" ADD CONSTRAINT "postToTag_postId_post_id_fk" FOREIGN KEY ("postId") REFERENCES "post"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "postToTag" ADD CONSTRAINT "postToTag_tagId_tag_id_fk" FOREIGN KEY ("tagId") REFERENCES "tag"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "session" ADD CONSTRAINT "session_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "tierToPost" ADD CONSTRAINT "tierToPost_postId_post_id_fk" FOREIGN KEY ("postId") REFERENCES "post"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "tierToPost" ADD CONSTRAINT "tierToPost_tierId_tier_id_fk" FOREIGN KEY ("tierId") REFERENCES "tier"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "userPermissionToSystem" ADD CONSTRAINT "userPermissionToSystem_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "userPermissionToSystem" ADD CONSTRAINT "userPermissionToSystem_permissionId_permission_id_fk" FOREIGN KEY ("permissionId") REFERENCES "permission"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "UserPermissionToTier" ADD CONSTRAINT "UserPermissionToTier_tierId_tier_id_fk" FOREIGN KEY ("tierId") REFERENCES "tier"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "UserPermissionToTier" ADD CONSTRAINT "UserPermissionToTier_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "UserPermissionToTier" ADD CONSTRAINT "UserPermissionToTier_permissionId_permission_id_fk" FOREIGN KEY ("permissionId") REFERENCES "permission"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "userToGroup" ADD CONSTRAINT "userToGroup_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "userToGroup" ADD CONSTRAINT "userToGroup_groupId_group_id_fk" FOREIGN KEY ("groupId") REFERENCES "group"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
