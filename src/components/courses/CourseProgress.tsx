import { useQuery } from '@tanstack/react-query';
import { Progress } from 'lucide-react';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../hooks/useAuth';

interface CourseProgressProps {
  courseId: string;
}

export function CourseProgress({ courseId }: CourseProgressProps) {
  const { user } = useAuth();

  const { data: progress } = useQuery({
    queryKey: ['courseProgress', courseId, user?.id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('user_progress')
        .select('completed')
        .eq('course_id', courseId)
        .eq('user_id', user?.id);

      if (error) throw error;
      return {
        completedLessons: data.filter(p => p.completed).length,
        totalLessons: data.length
      };
    },
    enabled: !!user
  });

  const percentage = progress 
    ? Math.round((progress.completedLessons / progress.totalLessons) * 100)
    : 0;

  return (
    <div className="mt-4">
      <div className="flex items-center justify-between mb-2">
        <span className="text-sm font-medium text-gray-700">Course Progress</span>
        <span className="text-sm font-medium text-gray-700">{percentage}%</span>
      </div>
      <div className="w-full bg-gray-200 rounded-full h-2.5">
        <div 
          className="bg-indigo-600 h-2.5 rounded-full transition-all duration-300" 
          style={{ width: `${percentage}%` }}
        />
      </div>
    </div>
  );
}
