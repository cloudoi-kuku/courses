/*
  # Generative AI Course Data

  1. Categories
    - Adds a "Generative AI" category
  
  2. Courses
    - Adds a "Generative AI, RAG, and AI Agents" course
  
  3. Lessons
    - Adds initial lessons for the course
  
  4. Milestones
    - Adds milestones for the course
*/

-- Insert Generative AI category if it doesn't exist
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Generative AI') THEN
    INSERT INTO categories (name, description) VALUES
    ('Generative AI', 'Explore generative AI models, RAG, and AI agents.');
  END IF;
END $$;

-- Insert Generative AI course if it doesn't exist
DO $$
DECLARE
  category_id uuid;
BEGIN
  SELECT id INTO category_id FROM categories WHERE name = 'Generative AI';
  IF NOT EXISTS (SELECT 1 FROM courses WHERE title = 'Generative AI, RAG, and AI Agents') THEN
    INSERT INTO courses (title, description, category_id, level, duration, thumbnail_url) VALUES
    (
      'Generative AI, RAG, and AI Agents',
      'Master generative AI models, retrieval-augmented generation, and AI agents.',
      category_id,
      'advanced',
      40,
      'https://images.unsplash.com/photo-1588267891707-410514488880?auto=format&fit=crop&w=800&q=80'
    );
  END IF;
END $$;

-- Insert lessons for the Generative AI course
DO $$
DECLARE
  course_id uuid;
BEGIN
  SELECT id INTO course_id FROM courses WHERE title = 'Generative AI, RAG, and AI Agents';
  
  IF NOT EXISTS (SELECT 1 FROM lessons WHERE course_id = course_id) THEN
    INSERT INTO lessons (course_id, title, content, order_number) VALUES
      (course_id, 'Introduction to Generative AI', 'Overview of generative models and their applications.', 1),
      (course_id, 'Generative Adversarial Networks (GANs)', 'Deep dive into GAN architectures and training.', 2),
      (course_id, 'Variational Autoencoders (VAEs)', 'Understanding VAEs and their use in generative tasks.', 3),
      (course_id, 'Transformer Models for Generation', 'Using transformers for text and image generation.', 4),
      (course_id, 'Introduction to RAG', 'Overview of Retrieval-Augmented Generation.', 5),
      (course_id, 'Building a RAG System', 'Implementing a RAG system with vector databases.', 6),
      (course_id, 'Advanced RAG Techniques', 'Exploring advanced RAG strategies.', 7),
      (course_id, 'Introduction to AI Agents', 'Overview of AI agents and their capabilities.', 8),
      (course_id, 'Building Simple AI Agents', 'Creating basic AI agents with decision-making.', 9),
      (course_id, 'Advanced AI Agent Architectures', 'Exploring complex AI agent architectures.', 10),
      (course_id, 'Practical Applications of Generative AI', 'Real-world use cases of generative AI.', 11),
      (course_id, 'Practical Applications of RAG', 'Real-world use cases of RAG.', 12),
      (course_id, 'Practical Applications of AI Agents', 'Real-world use cases of AI Agents.', 13);
  END IF;
END $$;

-- Insert milestones for the Generative AI course
DO $$
DECLARE
  course_id uuid;
BEGIN
  SELECT id INTO course_id FROM courses WHERE title = 'Generative AI, RAG, and AI Agents';
  
  IF NOT EXISTS (SELECT 1 FROM milestones WHERE course_id = course_id) THEN
    INSERT INTO milestones (course_id, title, description, order_number, points_required, badge_url) VALUES
      (course_id, 'Generative AI Fundamentals', 'Understand the basics of generative models.', 1, 100, 'https://images.unsplash.com/photo-1588267891707-410514488880?auto=format&fit=crop&w=100&q=80'),
      (course_id, 'GANs and VAEs Mastery', 'Master GANs and VAEs for generative tasks.', 2, 200, 'https://images.unsplash.com/photo-1588267891707-410514488880?auto=format&fit=crop&w=100&q=80'),
      (course_id, 'Transformer Models', 'Use transformers for text and image generation.', 3, 300, 'https://images.unsplash.com/photo-1588267891707-410514488880?auto=format&fit=crop&w=100&q=80'),
      (course_id, 'RAG System Implementation', 'Build a RAG system with vector databases.', 4, 400, 'https://images.unsplash.com/photo-1588267891707-410514488880?auto=format&fit=crop&w=100&q=80'),
      (course_id, 'Advanced RAG Techniques', 'Explore advanced RAG strategies.', 5, 500, 'https://images.unsplash.com/photo-1588267891707-410514488880?auto=format&fit=crop&w=100&q=80'),
      (course_id, 'AI Agent Fundamentals', 'Understand the basics of AI agents.', 6, 600, 'https://images.unsplash.com/photo-1588267891707-410514488880?auto=format&fit=crop&w=100&q=80'),
      (course_id, 'Building AI Agents', 'Create basic AI agents with decision-making.', 7, 700, 'https://images.unsplash.com/photo-1588267891707-410514488880?auto=format&fit=crop&w=100&q=80'),
      (course_id, 'Advanced AI Agent Architectures', 'Explore complex AI agent architectures.', 8, 800, 'https://images.unsplash.com/photo-1588267891707-410514488880?auto=format&fit=crop&w=100&q=80'),
      (course_id, 'Generative AI Applications', 'Apply generative AI in real-world scenarios.', 9, 900, 'https://images.unsplash.com/photo-1588267891707-410514488880?auto=format&fit=crop&w=100&q=80'),
      (course_id, 'RAG Applications', 'Apply RAG in real-world scenarios.', 10, 1000, 'https://images.unsplash.com/photo-1588267891707-410514488880?auto=format&fit=crop&w=100&q=80'),
      (course_id, 'AI Agent Applications', 'Apply AI agents in real-world scenarios.', 11, 1100, 'https://images.unsplash.com/photo-1588267891707-410514488880?auto=format&fit=crop&w=100&q=80');
  END IF;
END $$;
