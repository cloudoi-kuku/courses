import { useQuery } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../hooks/useAuth';
import { MilestoneCard } from './MilestoneCard';
import type { Milestone } from '../../types/milestone';

interface MilestoneTrackerProps {
  courseId: string;
}

export function MilestoneTracker({ courseId }: MilestoneTrackerProps) {
  const { user } = useAuth();

  const { data: milestones } = useQuery({
    queryKey: ['milestones', courseId],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('milestones')
        .select('*')
        .eq('course_id', courseId)
        .order('order');

      if (error) throw error;
      return data as Milestone[];
    }
  });

  const { data: userAchievements } = useQuery({
    queryKey: ['achievements', courseId, user?.id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('achievements')
        .select('*')
        .eq('user_id', user?.id);

      if (error) throw error;
      return data;
    },
    enabled: !!user
  });

  const totalPoints = userAchievements?.reduce((sum, a) => sum + a.points_earned, 0) || 0;

  return (
    <div className="space-y-4">
      <div className="bg-white p-4 rounded-lg shadow-sm border border-gray-200">
        <h2 className="text-xl font-semibold text-gray-900 mb-2">Your Progress</h2>
        <p className="text-gray-600">Total Points: {totalPoints}</p>
      </div>
      
      <div className="grid gap-4">
        {milestones?.map((milestone) => (
          <MilestoneCard
            key={milestone.id}
            milestone={milestone}
            isCompleted={userAchievements?.some(a => a.milestone_id === milestone.id) || false}
            currentPoints={totalPoints}
          />
        ))}
      </div>
    </div>
  );
}
