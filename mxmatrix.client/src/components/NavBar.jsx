import { Link } from 'react-router-dom';
import './NavBar.css';
import logo from '../assets/LogoIcon.png';

function NavBar() {
    return (
        <nav className="navbar">
            <div className="nav-center">
                <Link to="/">
                    <img src={logo} alt="Logo" className="nav-logo" />
                </Link>
            </div>
        </nav>
    );
}

export default NavBar;
