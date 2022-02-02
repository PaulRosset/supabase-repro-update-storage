import { createClient } from "@supabase/supabase-js";

// Those variables are populated inside Vercel deploy helper
const supabaseUrl = "http://localhost:54321";
const supabaseAnonKey =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiJ9.ZopqoUt20nEV9cklpv9e3yw3PVyZLmKs5qLD6nGL1SI";

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
