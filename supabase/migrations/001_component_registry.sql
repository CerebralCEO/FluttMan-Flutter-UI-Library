-- ComponentRegistry Table Schema for FlutMan Flutter UI Library
-- This is the central brain for our component distribution system

-- Enable UUID extension if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create the ComponentRegistry table
CREATE TABLE IF NOT EXISTS "ComponentRegistry" (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT UNIQUE NOT NULL,
    code TEXT NOT NULL,
    dependencies TEXT[] DEFAULT '{}',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create an index on name for faster lookups
CREATE INDEX IF NOT EXISTS idx_component_registry_name ON "ComponentRegistry"(name);

-- Enable Row Level Security on the table
ALTER TABLE "ComponentRegistry" ENABLE ROW LEVEL SECURITY;

-- Policy: Allow public read access (SELECT) - anyone can fetch components
CREATE POLICY "Allow public read access"
ON "ComponentRegistry"
FOR SELECT
TO PUBLIC
USING (true);

-- Policy: Allow service_role to INSERT components (GitHub Actions pipeline)
CREATE POLICY "Allow service_role insert"
ON "ComponentRegistry"
FOR INSERT
TO service_role
WITH CHECK (true);

-- Policy: Allow service_role to UPDATE components (GitHub Actions pipeline)
CREATE POLICY "Allow service_role update"
ON "ComponentRegistry"
FOR UPDATE
TO service_role
USING (true)
WITH CHECK (true);

-- Policy: Allow service_role to DELETE components (GitHub Actions pipeline)
CREATE POLICY "Allow service_role delete"
ON "ComponentRegistry"
FOR DELETE
TO service_role
USING (true);

-- Create a trigger function to automatically update the updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create a trigger to automatically update updated_at on row update
CREATE TRIGGER update_component_registry_updated_at
    BEFORE UPDATE ON "ComponentRegistry"
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Add helpful comments
COMMENT ON TABLE "ComponentRegistry" IS 'Central registry for FlutMan Flutter UI components. Stores Dart code and metadata.';
COMMENT ON COLUMN "ComponentRegistry".name IS 'Unique component name (e.g., "button", "card")';
COMMENT ON COLUMN "ComponentRegistry".code IS 'Raw Dart source code for the component';
COMMENT ON COLUMN "ComponentRegistry".dependencies IS 'Array of pub.dev package dependencies required by the component';
