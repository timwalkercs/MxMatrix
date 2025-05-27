import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import './App.css';
import Home from './components/Home';
import Gallery from "./components/Gallery";
import LearnMore from "./components/LearnMore";
import SwitchDetails from './components/SwitchDetails';
import NavBar from './components/NavBar';

function App() {
    return (
        <>          
            <Router>
                <NavBar />
                <Routes>
                    <Route path="/" element={<Home />} />
                    <Route path="/gallery" element={<Gallery />} />
                    <Route path="/learnmore" element={<LearnMore />} />
                    <Route path="/switchdetails/:id" element={<SwitchDetails />} />
                </Routes>
            </Router>
        </>

    );
}

export default App;