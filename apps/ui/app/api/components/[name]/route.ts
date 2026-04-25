import { createClient } from "@supabase/supabase-js";
import { type NextRequest, NextResponse } from "next/server";

// Lazy initialization of Supabase client
function getSupabaseClient() {
  const supabaseUrl =
    process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!supabaseUrl || !supabaseServiceKey) {
    throw new Error(
      "SUPABASE_URL (or NEXT_PUBLIC_SUPABASE_URL) and SUPABASE_SERVICE_ROLE_KEY environment variables are required",
    );
  }

  return createClient(supabaseUrl, supabaseServiceKey, {
    auth: {
      persistSession: false,
      autoRefreshToken: false,
    },
  });
}

export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ name: string }> },
) {
  try {
    const resolvedParams = await params;
    const name = resolvedParams.name;

    // Initialize Supabase client lazily
    const supabase = getSupabaseClient();

    // Query the ComponentRegistry table in Supabase
    const { data: component, error } = await supabase
      .from("ComponentRegistry")
      .select("name, code, dependencies")
      .eq("name", name)
      .single();

    if (error) {
      console.error("Supabase error:", error);
      return NextResponse.json(
        { error: `Component '${name}' not found` },
        { status: 404 },
      );
    }

    if (!component) {
      return NextResponse.json(
        { error: `Component '${name}' not found` },
        { status: 404 },
      );
    }

    // Return the response
    return NextResponse.json({
      name: component.name,
      code: component.code,
      dependencies: component.dependencies,
    });
  } catch (error) {
    console.error("API Error:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 },
    );
  }
}
