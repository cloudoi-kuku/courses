export interface Course {
  id: string;
  title: string;
  description: string;
  thumbnail_url: string;
  category: string;
  level: 'beginner' | 'intermediate' | 'advanced';
  duration: number;
  created_at: string;
  updated_at: string;
}

export interface Lesson {
  id: string;
  course_id: string;
  title: string;
  content: string;
  order: number;
  video_url?: string;
  created_at: string;
}

export interface UserProgress {
  user_id: string;
  course_id: string;
  lesson_id: string;
  completed: boolean;
  last_accessed: string;
}
