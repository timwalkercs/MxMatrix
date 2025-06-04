import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import './App.css';
import Home from './components/Home';
import Gallery from "./components/Gallery";
import LearnMore from "./components/LearnMore";
import SwitchDetails from './components/SwitchDetails';
import NavBar from './components/NavBar';
import Footer from './components/Footer';
import ScrollToTop from './components/ScrollToTop';

function App() {
    return (
        <div className="app-container">          
            <Router>
                <NavBar />
                <Routes>
                    <Route path="/" element={<Home />} />
                    <Route path="/gallery" element={<Gallery />} />
                    <Route path="/learnmore" element={<LearnMore />} />
                    <Route path="/switchdetails/:id" element={<SwitchDetails />} />
                </Routes>
                <Footer />
                <ScrollToTop />
            </Router>
        </div>

    );
}

export default App;