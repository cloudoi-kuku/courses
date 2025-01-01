import { Award, CheckCircle } from 'lucide-react';
import { Milestone } from '../../types/milestone';

interface MilestoneCardProps {
  milestone: Milestone;
  isCompleted: boolean;
  currentPoints: number;
}

export function MilestoneCard({ milestone, isCompleted, currentPoints }: MilestoneCardProps) {
  const isUnlocked = currentPoints >= milestone.points_required;

  return (
    <div className={`p-4 rounded-lg border ${
      isCompleted 
        ? 'bg-green-50 border-green-200' 
        : isUnlocked 
          ? 'bg-white border-indigo-200' 
          : 'bg-gray-50 border-gray-200'
    }`}>
      <div className="flex items-start justify-between">
        <div className="flex-1">
          <h3 className="text-lg font-semibold text-gray-900 mb-1">
            {milestone.title}
          </h3>
          <p className="text-sm text-gray-600">{milestone.description}</p>
          <div className="mt-2 flex items-center text-sm">
            <Award className="h-4 w-4 mr-1 text-indigo-600" />
            <span>{milestone.points_required} points required</span>
          </div>
        </div>
        {isCompleted && (
          <CheckCircle className="h-6 w-6 text-green-500 flex-shrink-0" />
        )}
      </div>
      {milestone.badge_url && (
        <img 
          src={milestone.badge_url} 
          alt={`${milestone.title} badge`}
          className="w-12 h-12 mt-2"
        />
      )}
    </div>
  );
}
