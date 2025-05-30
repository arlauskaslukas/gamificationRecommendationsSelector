import React from "react";
const Navbar = () => {
  return (
    <nav className="w-full bg-white shadow-md py-4 px-6 flex items-center justify-between">
      <div className="text-xl font-bold text-gray-800">
        Gamification recommendations determination
      </div>
      <div className="flex gap-6">
        <a
          href="/"
          className="text-gray-700 hover:text-blue-600 transition font-medium"
        >
          Home
        </a>
        <a
          href="/saved"
          className="text-gray-700 hover:text-blue-600 transition font-medium"
        >
          Saved Results
        </a>
      </div>
    </nav>
  );
};

export default Navbar;
