import { handlers } from "@/auth"
import { type NextRequest } from "next/server"

export const GET = async (req: NextRequest) => {
  return handlers.GET(req);
}

export const POST = async (req: NextRequest) => {
  return handlers.POST(req);
}