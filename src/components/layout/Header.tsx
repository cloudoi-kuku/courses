import { BookOpen, User } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../hooks/useAuth';

export function Header() {
  const { user, signOut } = useAuth();

  return (
    <header className="bg-white shadow-sm">
      <nav className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
        <Link to="/" className="flex items-center space-x-2">
          <BookOpen className="h-6 w-6 text-indigo-600" />
          <span className="font-bold text-xl">CloudAI Learn</span>
        </Link>
        
        <div className="flex items-center space-x-4">
          <Link to="/courses" className="text-gray-700 hover:text-indigo-600">Courses</Link>
          {user ? (
            <>
              <Link to="/dashboard" className="text-gray-700 hover:text-indigo-600">Dashboard</Link>
              <Link to="/admin" className="text-gray-700 hover:text-indigo-600">Admin</Link>
              <button onClick={signOut} className="text-gray-700 hover:text-indigo-600">Sign Out</button>
              <Link to="/profile" className="p-2 rounded-full bg-gray-100">
                <User className="h-5 w-5 text-gray-600" />
              </Link>
            </>
          ) : (
            <Link to="/login" className="bg-indigo-600 text-white px-4 py-2 rounded-md hover:bg-indigo-700">
              Sign In
            </Link>
          )}
        </div>
      </nav>
    </header>
  );
}
