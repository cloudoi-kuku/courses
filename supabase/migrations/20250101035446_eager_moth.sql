/*
  # Additional Courses and Lessons

  1. Courses
    - Adds "Cloud Computing Fundamentals" and "Advanced Machine Learning" courses
  
  2. Lessons
    - Adds initial lessons for the new courses
*/

-- Insert Cloud Computing Fundamentals course if it doesn't exist
DO $$
DECLARE
  category_id uuid;
BEGIN
  SELECT id INTO category_id FROM categories WHERE name = 'Cloud Computing';
  IF NOT EXISTS (SELECT 1 FROM courses WHERE title = 'Cloud Computing Fundamentals') THEN
    INSERT INTO courses (title, description, category_id, level, duration, thumbnail_url) VALUES
    (
      'Cloud Computing Fundamentals',
      'Learn the core concepts of cloud computing and its services.',
      category_id,
      'beginner',
      20,
      'https://images.unsplash.com/photo-1517694720214-e4196fbcb78a?auto=format&fit=crop&w=800&q=80'
    );
  END IF;
END $$;

-- Insert Advanced Machine Learning course if it doesn't exist
DO $$
DECLARE
  category_id uuid;
BEGIN
  SELECT id INTO category_id FROM categories WHERE name = 'Artificial Intelligence';
  IF NOT EXISTS (SELECT 1 FROM courses WHERE title = 'Advanced Machine Learning') THEN
    INSERT INTO courses (title, description, category_id, level, duration, thumbnail_url) VALUES
    (
      'Advanced Machine Learning',
      'Explore advanced machine learning techniques and algorithms.',
      category_id,
      'advanced',
      30,
      'https://images.unsplash.com/photo-1555212697-194d092e3b8f?auto=format&fit=crop&w=800&q=80'
    );
  END IF;
END $$;

-- Insert lessons for Cloud Computing Fundamentals course
DO $$
DECLARE
  course_id uuid;
BEGIN
  SELECT id INTO course_id FROM courses WHERE title = 'Cloud Computing Fundamentals';
  
  IF NOT EXISTS (SELECT 1 FROM lessons WHERE course_id = course_id) THEN
    INSERT INTO lessons (course_id, title, content, order_number) VALUES
      (course_id, 'Introduction to Cloud Computing', 'Overview of cloud computing and its benefits.', 1),
      (course_id, 'Cloud Service Models', 'Understanding IaaS, PaaS, and SaaS.', 2),
      (course_id, 'Cloud Deployment Models', 'Exploring public, private, and hybrid clouds.', 3),
      (course_id, 'Core Cloud Services', 'Introduction to compute, storage, and networking services.', 4),
      (course_id, 'Cloud Security Basics', 'Fundamental security practices in the cloud.', 5);
  END IF;
END $$;

-- Insert lessons for Advanced Machine Learning course
DO $$
DECLARE
  course_id uuid;
BEGIN
  SELECT id INTO course_id FROM courses WHERE title = 'Advanced Machine Learning';
  
  IF NOT EXISTS (SELECT 1 FROM lessons WHERE course_id = course_id) THEN
    INSERT INTO lessons (course_id, title, content, order_number) VALUES
      (course_id, 'Advanced Regression Techniques', 'Exploring advanced regression models.', 1),
      (course_id, 'Advanced Classification Techniques', 'Exploring advanced classification models.', 2),
      (course_id, 'Clustering Algorithms', 'Understanding various clustering algorithms.', 3),
      (course_id, 'Dimensionality Reduction', 'Techniques for reducing data dimensionality.', 4),
      (course_id, 'Model Evaluation and Tuning', 'Methods for evaluating and tuning machine learning models.', 5),
      (course_id, 'Deep Learning Architectures', 'Exploring advanced deep learning architectures.', 6),
      (course_id, 'Reinforcement Learning', 'Introduction to reinforcement learning concepts.', 7);
  END IF;
END $$;
