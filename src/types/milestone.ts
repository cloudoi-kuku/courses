export interface Milestone {
  id: string;
  course_id: string;
  title: string;
  description: string;
  order: number;
  points_required: number;
  badge_url?: string;
}

export interface Achievement {
  id: string;
  user_id: string;
  milestone_id: string;
  completed_at: string;
  points_earned: number;
}
