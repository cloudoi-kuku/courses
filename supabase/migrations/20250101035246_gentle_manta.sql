/*
  # Milestones and Achievements Schema

  1. Tables Created:
    - milestones (course milestones)
    - achievements (user achievements)
  
  2. Security:
    - RLS enabled on all tables
    - Read access policies for authenticated users
    - User achievements insert policies
*/

-- Create milestones table
CREATE TABLE IF NOT EXISTS milestones (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  course_id uuid REFERENCES courses(id),
  title text NOT NULL,
  description text NOT NULL,
  order_number integer NOT NULL,
  points_required integer NOT NULL,
  badge_url text,
  created_at timestamptz DEFAULT now()
);

-- Create achievements table
CREATE TABLE IF NOT EXISTS achievements (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id),
  milestone_id uuid REFERENCES milestones(id),
  completed_at timestamptz DEFAULT now(),
  points_earned integer NOT NULL,
  created_at timestamptz DEFAULT now(),
  UNIQUE(user_id, milestone_id)
);

-- Enable Row Level Security
ALTER TABLE milestones ENABLE ROW LEVEL SECURITY;
ALTER TABLE achievements ENABLE ROW LEVEL SECURITY;

-- Policies
CREATE POLICY "Anyone can view milestones"
  ON milestones FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Users can view their own achievements"
  ON achievements FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own achievements"
  ON achievements FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);
