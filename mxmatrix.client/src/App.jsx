import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import './App.css';
import SwitchList from "./components/SwitchList";
import Gallery from "./components/Gallery";
import SwitchDetails from './components/SwitchDetails';
import NavBar from './components/NavBar';

function App() {
    return (
        <>          
            <Router>
                <NavBar />
                <Routes>
                    <Route path="/" element={<Gallery />} />

                    <Route path="/switchdetails/:id" element={<SwitchDetails />} />

                </Routes>
            </Router>
        </>

    );
}

export default App;