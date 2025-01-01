/*
  # Categories Setup

  1. Table
    - Creates categories table if it doesn't exist
  
  2. Security
    - Enables RLS
    - Adds view policy (with existence check)
  
  3. Sample Data
    - Adds initial category entries
*/

-- Create categories table if it doesn't exist
CREATE TABLE IF NOT EXISTS categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text,
  created_at timestamptz DEFAULT now()
);

-- Enable RLS on categories
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;

-- Create policy for categories (only if it doesn't exist)
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'categories' 
    AND policyname = 'Anyone can view categories'
  ) THEN
    CREATE POLICY "Anyone can view categories"
      ON categories FOR SELECT
      TO authenticated
      USING (true);
  END IF;
END $$;

-- Insert sample categories if none exist
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM categories LIMIT 1) THEN
    INSERT INTO categories (name, description) VALUES
    ('Cloud Computing', 'Learn cloud platforms and infrastructure'),
    ('Artificial Intelligence', 'Explore AI and machine learning concepts'),
    ('DevOps', 'Master development operations and automation');
  END IF;
END $$;
