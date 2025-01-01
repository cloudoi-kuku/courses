import { BookOpen, Code, Cloud, Brain } from 'lucide-react';

export function Home() {
  const features = [
    {
      icon: <Cloud className="h-8 w-8 text-indigo-600" />,
      title: 'Cloud Solutions',
      description: 'Master cloud platforms like AWS, Azure, and GCP with hands-on projects.'
    },
    {
      icon: <Brain className="h-8 w-8 text-indigo-600" />,
      title: 'AI & Machine Learning',
      description: 'Learn AI fundamentals, deep learning, and practical ML applications.'
    },
    {
      icon: <Code className="h-8 w-8 text-indigo-600" />,
      title: 'DevOps & Infrastructure',
      description: 'Build scalable infrastructure and automate deployments.'
    }
  ];

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero Section */}
      <div className="relative overflow-hidden">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-24">
          <div className="text-center">
            <h1 className="text-4xl tracking-tight font-extrabold text-gray-900 sm:text-5xl md:text-6xl">
              <span className="block">Master Cloud Computing</span>
              <span className="block text-indigo-600">and AI Development</span>
            </h1>
            <p className="mt-3 max-w-md mx-auto text-base text-gray-500 sm:text-lg md:mt-5 md:text-xl md:max-w-3xl">
              Learn from industry experts and build practical skills in cloud computing, artificial intelligence, and modern development practices.
            </p>
          </div>
        </div>
      </div>

      {/* Features Section */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
        <div className="grid grid-cols-1 gap-8 md:grid-cols-3">
          {features.map((feature, index) => (
            <div key={index} className="bg-white p-6 rounded-lg shadow-md">
              <div className="mb-4">{feature.icon}</div>
              <h3 className="text-lg font-medium text-gray-900 mb-2">{feature.title}</h3>
              <p className="text-gray-500">{feature.description}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
