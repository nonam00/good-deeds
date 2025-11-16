import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { MainPage } from '@/pages/main';
import './styles/globals.css';

function App() {
  return (
    <Router basename="/good-deeds">
      <Routes>
        <Route path="/" element={<MainPage />} />
      </Routes>
    </Router>
  );
}

export default App;